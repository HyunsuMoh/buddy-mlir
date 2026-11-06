	.attribute	4, 16
	.attribute	5, "rv64i2p1_f2p2_d2p2_zicsr2p0_xgemmini1p0"
	.file	"LLVMDialectModule"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
	.type	.LCPI0_0,@object
.LCPI0_0:
	.quad	4575657221408489476             # 0x3f80000000010004
	.size	.LCPI0_0, 8
	.type	.LCPI0_1,@object
.LCPI0_1:
	.quad	4575657221409472769             # 0x3f80000000100101
	.size	.LCPI0_1, 8
	.type	.LCPI0_2,@object
.LCPI0_2:
	.quad	4575657221409472777             # 0x3f80000000100109
	.size	.LCPI0_2, 8
	.type	.LCPI0_3,@object
.LCPI0_3:
	.quad	4575657221409472785             # 0x3f80000000100111
	.size	.LCPI0_3, 8
	.text
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	lui	a0, 4
	call	malloc
	mv	s0, a0
	li	s3, 1
	lui	a0, 4
	call	malloc
	mv	s1, a0
	lui	a0, 4
	call	malloc
	mv	s2, a0
	li	a0, 0
	li	a1, 0
	li	a2, 127
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a1, a1, 1
	addi	a0, a0, 128
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	blt	a2, a1, .LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	li	a3, 0
	add	a4, s0, a0
	bltz	a2, .LBB0_1
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a5, a4, a3
	addi	a3, a3, 1
	sb	s3, 0(a5)
	bge	a2, a3, .LBB0_4
	j	.LBB0_1
.LBB0_5:
	li	a0, 0
	li	a1, 0
	li	a2, 127
	li	a3, 1
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=1
	addi	a1, a1, 1
	addi	a0, a0, 128
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	blt	a2, a1, .LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	li	a4, 0
	add	a5, s1, a0
	bltz	a2, .LBB0_6
.LBB0_9:                                #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a6, a5, a4
	addi	a4, a4, 1
	sb	a3, 0(a6)
	bge	a2, a4, .LBB0_9
	j	.LBB0_6
.LBB0_10:
	li	a0, 0
	li	a1, 0
	li	a2, 127
	j	.LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_12 Depth=1
	addi	a1, a1, 1
	addi	a0, a0, 128
.LBB0_12:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
	blt	a2, a1, .LBB0_15
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=1
	li	a3, 0
	add	a4, s2, a0
	bltz	a2, .LBB0_11
.LBB0_14:                               #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a5, a4, a3
	addi	a3, a3, 1
	sb	zero, 0(a5)
	bge	a2, a3, .LBB0_14
	j	.LBB0_11
.LBB0_15:
	lui	a0, 16
	call	malloc
	li	a1, 0
	li	a2, 0
	li	a3, 127
	j	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_17 Depth=1
	addi	a2, a2, 1
	addi	a1, a1, 512
.LBB0_17:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	blt	a3, a2, .LBB0_20
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	li	a4, 0
	mv	a5, a1
	bltz	a3, .LBB0_16
.LBB0_19:                               #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a6, a0, a5
	sw	zero, 0(a6)
	addi	a4, a4, 1
	addi	a5, a5, 4
	bge	a3, a4, .LBB0_19
	j	.LBB0_16
.LBB0_20:
	li	a1, 1
	lui	a2, %hi(.LCPI0_0)
	li	a3, 127
	ld	a2, %lo(.LCPI0_0)(a2)
	li	a4, 2
	slli	a5, a1, 48
	lui	a6, %hi(.LCPI0_1)
	slli	a3, a3, 55
	ld	a6, %lo(.LCPI0_1)(a6)
	addi	a3, a3, 128
	lui	a7, %hi(.LCPI0_2)
	config	a2, a5
	ld	a5, %lo(.LCPI0_2)(a7)
	config	a4, a3
	lui	a3, %hi(.LCPI0_3)
	li	a2, 128
	ld	a3, %lo(.LCPI0_3)(a3)
	config	a6, a2
	config	a5, a2
	lui	a4, 262147
	li	a5, 512
	slli	a4, a4, 5
	config	a3, a5
	addi	a3, a4, 5
	loop_ws_config_bounds	zero, a3
	loop_ws_config_addrs_ab	s0, s1
	loop_ws_config_addrs_dc	a0, s2
	loop_ws_config_strides_ab	a2, a2
	lui	a3, 262145
	loop_ws_config_strides_dc	a2, a2
	slli	a3, a3, 5
	loop_ws	a1, zero
	addi	a5, a0, 384
	addi	a6, a3, 5
	addi	a7, s1, 96
	loop_ws_config_bounds	zero, a6
	addi	a6, s2, 96
	loop_ws_config_addrs_ab	s0, a7
	loop_ws_config_addrs_dc	a5, a6
	loop_ws_config_strides_ab	a2, a2
	lui	a5, 10
	loop_ws_config_strides_dc	a2, a2
	add	a6, a0, a5
	loop_ws	a1, zero
	li	t0, 5
	slli	t0, t0, 11
	addi	a4, a4, 3
	add	t1, s0, t0
	loop_ws_config_bounds	zero, a4
	add	t0, s2, t0
	loop_ws_config_addrs_ab	t1, s1
	loop_ws_config_addrs_dc	a6, t0
	loop_ws_config_strides_ab	a2, a2
	loop_ws_config_strides_dc	a2, a2
	loop_ws	a1, zero
	addi	a4, a5, 384
	addi	a3, a3, 3
	add	a4, a0, a4
	loop_ws_config_bounds	zero, a3
	addi	a3, t0, 96
	loop_ws_config_addrs_ab	t1, a7
	loop_ws_config_addrs_dc	a4, a3
	loop_ws_config_strides_ab	a2, a2
	loop_ws_config_strides_dc	a2, a2
	loop_ws	a1, zero
	flush	zero
	fence	rw, rw
	call	free
	mv	a0, s0
	call	free
	mv	a0, s1
	call	free
	mv	a0, s2
	call	free
	li	a0, 0
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
