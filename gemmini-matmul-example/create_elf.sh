#!/usr/bin/env bash
set -euo pipefail
example_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
output_dir="$example_dir/generated"
riscv_cc="${RISCV_CC:-riscv64-unknown-linux-gnu-gcc}"

if [[ ! -f "$output_dir/matmul.o" ]]; then
  printf 'Run bash %s/lower.sh first.\n' "$example_dir" >&2
  exit 1
fi
# Environment activation is optional and uses explicitly supplied paths only.
# Third-party activation scripts may inspect unset optional variables.
if [[ -n "${CONDA_SH:-}" || -n "${CONDA_ENV:-}" || -n "${CHIPYARD_DIR:-}" ]]; then
  if [[ -n "${CONDA_SH:-}" && ! -f "$CONDA_SH" ]]; then
    printf 'Conda initialization script not found: %s\n' "$CONDA_SH" >&2
    exit 1
  fi
  if [[ -n "${CHIPYARD_DIR:-}" && ! -f "$CHIPYARD_DIR/env.sh" ]]; then
    printf 'Chipyard env.sh not found under: %s\n' "$CHIPYARD_DIR" >&2
    exit 1
  fi
  set +u
  if [[ -n "${CONDA_SH:-}" ]]; then
    source "$CONDA_SH"
  fi
  if [[ -n "${CONDA_ENV:-}" ]]; then
    conda activate "$CONDA_ENV"
  fi
  if [[ -n "${CHIPYARD_DIR:-}" ]]; then
    source "$CHIPYARD_DIR/env.sh"
  fi
  set -u
fi

if ! command -v "$riscv_cc" >/dev/null 2>&1; then
  printf 'RISC-V compiler not found: %s. Set PATH or RISCV_CC.\n' "$riscv_cc" >&2
  exit 1
fi

"$riscv_cc" "$output_dir/matmul.o" -static -o "$output_dir/matmul.elf"
