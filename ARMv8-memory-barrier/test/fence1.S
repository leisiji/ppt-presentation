
a.out:     file format elf64-littleaarch64


Disassembly of section .interp:

0000000000000238 <.interp>:
 238:	62696c2f 	.inst	0x62696c2f ; undefined
 23c:	2d646c2f 	ldp	s15, s27, [x1, #-224]
 240:	756e696c 	.inst	0x756e696c ; undefined
 244:	61612d78 	.inst	0x61612d78 ; undefined
 248:	36686372 	tbz	w18, #13, eb4 <__FRAME_END__+0x604>
 24c:	6f732e34 	.inst	0x6f732e34 ; undefined
 250:	Address 0x0000000000000250 is out of bounds.


Disassembly of section .note.gnu.build-id:

0000000000000254 <.note.gnu.build-id>:
 254:	00000004 	udf	#4
 258:	00000014 	udf	#20
 25c:	00000003 	udf	#3
 260:	00554e47 	.inst	0x00554e47 ; undefined
 264:	38eb623d 	ldumaxalb	w11, w29, [x17]
 268:	d90e26b1 	.inst	0xd90e26b1 ; undefined
 26c:	9defb6b7 	.inst	0x9defb6b7 ; undefined
 270:	d62a3f3e 	.inst	0xd62a3f3e ; undefined
 274:	2007933d 	.inst	0x2007933d ; undefined

Disassembly of section .note.ABI-tag:

0000000000000278 <__abi_tag>:
 278:	00000004 	udf	#4
 27c:	00000010 	udf	#16
 280:	00000001 	udf	#1
 284:	00554e47 	.inst	0x00554e47 ; undefined
 288:	00000000 	udf	#0
 28c:	00000003 	udf	#3
 290:	00000007 	udf	#7
 294:	00000000 	udf	#0

Disassembly of section .gnu.hash:

0000000000000298 <.gnu.hash>:
 298:	00000001 	udf	#1
 29c:	00000001 	udf	#1
 2a0:	00000001 	udf	#1
	...

Disassembly of section .dynsym:

00000000000002b8 <.dynsym>:
	...
 2d4:	000b0003 	.inst	0x000b0003 ; undefined
 2d8:	000005b8 	udf	#1464
	...
 2ec:	00170003 	.inst	0x00170003 ; undefined
 2f0:	00011028 	.inst	0x00011028 ; undefined
	...
 300:	00000010 	udf	#16
 304:	00000012 	udf	#18
	...
 318:	0000004f 	udf	#79
 31c:	00000020 	udf	#32
	...
 330:	00000001 	udf	#1
 334:	00000022 	udf	#34
	...
 348:	00000022 	udf	#34
 34c:	00000012 	udf	#18
	...
 360:	0000006b 	udf	#107
 364:	00000020 	udf	#32
	...
 378:	00000029 	udf	#41
 37c:	00000012 	udf	#18
	...
 390:	0000007a 	udf	#122
 394:	00000020 	udf	#32
	...

Disassembly of section .dynstr:

00000000000003a8 <.dynstr>:
 3a8:	635f5f00 	.inst	0x635f5f00 ; undefined
 3ac:	665f6178 	.inst	0x665f6178 ; undefined
 3b0:	6c616e69 	ldnp	d9, d27, [x19, #-496]
 3b4:	00657a69 	.inst	0x00657a69 ; undefined
 3b8:	696c5f5f 	ldpsw	xzr, x23, [x26, #-160]
 3bc:	735f6362 	.inst	0x735f6362 ; undefined
 3c0:	74726174 	.inst	0x74726174 ; undefined
 3c4:	69616d5f 	ldpsw	xzr, x27, [x10, #-248]
 3c8:	7473006e 	.inst	0x7473006e ; undefined
 3cc:	70756472 	adr	x18, eb05b <__bss_end__+0xda013>
 3d0:	6f626100 	umlsl2	v0.4s, v8.8h, v2.h[2]
 3d4:	6c007472 	stnp	d18, d29, [x3]
 3d8:	2e636269 	rsubhn	v9.4h, v19.4s, v3.4s
 3dc:	362e6f73 	tbz	w19, #5, ffffffffffffd1c8 <__bss_end__+0xfffffffffffec180>
 3e0:	494c4700 	.inst	0x494c4700 ; undefined
 3e4:	325f4342 	.inst	0x325f4342 ; undefined
 3e8:	0037312e 	.inst	0x0037312e ; NYI
 3ec:	42494c47 	.inst	0x42494c47 ; undefined
 3f0:	2e325f43 	uqrshl	v3.8b, v26.8b, v18.8b
 3f4:	5f003433 	.inst	0x5f003433 ; undefined
 3f8:	5f4d5449 	shl	d9, d2, #13
 3fc:	65726564 	fnmls	z4.h, p1/m, z11.h, z18.h
 400:	74736967 	.inst	0x74736967 ; undefined
 404:	4d547265 	.inst	0x4d547265 ; undefined
 408:	6e6f6c43 	umin	v3.8h, v2.8h, v15.8h
 40c:	62615465 	.inst	0x62615465 ; undefined
 410:	5f00656c 	.inst	0x5f00656c ; undefined
 414:	6f6d675f 	sqshlu	v31.2d, v26.2d, #45
 418:	74735f6e 	.inst	0x74735f6e ; undefined
 41c:	5f747261 	sqdmlsl	s1, h19, v4.h[3]
 420:	495f005f 	.inst	0x495f005f ; undefined
 424:	725f4d54 	.inst	0x725f4d54 ; undefined
 428:	73696765 	.inst	0x73696765 ; undefined
 42c:	54726574 	bc.mi	e50d8 <__bss_end__+0xd4090>  // bc.first
 430:	6f6c434d 	mls	v13.8h, v26.8h, v12.h[2]
 434:	6154656e 	.inst	0x6154656e ; undefined
 438:	00656c62 	.inst	0x00656c62 ; undefined

Disassembly of section .gnu.version:

000000000000043c <.gnu.version>:
 43c:	00000000 	udf	#0
 440:	00020000 	.inst	0x00020000 ; undefined
 444:	00030001 	.inst	0x00030001 ; undefined
 448:	00010003 	.inst	0x00010003 ; undefined
 44c:	00010003 	.inst	0x00010003 ; undefined

Disassembly of section .gnu.version_r:

0000000000000450 <.gnu.version_r>:
 450:	00020001 	.inst	0x00020001 ; undefined
 454:	0000002f 	udf	#47
 458:	00000010 	udf	#16
 45c:	00000000 	udf	#0
 460:	06969197 	.inst	0x06969197 ; undefined
 464:	00030000 	.inst	0x00030000 ; undefined
 468:	00000039 	udf	#57
 46c:	00000010 	udf	#16
 470:	069691b4 	.inst	0x069691b4 ; undefined
 474:	00020000 	.inst	0x00020000 ; undefined
 478:	00000044 	udf	#68
 47c:	00000000 	udf	#0

Disassembly of section .rela.dyn:

0000000000000480 <.rela.dyn>:
 480:	00010dc8 	.inst	0x00010dc8 ; undefined
 484:	00000000 	udf	#0
 488:	00000403 	udf	#1027
 48c:	00000000 	udf	#0
 490:	00000750 	udf	#1872
 494:	00000000 	udf	#0
 498:	00010dd0 	.inst	0x00010dd0 ; undefined
 49c:	00000000 	udf	#0
 4a0:	00000403 	udf	#1027
 4a4:	00000000 	udf	#0
 4a8:	00000700 	udf	#1792
 4ac:	00000000 	udf	#0
 4b0:	00010fd8 	.inst	0x00010fd8 ; undefined
 4b4:	00000000 	udf	#0
 4b8:	00000403 	udf	#1027
 4bc:	00000000 	udf	#0
 4c0:	00000754 	udf	#1876
 4c4:	00000000 	udf	#0
 4c8:	00011030 	.inst	0x00011030 ; undefined
 4cc:	00000000 	udf	#0
 4d0:	00000403 	udf	#1027
 4d4:	00000000 	udf	#0
 4d8:	00011030 	.inst	0x00011030 ; undefined
 4dc:	00000000 	udf	#0
 4e0:	00010fc0 	.inst	0x00010fc0 ; undefined
 4e4:	00000000 	udf	#0
 4e8:	00000401 	udf	#1025
 4ec:	00000004 	udf	#4
	...
 4f8:	00010fc8 	.inst	0x00010fc8 ; undefined
 4fc:	00000000 	udf	#0
 500:	00000401 	udf	#1025
 504:	00000005 	udf	#5
	...
 510:	00010fd0 	.inst	0x00010fd0 ; undefined
 514:	00000000 	udf	#0
 518:	00000401 	udf	#1025
 51c:	00000007 	udf	#7
	...
 528:	00010fe0 	.inst	0x00010fe0 ; undefined
 52c:	00000000 	udf	#0
 530:	00000401 	udf	#1025
 534:	00000009 	udf	#9
	...

Disassembly of section .rela.plt:

0000000000000540 <.rela.plt>:
 540:	00011000 	.inst	0x00011000 ; undefined
 544:	00000000 	udf	#0
 548:	00000402 	udf	#1026
 54c:	00000003 	udf	#3
	...
 558:	00011008 	.inst	0x00011008 ; undefined
 55c:	00000000 	udf	#0
 560:	00000402 	udf	#1026
 564:	00000005 	udf	#5
	...
 570:	00011010 	.inst	0x00011010 ; undefined
 574:	00000000 	udf	#0
 578:	00000402 	udf	#1026
 57c:	00000006 	udf	#6
	...
 588:	00011018 	.inst	0x00011018 ; undefined
 58c:	00000000 	udf	#0
 590:	00000402 	udf	#1026
 594:	00000007 	udf	#7
	...
 5a0:	00011020 	.inst	0x00011020 ; undefined
 5a4:	00000000 	udf	#0
 5a8:	00000402 	udf	#1026
 5ac:	00000008 	udf	#8
	...

Disassembly of section .init:

00000000000005b8 <_init>:
 5b8:	d503201f 	nop
 5bc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 5c0:	910003fd 	mov	x29, sp
 5c4:	9400002c 	bl	674 <call_weak_fn>
 5c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 5cc:	d65f03c0 	ret

Disassembly of section .plt:

00000000000005d0 <.plt>:
 5d0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 5d4:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf750>
 5d8:	f947fe11 	ldr	x17, [x16, #4088]
 5dc:	913fe210 	add	x16, x16, #0xff8
 5e0:	d61f0220 	br	x17
 5e4:	d503201f 	nop
 5e8:	d503201f 	nop
 5ec:	d503201f 	nop

00000000000005f0 <__libc_start_main@plt>:
 5f0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 5f4:	f9400211 	ldr	x17, [x16]
 5f8:	91000210 	add	x16, x16, #0x0
 5fc:	d61f0220 	br	x17

0000000000000600 <__cxa_finalize@plt>:
 600:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 604:	f9400611 	ldr	x17, [x16, #8]
 608:	91002210 	add	x16, x16, #0x8
 60c:	d61f0220 	br	x17

0000000000000610 <strdup@plt>:
 610:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 614:	f9400a11 	ldr	x17, [x16, #16]
 618:	91004210 	add	x16, x16, #0x10
 61c:	d61f0220 	br	x17

0000000000000620 <__gmon_start__@plt>:
 620:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 624:	f9400e11 	ldr	x17, [x16, #24]
 628:	91006210 	add	x16, x16, #0x18
 62c:	d61f0220 	br	x17

0000000000000630 <abort@plt>:
 630:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 634:	f9401211 	ldr	x17, [x16, #32]
 638:	91008210 	add	x16, x16, #0x20
 63c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000640 <_start>:
 640:	d503201f 	nop
 644:	d280001d 	mov	x29, #0x0                   	// #0
 648:	d280001e 	mov	x30, #0x0                   	// #0
 64c:	aa0003e5 	mov	x5, x0
 650:	f94003e1 	ldr	x1, [sp]
 654:	910023e2 	add	x2, sp, #0x8
 658:	910003e6 	mov	x6, sp
 65c:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf750>
 660:	f947ec00 	ldr	x0, [x0, #4056]
 664:	d2800003 	mov	x3, #0x0                   	// #0
 668:	d2800004 	mov	x4, #0x0                   	// #0
 66c:	97ffffe1 	bl	5f0 <__libc_start_main@plt>
 670:	97fffff0 	bl	630 <abort@plt>

0000000000000674 <call_weak_fn>:
 674:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf750>
 678:	f947e800 	ldr	x0, [x0, #4048]
 67c:	b4000040 	cbz	x0, 684 <call_weak_fn+0x10>
 680:	17ffffe8 	b	620 <__gmon_start__@plt>
 684:	d65f03c0 	ret
 688:	d503201f 	nop
 68c:	d503201f 	nop

0000000000000690 <deregister_tm_clones>:
 690:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 694:	9100e000 	add	x0, x0, #0x38
 698:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 69c:	9100e021 	add	x1, x1, #0x38
 6a0:	eb00003f 	cmp	x1, x0
 6a4:	540000c0 	b.eq	6bc <deregister_tm_clones+0x2c>  // b.none
 6a8:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf750>
 6ac:	f947e021 	ldr	x1, [x1, #4032]
 6b0:	b4000061 	cbz	x1, 6bc <deregister_tm_clones+0x2c>
 6b4:	aa0103f0 	mov	x16, x1
 6b8:	d61f0200 	br	x16
 6bc:	d65f03c0 	ret

00000000000006c0 <register_tm_clones>:
 6c0:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 6c4:	9100e000 	add	x0, x0, #0x38
 6c8:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 6cc:	9100e021 	add	x1, x1, #0x38
 6d0:	cb000021 	sub	x1, x1, x0
 6d4:	d37ffc22 	lsr	x2, x1, #63
 6d8:	8b810c41 	add	x1, x2, x1, asr #3
 6dc:	9341fc21 	asr	x1, x1, #1
 6e0:	b40000c1 	cbz	x1, 6f8 <register_tm_clones+0x38>
 6e4:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf750>
 6e8:	f947f042 	ldr	x2, [x2, #4064]
 6ec:	b4000062 	cbz	x2, 6f8 <register_tm_clones+0x38>
 6f0:	aa0203f0 	mov	x16, x2
 6f4:	d61f0200 	br	x16
 6f8:	d65f03c0 	ret
 6fc:	d503201f 	nop

0000000000000700 <__do_global_dtors_aux>:
 700:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 704:	910003fd 	mov	x29, sp
 708:	f9000bf3 	str	x19, [sp, #16]
 70c:	b0000093 	adrp	x19, 11000 <__libc_start_main@GLIBC_2.34>
 710:	3940e260 	ldrb	w0, [x19, #56]
 714:	35000140 	cbnz	w0, 73c <__do_global_dtors_aux+0x3c>
 718:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf750>
 71c:	f947e400 	ldr	x0, [x0, #4040]
 720:	b4000080 	cbz	x0, 730 <__do_global_dtors_aux+0x30>
 724:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 728:	f9401800 	ldr	x0, [x0, #48]
 72c:	97ffffb5 	bl	600 <__cxa_finalize@plt>
 730:	97ffffd8 	bl	690 <deregister_tm_clones>
 734:	52800020 	mov	w0, #0x1                   	// #1
 738:	3900e260 	strb	w0, [x19, #56]
 73c:	f9400bf3 	ldr	x19, [sp, #16]
 740:	a8c27bfd 	ldp	x29, x30, [sp], #32
 744:	d65f03c0 	ret
 748:	d503201f 	nop
 74c:	d503201f 	nop

0000000000000750 <frame_dummy>:
 750:	17ffffdc 	b	6c0 <register_tm_clones>

0000000000000754 <main>:
 754:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 758:	910003fd 	mov	x29, sp
 75c:	b9001fe0 	str	w0, [sp, #28]
 760:	f9000be1 	str	x1, [sp, #16]
 764:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 768:	911f0000 	add	x0, x0, #0x7c0
 76c:	97ffffa9 	bl	610 <strdup@plt>
 770:	f9001fe0 	str	x0, [sp, #56]
 774:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 778:	91010000 	add	x0, x0, #0x40
 77c:	f9001be0 	str	x0, [sp, #48]
 780:	f9401fe0 	ldr	x0, [sp, #56]
 784:	f90017e0 	str	x0, [sp, #40]
 788:	f94017e1 	ldr	x1, [sp, #40]
 78c:	f9401be0 	ldr	x0, [sp, #48]
 790:	f9000001 	str	x1, [x0]
 794:	52800000 	mov	w0, #0x0                   	// #0
 798:	a8c47bfd 	ldp	x29, x30, [sp], #64
 79c:	d65f03c0 	ret

Disassembly of section .fini:

00000000000007a0 <_fini>:
 7a0:	d503201f 	nop
 7a4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 7a8:	910003fd 	mov	x29, sp
 7ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
 7b0:	d65f03c0 	ret

Disassembly of section .rodata:

00000000000007b8 <_IO_stdin_used>:
 7b8:	00020001 	.inst	0x00020001 ; undefined
 7bc:	00000000 	udf	#0
 7c0:	6c6c6548 	ldnp	d8, d25, [x10, #-320]
 7c4:	6f77206f 	umlal2	v15.4s, v3.8h, v7.h[3]
 7c8:	00646c72 	.inst	0x00646c72 ; undefined

Disassembly of section .eh_frame_hdr:

00000000000007cc <__GNU_EH_FRAME_HDR>:
 7cc:	3b031b01 	.inst	0x3b031b01 ; undefined
 7d0:	00000038 	udf	#56
 7d4:	00000006 	udf	#6
 7d8:	fffffe74 	.inst	0xfffffe74 ; undefined
 7dc:	00000050 	udf	#80
 7e0:	fffffec4 	.inst	0xfffffec4 ; undefined
 7e4:	00000064 	udf	#100
 7e8:	fffffef4 	.inst	0xfffffef4 ; undefined
 7ec:	00000078 	udf	#120
 7f0:	ffffff34 	.inst	0xffffff34 ; undefined
 7f4:	0000008c 	udf	#140
 7f8:	ffffff84 	.inst	0xffffff84 ; undefined
 7fc:	000000b0 	udf	#176
 800:	ffffff88 	.inst	0xffffff88 ; undefined
 804:	000000c4 	udf	#196

Disassembly of section .eh_frame:

0000000000000808 <__FRAME_END__-0xa8>:
 808:	00000010 	udf	#16
 80c:	00000000 	udf	#0
 810:	00527a01 	.inst	0x00527a01 ; undefined
 814:	011e7804 	.inst	0x011e7804 ; undefined
 818:	001f0c1b 	.inst	0x001f0c1b ; undefined
 81c:	00000010 	udf	#16
 820:	00000018 	udf	#24
 824:	fffffe1c 	.inst	0xfffffe1c ; undefined
 828:	00000034 	udf	#52
 82c:	1e074100 	.inst	0x1e074100 ; undefined
 830:	00000010 	udf	#16
 834:	0000002c 	udf	#44
 838:	fffffe58 	.inst	0xfffffe58 ; undefined
 83c:	00000030 	udf	#48
 840:	00000000 	udf	#0
 844:	00000010 	udf	#16
 848:	00000040 	udf	#64
 84c:	fffffe74 	.inst	0xfffffe74 ; undefined
 850:	0000003c 	udf	#60
 854:	00000000 	udf	#0
 858:	00000020 	udf	#32
 85c:	00000054 	udf	#84
 860:	fffffea0 	.inst	0xfffffea0 ; undefined
 864:	00000048 	udf	#72
 868:	200e4100 	.inst	0x200e4100 ; undefined
 86c:	039e049d 	.inst	0x039e049d ; undefined
 870:	4e029342 	.inst	0x4e029342 ; undefined
 874:	0ed3ddde 	.inst	0x0ed3ddde ; undefined
 878:	00000000 	udf	#0
 87c:	00000010 	udf	#16
 880:	00000078 	udf	#120
 884:	fffffecc 	.inst	0xfffffecc ; undefined
 888:	00000004 	udf	#4
 88c:	00000000 	udf	#0
 890:	0000001c 	udf	#28
 894:	0000008c 	udf	#140
 898:	fffffebc 	.inst	0xfffffebc ; undefined
 89c:	0000004c 	udf	#76
 8a0:	400e4100 	.inst	0x400e4100 ; undefined
 8a4:	079e089d 	.inst	0x079e089d ; undefined
 8a8:	0eddde51 	.inst	0x0eddde51 ; undefined
 8ac:	00000000 	udf	#0

00000000000008b0 <__FRAME_END__>:
 8b0:	00000000 	udf	#0

Disassembly of section .init_array:

0000000000010dc8 <__frame_dummy_init_array_entry>:
   10dc8:	00000750 	udf	#1872
   10dcc:	00000000 	udf	#0

Disassembly of section .fini_array:

0000000000010dd0 <__do_global_dtors_aux_fini_array_entry>:
   10dd0:	00000700 	udf	#1792
   10dd4:	00000000 	udf	#0

Disassembly of section .dynamic:

0000000000010dd8 <.dynamic>:
   10dd8:	00000001 	udf	#1
   10ddc:	00000000 	udf	#0
   10de0:	0000002f 	udf	#47
   10de4:	00000000 	udf	#0
   10de8:	0000000c 	udf	#12
   10dec:	00000000 	udf	#0
   10df0:	000005b8 	udf	#1464
   10df4:	00000000 	udf	#0
   10df8:	0000000d 	udf	#13
   10dfc:	00000000 	udf	#0
   10e00:	000007a0 	udf	#1952
   10e04:	00000000 	udf	#0
   10e08:	00000019 	udf	#25
   10e0c:	00000000 	udf	#0
   10e10:	00010dc8 	.inst	0x00010dc8 ; undefined
   10e14:	00000000 	udf	#0
   10e18:	0000001b 	udf	#27
   10e1c:	00000000 	udf	#0
   10e20:	00000008 	udf	#8
   10e24:	00000000 	udf	#0
   10e28:	0000001a 	udf	#26
   10e2c:	00000000 	udf	#0
   10e30:	00010dd0 	.inst	0x00010dd0 ; undefined
   10e34:	00000000 	udf	#0
   10e38:	0000001c 	udf	#28
   10e3c:	00000000 	udf	#0
   10e40:	00000008 	udf	#8
   10e44:	00000000 	udf	#0
   10e48:	6ffffef5 	.inst	0x6ffffef5 ; undefined
   10e4c:	00000000 	udf	#0
   10e50:	00000298 	udf	#664
   10e54:	00000000 	udf	#0
   10e58:	00000005 	udf	#5
   10e5c:	00000000 	udf	#0
   10e60:	000003a8 	udf	#936
   10e64:	00000000 	udf	#0
   10e68:	00000006 	udf	#6
   10e6c:	00000000 	udf	#0
   10e70:	000002b8 	udf	#696
   10e74:	00000000 	udf	#0
   10e78:	0000000a 	udf	#10
   10e7c:	00000000 	udf	#0
   10e80:	00000094 	udf	#148
   10e84:	00000000 	udf	#0
   10e88:	0000000b 	udf	#11
   10e8c:	00000000 	udf	#0
   10e90:	00000018 	udf	#24
   10e94:	00000000 	udf	#0
   10e98:	00000015 	udf	#21
	...
   10ea8:	00000003 	udf	#3
   10eac:	00000000 	udf	#0
   10eb0:	00010fe8 	.inst	0x00010fe8 ; undefined
   10eb4:	00000000 	udf	#0
   10eb8:	00000002 	udf	#2
   10ebc:	00000000 	udf	#0
   10ec0:	00000078 	udf	#120
   10ec4:	00000000 	udf	#0
   10ec8:	00000014 	udf	#20
   10ecc:	00000000 	udf	#0
   10ed0:	00000007 	udf	#7
   10ed4:	00000000 	udf	#0
   10ed8:	00000017 	udf	#23
   10edc:	00000000 	udf	#0
   10ee0:	00000540 	udf	#1344
   10ee4:	00000000 	udf	#0
   10ee8:	00000007 	udf	#7
   10eec:	00000000 	udf	#0
   10ef0:	00000480 	udf	#1152
   10ef4:	00000000 	udf	#0
   10ef8:	00000008 	udf	#8
   10efc:	00000000 	udf	#0
   10f00:	000000c0 	udf	#192
   10f04:	00000000 	udf	#0
   10f08:	00000009 	udf	#9
   10f0c:	00000000 	udf	#0
   10f10:	00000018 	udf	#24
   10f14:	00000000 	udf	#0
   10f18:	6ffffffb 	.inst	0x6ffffffb ; undefined
   10f1c:	00000000 	udf	#0
   10f20:	08000000 	stxrb	w0, w0, [x0]
   10f24:	00000000 	udf	#0
   10f28:	6ffffffe 	.inst	0x6ffffffe ; undefined
   10f2c:	00000000 	udf	#0
   10f30:	00000450 	udf	#1104
   10f34:	00000000 	udf	#0
   10f38:	6fffffff 	.inst	0x6fffffff ; undefined
   10f3c:	00000000 	udf	#0
   10f40:	00000001 	udf	#1
   10f44:	00000000 	udf	#0
   10f48:	6ffffff0 	.inst	0x6ffffff0 ; undefined
   10f4c:	00000000 	udf	#0
   10f50:	0000043c 	udf	#1084
   10f54:	00000000 	udf	#0
   10f58:	6ffffff9 	.inst	0x6ffffff9 ; undefined
   10f5c:	00000000 	udf	#0
   10f60:	00000004 	udf	#4
	...

Disassembly of section .got:

0000000000010fb8 <.got>:
   10fb8:	00010dd8 	.inst	0x00010dd8 ; undefined
	...
   10fd8:	00000754 	udf	#1876
	...

Disassembly of section .got.plt:

0000000000010fe8 <.got.plt>:
	...
   11000:	000005d0 	udf	#1488
   11004:	00000000 	udf	#0
   11008:	000005d0 	udf	#1488
   1100c:	00000000 	udf	#0
   11010:	000005d0 	udf	#1488
   11014:	00000000 	udf	#0
   11018:	000005d0 	udf	#1488
   1101c:	00000000 	udf	#0
   11020:	000005d0 	udf	#1488
   11024:	00000000 	udf	#0

Disassembly of section .data:

0000000000011028 <__data_start>:
	...

0000000000011030 <__dso_handle>:
   11030:	00011030 	.inst	0x00011030 ; undefined
   11034:	00000000 	udf	#0

Disassembly of section .bss:

0000000000011038 <completed.0>:
	...

0000000000011040 <ptr>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi  // mi = first
   4:	4e472820 	trn1	v0.8h, v1.8h, v7.8h
   8:	31202955 	adds	w21, w10, #0x80a
   c:	2e322e31 	uqsub	v17.8b, v17.8b, v18.8b
  10:	Address 0x0000000000000010 is out of bounds.

