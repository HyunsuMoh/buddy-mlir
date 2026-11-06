# Large Gemmini matmul lowering

128×128 `linalg.matmul`을 Gemmini 명령으로 lowering하면서 타일 분할을
살펴보는 예제입니다. `matmul.mlir`에서 시작해 중간 IR, 어셈블리,
오브젝트와 실행 ELF를 생성합니다.

`generated/`에는 중간 MLIR, LLVM IR과 어셈블리를 포함해 두었으므로
Buddy를 빌드하지 않고도 변환 결과를 읽을 수 있습니다.
아래 스크립트는 이 결과를 재생성합니다. 오브젝트와 ELF 바이너리는 Git에서 제외합니다.

## 준비

- Gemmini 지원 LLVM과 Buddy 도구: `buddy-opt`, `buddy-translate`, `buddy-llc`
- Bash와 ripgrep (`rg`)
- 링크·실행용 Chipyard 툴체인, Gemmini 지원 Spike, RV64 pk

빌드는 [Buddy README](../README.md#build-and-test-llvmmlirclang),
Gemmini 실행 환경 설치는 [Gemmini 문서](https://github.com/ucb-bar/gemmini#quick-start)를
참고하세요. 아래 명령은 저장소 루트 기준이며 `/path/to/...`는 설치 경로로 바꿉니다.

## 1. Lowering과 오브젝트 생성

```bash
bash gemmini-matmul-example/lower.sh
```

기본적으로 `build/bin`의 Buddy 도구를 사용합니다. 다른 빌드라면
`BUDDY_BIN_DIR=/path/to/buddy-build/bin`을 명령 앞에 지정하세요.

결과는 `gemmini-matmul-example/generated/`에 생성됩니다.

| 파일 | 확인할 내용 |
| --- | --- |
| `matmul-01-gemmini.mlir` | `linalg.matmul`이 `gemmini.tile_matmul`로 변환되고 D 버퍼가 추가됨 |
| `matmul-02-intrinsics.mlir` | 타일별 `gemmini.intr.loop_ws_config_*`와 `gemmini.intr.loop_ws` |
| `matmul-03.ll` | LLVM IR과 RISC-V intrinsic 호출 |
| `matmul-04.s` | RISC-V 및 Gemmini 어셈블리 |
| `matmul.o` | ELF 링크에 사용할 오브젝트 |

성공하면 `Generated 4 loop_ws ops (expected 4).`가 출력됩니다.

### 타일 분할 확인

기본 설정은 `dim=16`, `acc_rows=1024`, `bank_rows=4096`입니다.
타일 크기는 16×16 블록 단위로 `(tileI, tileJ, tileK) = (5, 6, 8)`이
선택되며, 외부 타일 수는 `(2, 2, 1)`이므로 `loop_ws`가 4개 생성됩니다.

| 외부 타일 (i0, j0, k0) | 출력 행 범위 | 출력 열 범위 | 블록 수 (i, j, k) |
| --- | --- | --- | --- |
| (0, 0, 0) | 0–79 | 0–95 | (5, 6, 8) |
| (0, 1, 0) | 0–79 | 96–127 | (5, 2, 8) |
| (1, 0, 0) | 80–127 | 0–95 | (3, 6, 8) |
| (1, 1, 0) | 80–127 | 96–127 | (3, 2, 8) |

`matmul-02-intrinsics.mlir`에서 각 `loop_ws_config_bounds`와
`loop_ws_config_addrs_*`의 피연산자를 비교하면 타일별 크기와 주소 변화를
볼 수 있습니다. 각 타일은 K 전체 128을 처리합니다.

## 2. Chipyard 환경 활성화와 ELF 링크

**RISC-V 툴체인이 설치된 Chipyard 환경을 활성화하면 그 안의 GCC와
링커를 사용할 수 있으므로 별도 링커를 설치할 필요가 없습니다.**

```bash
source /path/to/chipyard/env.sh
command -v riscv64-unknown-linux-gnu-gcc
bash gemmini-matmul-example/create_elf.sh
```

Chipyard 설치에서 Conda 초기화가 필요하다면 위 명령 전에 실행합니다.

```bash
source /path/to/conda/etc/profile.d/conda.sh
conda activate your-chipyard-bootstrap-env
```

`create_elf.sh`는 RISC-V GCC를 통해 `matmul.o`와 C 런타임을 정적으로
링크하여 `generated/matmul.elf`를 만듭니다. 이 ELF는 pk에서 실행합니다.

환경 활성화까지 스크립트에 맡기려면 다음처럼 실행할 수도 있습니다.

```bash
CONDA_SH=/path/to/conda/etc/profile.d/conda.sh \
CONDA_ENV=your-chipyard-bootstrap-env \
CHIPYARD_DIR=/path/to/chipyard \
  bash gemmini-matmul-example/create_elf.sh
```

이미 환경이 준비됐다면 위 변수는 필요하지 않습니다. Chipyard 외부의
툴체인을 사용하려면 `RISCV_CC=/path/to/riscv64-unknown-linux-gnu-gcc`를
지정하세요. RV64 하드웨어 부동소수점 ABI와 호환되는 정적 C 라이브러리가 필요합니다.

## 3. Spike 실행

Gemmini 지원 Spike와 pk를 사용할 수 있는 셸에서 실행합니다.
배열 크기는 예제와 같은 `dim=16`을 사용하세요.

```bash
spike --extension=gemmini pk gemmini-matmul-example/generated/matmul.elf
echo $?
```

pk를 찾지 못하면 `pk` 대신 설치된 pk 실행 파일의 경로를 지정하세요.
링크 스크립트 안에서만 환경을 활성화했다면, Spike 실행 전 현재 셸에서도
Chipyard 환경을 활성화해야 합니다.

이 예제는 계산 결과를 출력하지 않습니다. 실행 후 종료 상태 `0`을 확인하세요.
A·B는 1, C와 추가 D 버퍼는 0으로 초기화하며, 결과값 비교는 수행하지 않습니다.
