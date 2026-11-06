#!/usr/bin/env bash
set -euo pipefail
example_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$example_dir/.." && pwd)"
buddy_bin_dir="${BUDDY_BIN_DIR:-$repo_dir/build/bin}"
output_dir="$example_dir/generated"
for tool in buddy-opt buddy-translate buddy-llc; do
  if [[ ! -x "$buddy_bin_dir/$tool" ]]; then
    printf 'Missing tool: %s/%s. Set BUDDY_BIN_DIR to your Buddy bin directory.\n' "$buddy_bin_dir" "$tool" >&2
    exit 1
  fi
done
if ! command -v rg >/dev/null 2>&1; then
  printf 'ripgrep (rg) is required to check the generated tile count.\n' >&2
  exit 1
fi
mkdir -p -- "$output_dir"

"$buddy_bin_dir/buddy-opt" "$example_dir/matmul.mlir" \
  --convert-linalg-to-gemmini -o "$output_dir/matmul-01-gemmini.mlir"
"$buddy_bin_dir/buddy-opt" "$output_dir/matmul-01-gemmini.mlir" \
  --convert-linalg-to-loops --lower-gemmini \
  -o "$output_dir/matmul-02-intrinsics.mlir"
"$buddy_bin_dir/buddy-translate" "$output_dir/matmul-02-intrinsics.mlir" \
  --buddy-to-llvmir -o "$output_dir/matmul-03.ll"
"$buddy_bin_dir/buddy-llc" "$output_dir/matmul-03.ll" \
  -filetype=asm -mtriple=riscv64 -mattr=+xgemmini,+D -float-abi=hard \
  -o "$output_dir/matmul-04.s"
"$buddy_bin_dir/buddy-llc" "$output_dir/matmul-03.ll" \
  -filetype=obj -mtriple=riscv64 -mattr=+xgemmini,+D -float-abi=hard \
  -o "$output_dir/matmul.o"
count=$(rg -c '"gemmini\.intr\.loop_ws"\(' "$output_dir/matmul-02-intrinsics.mlir")
printf 'Generated %s loop_ws ops (expected 4).\n' "$count"
test "$count" -eq 4
