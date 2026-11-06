module {
  llvm.func @free(!llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() -> i8 {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(128 : i64) : i64
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.mlir.constant(0 : i8) : i8
    %5 = llvm.mlir.constant(1 : i8) : i8
    %6 = llvm.mlir.constant(128 : i64) : i64
    %7 = llvm.mlir.constant(128 : i64) : i64
    %8 = llvm.mlir.constant(1 : i64) : i64
    %9 = llvm.mlir.constant(16384 : i64) : i64
    %10 = llvm.mlir.zero : !llvm.ptr
    %11 = llvm.getelementptr %10[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
    %13 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr
    %14 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %13, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.insertvalue %13, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.mlir.constant(0 : i64) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %19 = llvm.insertvalue %6, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %20 = llvm.insertvalue %7, %19[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.insertvalue %7, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %22 = llvm.insertvalue %8, %21[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.mlir.constant(128 : i64) : i64
    %24 = llvm.mlir.constant(128 : i64) : i64
    %25 = llvm.mlir.constant(1 : i64) : i64
    %26 = llvm.mlir.constant(16384 : i64) : i64
    %27 = llvm.mlir.zero : !llvm.ptr
    %28 = llvm.getelementptr %27[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %29 = llvm.ptrtoint %28 : !llvm.ptr to i64
    %30 = llvm.call @malloc(%29) : (i64) -> !llvm.ptr
    %31 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %32 = llvm.insertvalue %30, %31[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %33 = llvm.insertvalue %30, %32[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %34 = llvm.mlir.constant(0 : i64) : i64
    %35 = llvm.insertvalue %34, %33[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %36 = llvm.insertvalue %23, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %37 = llvm.insertvalue %24, %36[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %38 = llvm.insertvalue %24, %37[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %39 = llvm.insertvalue %25, %38[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %40 = llvm.mlir.constant(128 : i64) : i64
    %41 = llvm.mlir.constant(128 : i64) : i64
    %42 = llvm.mlir.constant(1 : i64) : i64
    %43 = llvm.mlir.constant(16384 : i64) : i64
    %44 = llvm.mlir.zero : !llvm.ptr
    %45 = llvm.getelementptr %44[%43] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %46 = llvm.ptrtoint %45 : !llvm.ptr to i64
    %47 = llvm.call @malloc(%46) : (i64) -> !llvm.ptr
    %48 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %49 = llvm.insertvalue %47, %48[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %50 = llvm.insertvalue %47, %49[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %51 = llvm.mlir.constant(0 : i64) : i64
    %52 = llvm.insertvalue %51, %50[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %53 = llvm.insertvalue %40, %52[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %54 = llvm.insertvalue %41, %53[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %55 = llvm.insertvalue %41, %54[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %56 = llvm.insertvalue %42, %55[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%2 : i64)
  ^bb1(%57: i64):  // 2 preds: ^bb0, ^bb5
    %58 = llvm.icmp "slt" %57, %1 : i64
    llvm.cond_br %58, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%2 : i64)
  ^bb3(%59: i64):  // 2 preds: ^bb2, ^bb4
    %60 = llvm.icmp "slt" %59, %1 : i64
    llvm.cond_br %60, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %61 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %62 = llvm.mlir.constant(128 : i64) : i64
    %63 = llvm.mul %57, %62 overflow<nsw, nuw> : i64
    %64 = llvm.add %63, %59 overflow<nsw, nuw> : i64
    %65 = llvm.getelementptr inbounds|nuw %61[%64] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    llvm.store %5, %65 : i8, !llvm.ptr
    %66 = llvm.add %59, %0 : i64
    llvm.br ^bb3(%66 : i64)
  ^bb5:  // pred: ^bb3
    %67 = llvm.add %57, %0 : i64
    llvm.br ^bb1(%67 : i64)
  ^bb6:  // pred: ^bb1
    llvm.br ^bb7(%2 : i64)
  ^bb7(%68: i64):  // 2 preds: ^bb6, ^bb11
    %69 = llvm.icmp "slt" %68, %1 : i64
    llvm.cond_br %69, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%2 : i64)
  ^bb9(%70: i64):  // 2 preds: ^bb8, ^bb10
    %71 = llvm.icmp "slt" %70, %1 : i64
    llvm.cond_br %71, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %72 = llvm.extractvalue %39[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %73 = llvm.mlir.constant(128 : i64) : i64
    %74 = llvm.mul %68, %73 overflow<nsw, nuw> : i64
    %75 = llvm.add %74, %70 overflow<nsw, nuw> : i64
    %76 = llvm.getelementptr inbounds|nuw %72[%75] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    llvm.store %5, %76 : i8, !llvm.ptr
    %77 = llvm.add %70, %0 : i64
    llvm.br ^bb9(%77 : i64)
  ^bb11:  // pred: ^bb9
    %78 = llvm.add %68, %0 : i64
    llvm.br ^bb7(%78 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%2 : i64)
  ^bb13(%79: i64):  // 2 preds: ^bb12, ^bb17
    %80 = llvm.icmp "slt" %79, %1 : i64
    llvm.cond_br %80, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%2 : i64)
  ^bb15(%81: i64):  // 2 preds: ^bb14, ^bb16
    %82 = llvm.icmp "slt" %81, %1 : i64
    llvm.cond_br %82, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %83 = llvm.extractvalue %56[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %84 = llvm.mlir.constant(128 : i64) : i64
    %85 = llvm.mul %79, %84 overflow<nsw, nuw> : i64
    %86 = llvm.add %85, %81 overflow<nsw, nuw> : i64
    %87 = llvm.getelementptr inbounds|nuw %83[%86] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    llvm.store %4, %87 : i8, !llvm.ptr
    %88 = llvm.add %81, %0 : i64
    llvm.br ^bb15(%88 : i64)
  ^bb17:  // pred: ^bb15
    %89 = llvm.add %79, %0 : i64
    llvm.br ^bb13(%89 : i64)
  ^bb18:  // pred: ^bb13
    %90 = llvm.mlir.constant(128 : i64) : i64
    %91 = llvm.mlir.constant(128 : i64) : i64
    %92 = llvm.mlir.constant(1 : i64) : i64
    %93 = llvm.mlir.constant(16384 : i64) : i64
    %94 = llvm.mlir.zero : !llvm.ptr
    %95 = llvm.getelementptr %94[%93] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %96 = llvm.ptrtoint %95 : !llvm.ptr to i64
    %97 = llvm.call @malloc(%96) : (i64) -> !llvm.ptr
    %98 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %99 = llvm.insertvalue %97, %98[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %100 = llvm.insertvalue %97, %99[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %101 = llvm.mlir.constant(0 : i64) : i64
    %102 = llvm.insertvalue %101, %100[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %103 = llvm.insertvalue %90, %102[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %104 = llvm.insertvalue %91, %103[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %105 = llvm.insertvalue %91, %104[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %106 = llvm.insertvalue %92, %105[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb19(%2 : i64)
  ^bb19(%107: i64):  // 2 preds: ^bb18, ^bb23
    %108 = llvm.icmp "slt" %107, %1 : i64
    llvm.cond_br %108, ^bb20, ^bb24
  ^bb20:  // pred: ^bb19
    llvm.br ^bb21(%2 : i64)
  ^bb21(%109: i64):  // 2 preds: ^bb20, ^bb22
    %110 = llvm.icmp "slt" %109, %1 : i64
    llvm.cond_br %110, ^bb22, ^bb23
  ^bb22:  // pred: ^bb21
    %111 = llvm.extractvalue %106[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %112 = llvm.mlir.constant(128 : i64) : i64
    %113 = llvm.mul %107, %112 overflow<nsw, nuw> : i64
    %114 = llvm.add %113, %109 overflow<nsw, nuw> : i64
    %115 = llvm.getelementptr inbounds|nuw %111[%114] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %3, %115 : i32, !llvm.ptr
    %116 = llvm.add %109, %0 : i64
    llvm.br ^bb21(%116 : i64)
  ^bb23:  // pred: ^bb21
    %117 = llvm.add %107, %0 : i64
    llvm.br ^bb19(%117 : i64)
  ^bb24:  // pred: ^bb19
    %118 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %119 = llvm.ptrtoint %118 : !llvm.ptr to i64
    %120 = llvm.extractvalue %39[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %121 = llvm.ptrtoint %120 : !llvm.ptr to i64
    %122 = llvm.extractvalue %56[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %123 = llvm.ptrtoint %122 : !llvm.ptr to i64
    %124 = llvm.extractvalue %106[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %125 = llvm.ptrtoint %124 : !llvm.ptr to i64
    %126 = llvm.mlir.constant(4575657221408489476 : i64) : i64
    %127 = llvm.mlir.constant(281474976710656 : i64) : i64
    "gemmini.intr.config"(%126, %127) : (i64, i64) -> ()
    %128 = llvm.mlir.constant(128 : i64) : i64
    %129 = llvm.mlir.constant(2 : i64) : i64
    %130 = llvm.mlir.constant(4575657221408424064 : i64) : i64
    "gemmini.intr.config"(%129, %130) : (i64, i64) -> ()
    %131 = llvm.mlir.constant(128 : i64) : i64
    %132 = llvm.mlir.constant(4575657221409472769 : i64) : i64
    "gemmini.intr.config"(%132, %131) : (i64, i64) -> ()
    %133 = llvm.mlir.constant(128 : i64) : i64
    %134 = llvm.mlir.constant(4575657221409472777 : i64) : i64
    "gemmini.intr.config"(%134, %133) : (i64, i64) -> ()
    %135 = llvm.mlir.constant(512 : i64) : i64
    %136 = llvm.mlir.constant(4575657221409472785 : i64) : i64
    "gemmini.intr.config"(%136, %135) : (i64, i64) -> ()
    %137 = llvm.mlir.constant(0 : i64) : i64
    %138 = llvm.mlir.constant(0 : i64) : i64
    %139 = llvm.mlir.constant(0 : i64) : i64
    %140 = llvm.mlir.constant(0 : i64) : i64
    %141 = llvm.mlir.constant(0 : i64) : i64
    %142 = llvm.mlir.constant(34360131589 : i64) : i64
    "gemmini.intr.loop_ws_config_bounds"(%141, %142) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_ab"(%119, %121) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_dc"(%125, %123) : (i64, i64) -> ()
    %143 = llvm.mlir.constant(128 : i64) : i64
    %144 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_ab"(%143, %144) : (i64, i64) -> ()
    %145 = llvm.mlir.constant(128 : i64) : i64
    %146 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_dc"(%145, %146) : (i64, i64) -> ()
    %147 = llvm.mlir.constant(1 : i64) : i64
    %148 = llvm.mlir.constant(0 : i64) : i64
    "gemmini.intr.loop_ws"(%147, %148) : (i64, i64) -> ()
    %149 = llvm.mlir.constant(384 : i64) : i64
    %150 = llvm.add %125, %149 : i64
    %151 = llvm.mlir.constant(96 : i64) : i64
    %152 = llvm.add %123, %151 : i64
    %153 = llvm.mlir.constant(0 : i64) : i64
    %154 = llvm.mlir.constant(96 : i64) : i64
    %155 = llvm.add %121, %154 : i64
    %156 = llvm.mlir.constant(0 : i64) : i64
    %157 = llvm.mlir.constant(34359869445 : i64) : i64
    "gemmini.intr.loop_ws_config_bounds"(%156, %157) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_ab"(%119, %155) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_dc"(%150, %152) : (i64, i64) -> ()
    %158 = llvm.mlir.constant(128 : i64) : i64
    %159 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_ab"(%158, %159) : (i64, i64) -> ()
    %160 = llvm.mlir.constant(128 : i64) : i64
    %161 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_dc"(%160, %161) : (i64, i64) -> ()
    %162 = llvm.mlir.constant(1 : i64) : i64
    %163 = llvm.mlir.constant(0 : i64) : i64
    "gemmini.intr.loop_ws"(%162, %163) : (i64, i64) -> ()
    %164 = llvm.mlir.constant(40960 : i64) : i64
    %165 = llvm.add %125, %164 : i64
    %166 = llvm.mlir.constant(10240 : i64) : i64
    %167 = llvm.add %123, %166 : i64
    %168 = llvm.mlir.constant(10240 : i64) : i64
    %169 = llvm.add %119, %168 : i64
    %170 = llvm.mlir.constant(0 : i64) : i64
    %171 = llvm.mlir.constant(0 : i64) : i64
    %172 = llvm.mlir.constant(34360131587 : i64) : i64
    "gemmini.intr.loop_ws_config_bounds"(%171, %172) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_ab"(%169, %121) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_dc"(%165, %167) : (i64, i64) -> ()
    %173 = llvm.mlir.constant(128 : i64) : i64
    %174 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_ab"(%173, %174) : (i64, i64) -> ()
    %175 = llvm.mlir.constant(128 : i64) : i64
    %176 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_dc"(%175, %176) : (i64, i64) -> ()
    %177 = llvm.mlir.constant(1 : i64) : i64
    %178 = llvm.mlir.constant(0 : i64) : i64
    "gemmini.intr.loop_ws"(%177, %178) : (i64, i64) -> ()
    %179 = llvm.mlir.constant(41344 : i64) : i64
    %180 = llvm.add %125, %179 : i64
    %181 = llvm.mlir.constant(10336 : i64) : i64
    %182 = llvm.add %123, %181 : i64
    %183 = llvm.mlir.constant(10240 : i64) : i64
    %184 = llvm.add %119, %183 : i64
    %185 = llvm.mlir.constant(96 : i64) : i64
    %186 = llvm.add %121, %185 : i64
    %187 = llvm.mlir.constant(0 : i64) : i64
    %188 = llvm.mlir.constant(34359869443 : i64) : i64
    "gemmini.intr.loop_ws_config_bounds"(%187, %188) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_ab"(%184, %186) : (i64, i64) -> ()
    "gemmini.intr.loop_ws_config_addrs_dc"(%180, %182) : (i64, i64) -> ()
    %189 = llvm.mlir.constant(128 : i64) : i64
    %190 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_ab"(%189, %190) : (i64, i64) -> ()
    %191 = llvm.mlir.constant(128 : i64) : i64
    %192 = llvm.mlir.constant(128 : i64) : i64
    "gemmini.intr.loop_ws_config_strides_dc"(%191, %192) : (i64, i64) -> ()
    %193 = llvm.mlir.constant(1 : i64) : i64
    %194 = llvm.mlir.constant(0 : i64) : i64
    "gemmini.intr.loop_ws"(%193, %194) : (i64, i64) -> ()
    %195 = llvm.mlir.constant(0 : i64) : i64
    "gemmini.intr.flush"(%195, %195) : (i64, i64) -> ()
    llvm.fence seq_cst
    %196 = llvm.extractvalue %106[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @free(%196) : (!llvm.ptr) -> ()
    %197 = llvm.extractvalue %22[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @free(%197) : (!llvm.ptr) -> ()
    %198 = llvm.extractvalue %39[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @free(%198) : (!llvm.ptr) -> ()
    %199 = llvm.extractvalue %56[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @free(%199) : (!llvm.ptr) -> ()
    llvm.return %4 : i8
  }
}
