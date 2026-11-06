; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @free(ptr)

declare ptr @malloc(i64)

define i8 @main() {
  %1 = call ptr @malloc(i64 16384)
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 128, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 128, 3, 1
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 128, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  %9 = call ptr @malloc(i64 16384)
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %9, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 128, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 128, 3, 1
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 128, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  %17 = call ptr @malloc(i64 16384)
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %17, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %17, 1
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 128, 3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 128, 3, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 128, 4, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1
  br label %25

25:                                               ; preds = %38, %0
  %26 = phi i64 [ %39, %38 ], [ 0, %0 ]
  %27 = icmp slt i64 %26, 128
  br i1 %27, label %28, label %40

28:                                               ; preds = %25
  br label %29

29:                                               ; preds = %32, %28
  %30 = phi i64 [ %37, %32 ], [ 0, %28 ]
  %31 = icmp slt i64 %30, 128
  br i1 %31, label %32, label %38

32:                                               ; preds = %29
  %33 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1
  %34 = mul nuw nsw i64 %26, 128
  %35 = add nuw nsw i64 %34, %30
  %36 = getelementptr inbounds nuw i8, ptr %33, i64 %35
  store i8 1, ptr %36, align 1
  %37 = add i64 %30, 1
  br label %29

38:                                               ; preds = %29
  %39 = add i64 %26, 1
  br label %25

40:                                               ; preds = %25
  br label %41

41:                                               ; preds = %54, %40
  %42 = phi i64 [ %55, %54 ], [ 0, %40 ]
  %43 = icmp slt i64 %42, 128
  br i1 %43, label %44, label %56

44:                                               ; preds = %41
  br label %45

45:                                               ; preds = %48, %44
  %46 = phi i64 [ %53, %48 ], [ 0, %44 ]
  %47 = icmp slt i64 %46, 128
  br i1 %47, label %48, label %54

48:                                               ; preds = %45
  %49 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1
  %50 = mul nuw nsw i64 %42, 128
  %51 = add nuw nsw i64 %50, %46
  %52 = getelementptr inbounds nuw i8, ptr %49, i64 %51
  store i8 1, ptr %52, align 1
  %53 = add i64 %46, 1
  br label %45

54:                                               ; preds = %45
  %55 = add i64 %42, 1
  br label %41

56:                                               ; preds = %41
  br label %57

57:                                               ; preds = %70, %56
  %58 = phi i64 [ %71, %70 ], [ 0, %56 ]
  %59 = icmp slt i64 %58, 128
  br i1 %59, label %60, label %72

60:                                               ; preds = %57
  br label %61

61:                                               ; preds = %64, %60
  %62 = phi i64 [ %69, %64 ], [ 0, %60 ]
  %63 = icmp slt i64 %62, 128
  br i1 %63, label %64, label %70

64:                                               ; preds = %61
  %65 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1
  %66 = mul nuw nsw i64 %58, 128
  %67 = add nuw nsw i64 %66, %62
  %68 = getelementptr inbounds nuw i8, ptr %65, i64 %67
  store i8 0, ptr %68, align 1
  %69 = add i64 %62, 1
  br label %61

70:                                               ; preds = %61
  %71 = add i64 %58, 1
  br label %57

72:                                               ; preds = %57
  %73 = call ptr @malloc(i64 65536)
  %74 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %73, 0
  %75 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %74, ptr %73, 1
  %76 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %75, i64 0, 2
  %77 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %76, i64 128, 3, 0
  %78 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %77, i64 128, 3, 1
  %79 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %78, i64 128, 4, 0
  %80 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %79, i64 1, 4, 1
  br label %81

81:                                               ; preds = %94, %72
  %82 = phi i64 [ %95, %94 ], [ 0, %72 ]
  %83 = icmp slt i64 %82, 128
  br i1 %83, label %84, label %96

84:                                               ; preds = %81
  br label %85

85:                                               ; preds = %88, %84
  %86 = phi i64 [ %93, %88 ], [ 0, %84 ]
  %87 = icmp slt i64 %86, 128
  br i1 %87, label %88, label %94

88:                                               ; preds = %85
  %89 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %80, 1
  %90 = mul nuw nsw i64 %82, 128
  %91 = add nuw nsw i64 %90, %86
  %92 = getelementptr inbounds nuw i32, ptr %89, i64 %91
  store i32 0, ptr %92, align 4
  %93 = add i64 %86, 1
  br label %85

94:                                               ; preds = %85
  %95 = add i64 %82, 1
  br label %81

96:                                               ; preds = %81
  %97 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1
  %98 = ptrtoint ptr %97 to i64
  %99 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1
  %100 = ptrtoint ptr %99 to i64
  %101 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1
  %102 = ptrtoint ptr %101 to i64
  %103 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %80, 1
  %104 = ptrtoint ptr %103 to i64
  call void @llvm.riscv.config(i64 4575657221408489476, i64 281474976710656)
  call void @llvm.riscv.config(i64 2, i64 4575657221408424064)
  call void @llvm.riscv.config(i64 4575657221409472769, i64 128)
  call void @llvm.riscv.config(i64 4575657221409472777, i64 128)
  call void @llvm.riscv.config(i64 4575657221409472785, i64 512)
  call void @llvm.riscv.loop.ws.config.bounds(i64 0, i64 34360131589)
  call void @llvm.riscv.loop.ws.config.addrs.ab(i64 %98, i64 %100)
  call void @llvm.riscv.loop.ws.config.addrs.dc(i64 %104, i64 %102)
  call void @llvm.riscv.loop.ws.config.strides.ab(i64 128, i64 128)
  call void @llvm.riscv.loop.ws.config.strides.dc(i64 128, i64 128)
  call void @llvm.riscv.loop.ws(i64 1, i64 0)
  %105 = add i64 %104, 384
  %106 = add i64 %102, 96
  %107 = add i64 %100, 96
  call void @llvm.riscv.loop.ws.config.bounds(i64 0, i64 34359869445)
  call void @llvm.riscv.loop.ws.config.addrs.ab(i64 %98, i64 %107)
  call void @llvm.riscv.loop.ws.config.addrs.dc(i64 %105, i64 %106)
  call void @llvm.riscv.loop.ws.config.strides.ab(i64 128, i64 128)
  call void @llvm.riscv.loop.ws.config.strides.dc(i64 128, i64 128)
  call void @llvm.riscv.loop.ws(i64 1, i64 0)
  %108 = add i64 %104, 40960
  %109 = add i64 %102, 10240
  %110 = add i64 %98, 10240
  call void @llvm.riscv.loop.ws.config.bounds(i64 0, i64 34360131587)
  call void @llvm.riscv.loop.ws.config.addrs.ab(i64 %110, i64 %100)
  call void @llvm.riscv.loop.ws.config.addrs.dc(i64 %108, i64 %109)
  call void @llvm.riscv.loop.ws.config.strides.ab(i64 128, i64 128)
  call void @llvm.riscv.loop.ws.config.strides.dc(i64 128, i64 128)
  call void @llvm.riscv.loop.ws(i64 1, i64 0)
  %111 = add i64 %104, 41344
  %112 = add i64 %102, 10336
  %113 = add i64 %98, 10240
  %114 = add i64 %100, 96
  call void @llvm.riscv.loop.ws.config.bounds(i64 0, i64 34359869443)
  call void @llvm.riscv.loop.ws.config.addrs.ab(i64 %113, i64 %114)
  call void @llvm.riscv.loop.ws.config.addrs.dc(i64 %111, i64 %112)
  call void @llvm.riscv.loop.ws.config.strides.ab(i64 128, i64 128)
  call void @llvm.riscv.loop.ws.config.strides.dc(i64 128, i64 128)
  call void @llvm.riscv.loop.ws(i64 1, i64 0)
  call void @llvm.riscv.flush(i64 0, i64 0)
  fence seq_cst
  %115 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %80, 0
  call void @free(ptr %115)
  %116 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 0
  call void @free(ptr %116)
  %117 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 0
  call void @free(ptr %117)
  %118 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 0
  call void @free(ptr %118)
  ret i8 0
}

; Function Attrs: nounwind
declare void @llvm.riscv.config(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.loop.ws.config.bounds(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.loop.ws.config.addrs.ab(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.loop.ws.config.addrs.dc(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.loop.ws.config.strides.ab(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.loop.ws.config.strides.dc(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.loop.ws(i64, i64) #0

; Function Attrs: nounwind
declare void @llvm.riscv.flush(i64, i64) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
