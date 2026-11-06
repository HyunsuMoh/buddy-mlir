// Bufferized Linalg input for observing 128x128 Gemmini matmul tiling.
// MatmulLowering creates a zero-filled i32 D buffer.
// Default lowering emits four gemmini.intr.loop_ws ops.
func.func @main() -> i8 {
  %zero = arith.constant 0 : i8
  %one = arith.constant 1 : i8
  %a = memref.alloc() : memref<128x128xi8>
  %b = memref.alloc() : memref<128x128xi8>
  %c = memref.alloc() : memref<128x128xi8>
  linalg.fill ins(%one : i8) outs(%a : memref<128x128xi8>)
  linalg.fill ins(%one : i8) outs(%b : memref<128x128xi8>)
  linalg.fill ins(%zero : i8) outs(%c : memref<128x128xi8>)
  linalg.matmul
    ins(%a, %b : memref<128x128xi8>, memref<128x128xi8>)
    outs(%c : memref<128x128xi8>)
  memref.dealloc %a : memref<128x128xi8>
  memref.dealloc %b : memref<128x128xi8>
  memref.dealloc %c : memref<128x128xi8>
  return %zero : i8
}
