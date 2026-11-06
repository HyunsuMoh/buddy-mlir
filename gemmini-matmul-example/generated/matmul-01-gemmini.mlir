module {
  func.func @main() -> i8 {
    %c0_i8 = arith.constant 0 : i8
    %c1_i8 = arith.constant 1 : i8
    %alloc = memref.alloc() : memref<128x128xi8>
    %alloc_0 = memref.alloc() : memref<128x128xi8>
    %alloc_1 = memref.alloc() : memref<128x128xi8>
    linalg.fill ins(%c1_i8 : i8) outs(%alloc : memref<128x128xi8>)
    linalg.fill ins(%c1_i8 : i8) outs(%alloc_0 : memref<128x128xi8>)
    linalg.fill ins(%c0_i8 : i8) outs(%alloc_1 : memref<128x128xi8>)
    %alloc_2 = memref.alloc() : memref<128x128xi32>
    %c0_i32 = arith.constant 0 : i32
    linalg.fill ins(%c0_i32 : i32) outs(%alloc_2 : memref<128x128xi32>)
    gemmini.tile_matmul %alloc %alloc_0 %alloc_1 %alloc_2 : memref<128x128xi8> memref<128x128xi8> memref<128x128xi8> memref<128x128xi32>
    memref.dealloc %alloc_2 : memref<128x128xi32>
    memref.dealloc %alloc : memref<128x128xi8>
    memref.dealloc %alloc_0 : memref<128x128xi8>
    memref.dealloc %alloc_1 : memref<128x128xi8>
    return %c0_i8 : i8
  }
}
