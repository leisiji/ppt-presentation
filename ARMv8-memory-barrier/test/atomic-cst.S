
a.out:     file format elf64-littleaarch64


Disassembly of section .interp:

0000000000000238 <.interp>:
 238:	62696c2f 	.inst	0x62696c2f ; undefined
 23c:	2d646c2f 	ldp	s15, s27, [x1, #-224]
 240:	756e696c 	.inst	0x756e696c ; undefined
 244:	61612d78 	.inst	0x61612d78 ; undefined
 248:	36686372 	tbz	w18, #13, eb4 <__FRAME_END__+0x354>
 24c:	6f732e34 	.inst	0x6f732e34 ; undefined
 250:	Address 0x0000000000000250 is out of bounds.


Disassembly of section .note.gnu.build-id:

0000000000000254 <.note.gnu.build-id>:
 254:	00000004 	udf	#4
 258:	00000014 	udf	#20
 25c:	00000003 	udf	#3
 260:	00554e47 	.inst	0x00554e47 ; undefined
 264:	ba150d03 	.inst	0xba150d03 ; undefined
 268:	8d5b7b54 	.inst	0x8d5b7b54 ; undefined
 26c:	f6dfd455 	.inst	0xf6dfd455 ; undefined
 270:	2d446774 	ldp	s20, s25, [x27, #32]
 274:	1341de71 	.inst	0x1341de71 ; undefined

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
 2d8:	00000678 	udf	#1656
	...
 2ec:	00170003 	.inst	0x00170003 ; undefined
 2f0:	00011040 	.inst	0x00011040 ; undefined
	...
 300:	0000001e 	udf	#30
 304:	00000012 	udf	#18
	...
 318:	00000073 	udf	#115
 31c:	00000020 	udf	#32
	...
 330:	00000001 	udf	#1
 334:	00000022 	udf	#34
	...
 348:	00000046 	udf	#70
 34c:	00000012 	udf	#18
	...
 360:	0000008f 	udf	#143
 364:	00000020 	udf	#32
	...
 378:	0000004d 	udf	#77
 37c:	00000012 	udf	#18
	...
 390:	00000030 	udf	#48
 394:	00000012 	udf	#18
	...
 3a8:	00000037 	udf	#55
 3ac:	00000012 	udf	#18
	...
 3c0:	0000009e 	udf	#158
 3c4:	00000020 	udf	#32
	...
 3d8:	00000010 	udf	#16
 3dc:	00000012 	udf	#18
	...

Disassembly of section .dynstr:

00000000000003f0 <.dynstr>:
 3f0:	635f5f00 	.inst	0x635f5f00 ; undefined
 3f4:	665f6178 	.inst	0x665f6178 ; undefined
 3f8:	6c616e69 	ldnp	d9, d27, [x19, #-496]
 3fc:	00657a69 	.inst	0x00657a69 ; undefined
 400:	73615f5f 	.inst	0x73615f5f ; undefined
 404:	74726573 	.inst	0x74726573 ; undefined
 408:	6961665f 	ldpsw	xzr, x25, [x18, #-248]
 40c:	5f5f006c 	.inst	0x5f5f006c ; undefined
 410:	6362696c 	.inst	0x6362696c ; undefined
 414:	6174735f 	.inst	0x6174735f ; undefined
 418:	6d5f7472 	ldp	d18, d29, [x3, #496]
 41c:	006e6961 	.inst	0x006e6961 ; undefined
 420:	63727473 	.inst	0x63727473 ; undefined
 424:	7000706d 	adr	x13, 1233 <__FRAME_END__+0x6d3>
 428:	65726874 	fnmls	z20.h, p2/m, z3.h, z18.h
 42c:	635f6461 	.inst	0x635f6461 ; undefined
 430:	74616572 	.inst	0x74616572 ; undefined
 434:	74730065 	.inst	0x74730065 ; undefined
 438:	70756472 	adr	x18, eb0c7 <__bss_end__+0xda05f>
 43c:	6f626100 	umlsl2	v0.4s, v8.8h, v2.h[2]
 440:	6c007472 	stnp	d18, d29, [x3]
 444:	2e636269 	rsubhn	v9.4h, v19.4s, v3.4s
 448:	362e6f73 	tbz	w19, #5, ffffffffffffd234 <__bss_end__+0xfffffffffffec1cc>
 44c:	494c4700 	.inst	0x494c4700 ; undefined
 450:	325f4342 	.inst	0x325f4342 ; undefined
 454:	0037312e 	.inst	0x0037312e ; NYI
 458:	42494c47 	.inst	0x42494c47 ; undefined
 45c:	2e325f43 	uqrshl	v3.8b, v26.8b, v18.8b
 460:	5f003433 	.inst	0x5f003433 ; undefined
 464:	5f4d5449 	shl	d9, d2, #13
 468:	65726564 	fnmls	z4.h, p1/m, z11.h, z18.h
 46c:	74736967 	.inst	0x74736967 ; undefined
 470:	4d547265 	.inst	0x4d547265 ; undefined
 474:	6e6f6c43 	umin	v3.8h, v2.8h, v15.8h
 478:	62615465 	.inst	0x62615465 ; undefined
 47c:	5f00656c 	.inst	0x5f00656c ; undefined
 480:	6f6d675f 	sqshlu	v31.2d, v26.2d, #45
 484:	74735f6e 	.inst	0x74735f6e ; undefined
 488:	5f747261 	sqdmlsl	s1, h19, v4.h[3]
 48c:	495f005f 	.inst	0x495f005f ; undefined
 490:	725f4d54 	.inst	0x725f4d54 ; undefined
 494:	73696765 	.inst	0x73696765 ; undefined
 498:	54726574 	bc.mi	e5144 <__bss_end__+0xd40dc>  // bc.first
 49c:	6f6c434d 	mls	v13.8h, v26.8h, v12.h[2]
 4a0:	6154656e 	.inst	0x6154656e ; undefined
 4a4:	00656c62 	.inst	0x00656c62 ; undefined

Disassembly of section .gnu.version:

00000000000004a8 <.gnu.version>:
 4a8:	00000000 	udf	#0
 4ac:	00020000 	.inst	0x00020000 ; undefined
 4b0:	00030001 	.inst	0x00030001 ; undefined
 4b4:	00010003 	.inst	0x00010003 ; undefined
 4b8:	00030003 	.inst	0x00030003 ; undefined
 4bc:	00010002 	.inst	0x00010002 ; undefined
 4c0:	Address 0x00000000000004c0 is out of bounds.


Disassembly of section .gnu.version_r:

00000000000004c8 <.gnu.version_r>:
 4c8:	00020001 	.inst	0x00020001 ; undefined
 4cc:	00000053 	udf	#83
 4d0:	00000010 	udf	#16
 4d4:	00000000 	udf	#0
 4d8:	06969197 	.inst	0x06969197 ; undefined
 4dc:	00030000 	.inst	0x00030000 ; undefined
 4e0:	0000005d 	udf	#93
 4e4:	00000010 	udf	#16
 4e8:	069691b4 	.inst	0x069691b4 ; undefined
 4ec:	00020000 	.inst	0x00020000 ; undefined
 4f0:	00000068 	udf	#104
 4f4:	00000000 	udf	#0

Disassembly of section .rela.dyn:

00000000000004f8 <.rela.dyn>:
 4f8:	00010dc8 	.inst	0x00010dc8 ; undefined
 4fc:	00000000 	udf	#0
 500:	00000403 	udf	#1027
 504:	00000000 	udf	#0
 508:	00000850 	udf	#2128
 50c:	00000000 	udf	#0
 510:	00010dd0 	.inst	0x00010dd0 ; undefined
 514:	00000000 	udf	#0
 518:	00000403 	udf	#1027
 51c:	00000000 	udf	#0
 520:	00000800 	udf	#2048
 524:	00000000 	udf	#0
 528:	00010fd8 	.inst	0x00010fd8 ; undefined
 52c:	00000000 	udf	#0
 530:	00000403 	udf	#1027
 534:	00000000 	udf	#0
 538:	00000964 	udf	#2404
 53c:	00000000 	udf	#0
 540:	00011048 	.inst	0x00011048 ; undefined
 544:	00000000 	udf	#0
 548:	00000403 	udf	#1027
 54c:	00000000 	udf	#0
 550:	00011048 	.inst	0x00011048 ; undefined
 554:	00000000 	udf	#0
 558:	00010fc0 	.inst	0x00010fc0 ; undefined
 55c:	00000000 	udf	#0
 560:	00000401 	udf	#1025
 564:	00000004 	udf	#4
	...
 570:	00010fc8 	.inst	0x00010fc8 ; undefined
 574:	00000000 	udf	#0
 578:	00000401 	udf	#1025
 57c:	00000005 	udf	#5
	...
 588:	00010fd0 	.inst	0x00010fd0 ; undefined
 58c:	00000000 	udf	#0
 590:	00000401 	udf	#1025
 594:	00000007 	udf	#7
	...
 5a0:	00010fe0 	.inst	0x00010fe0 ; undefined
 5a4:	00000000 	udf	#0
 5a8:	00000401 	udf	#1025
 5ac:	0000000b 	udf	#11
	...

Disassembly of section .rela.plt:

00000000000005b8 <.rela.plt>:
 5b8:	00011000 	.inst	0x00011000 ; undefined
 5bc:	00000000 	udf	#0
 5c0:	00000402 	udf	#1026
 5c4:	00000003 	udf	#3
	...
 5d0:	00011008 	.inst	0x00011008 ; undefined
 5d4:	00000000 	udf	#0
 5d8:	00000402 	udf	#1026
 5dc:	00000005 	udf	#5
	...
 5e8:	00011010 	.inst	0x00011010 ; undefined
 5ec:	00000000 	udf	#0
 5f0:	00000402 	udf	#1026
 5f4:	00000006 	udf	#6
	...
 600:	00011018 	.inst	0x00011018 ; undefined
 604:	00000000 	udf	#0
 608:	00000402 	udf	#1026
 60c:	00000007 	udf	#7
	...
 618:	00011020 	.inst	0x00011020 ; undefined
 61c:	00000000 	udf	#0
 620:	00000402 	udf	#1026
 624:	00000008 	udf	#8
	...
 630:	00011028 	.inst	0x00011028 ; undefined
 634:	00000000 	udf	#0
 638:	00000402 	udf	#1026
 63c:	00000009 	udf	#9
	...
 648:	00011030 	.inst	0x00011030 ; undefined
 64c:	00000000 	udf	#0
 650:	00000402 	udf	#1026
 654:	0000000a 	udf	#10
	...
 660:	00011038 	.inst	0x00011038 ; undefined
 664:	00000000 	udf	#0
 668:	00000402 	udf	#1026
 66c:	0000000c 	udf	#12
	...

Disassembly of section .init:

0000000000000678 <_init>:
 678:	d503201f 	nop
 67c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 680:	910003fd 	mov	x29, sp
 684:	9400003c 	bl	774 <call_weak_fn>
 688:	a8c17bfd 	ldp	x29, x30, [sp], #16
 68c:	d65f03c0 	ret

Disassembly of section .plt:

0000000000000690 <.plt>:
 690:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 694:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf4a0>
 698:	f947fe11 	ldr	x17, [x16, #4088]
 69c:	913fe210 	add	x16, x16, #0xff8
 6a0:	d61f0220 	br	x17
 6a4:	d503201f 	nop
 6a8:	d503201f 	nop
 6ac:	d503201f 	nop

00000000000006b0 <__libc_start_main@plt>:
 6b0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6b4:	f9400211 	ldr	x17, [x16]
 6b8:	91000210 	add	x16, x16, #0x0
 6bc:	d61f0220 	br	x17

00000000000006c0 <__cxa_finalize@plt>:
 6c0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6c4:	f9400611 	ldr	x17, [x16, #8]
 6c8:	91002210 	add	x16, x16, #0x8
 6cc:	d61f0220 	br	x17

00000000000006d0 <strdup@plt>:
 6d0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6d4:	f9400a11 	ldr	x17, [x16, #16]
 6d8:	91004210 	add	x16, x16, #0x10
 6dc:	d61f0220 	br	x17

00000000000006e0 <__gmon_start__@plt>:
 6e0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6e4:	f9400e11 	ldr	x17, [x16, #24]
 6e8:	91006210 	add	x16, x16, #0x18
 6ec:	d61f0220 	br	x17

00000000000006f0 <abort@plt>:
 6f0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6f4:	f9401211 	ldr	x17, [x16, #32]
 6f8:	91008210 	add	x16, x16, #0x20
 6fc:	d61f0220 	br	x17

0000000000000700 <strcmp@plt>:
 700:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 704:	f9401611 	ldr	x17, [x16, #40]
 708:	9100a210 	add	x16, x16, #0x28
 70c:	d61f0220 	br	x17

0000000000000710 <pthread_create@plt>:
 710:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 714:	f9401a11 	ldr	x17, [x16, #48]
 718:	9100c210 	add	x16, x16, #0x30
 71c:	d61f0220 	br	x17

0000000000000720 <__assert_fail@plt>:
 720:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 724:	f9401e11 	ldr	x17, [x16, #56]
 728:	9100e210 	add	x16, x16, #0x38
 72c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000740 <_start>:
 740:	d503201f 	nop
 744:	d280001d 	mov	x29, #0x0                   	// #0
 748:	d280001e 	mov	x30, #0x0                   	// #0
 74c:	aa0003e5 	mov	x5, x0
 750:	f94003e1 	ldr	x1, [sp]
 754:	910023e2 	add	x2, sp, #0x8
 758:	910003e6 	mov	x6, sp
 75c:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf4a0>
 760:	f947ec00 	ldr	x0, [x0, #4056]
 764:	d2800003 	mov	x3, #0x0                   	// #0
 768:	d2800004 	mov	x4, #0x0                   	// #0
 76c:	97ffffd1 	bl	6b0 <__libc_start_main@plt>
 770:	97ffffe0 	bl	6f0 <abort@plt>

0000000000000774 <call_weak_fn>:
 774:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf4a0>
 778:	f947e800 	ldr	x0, [x0, #4048]
 77c:	b4000040 	cbz	x0, 784 <call_weak_fn+0x10>
 780:	17ffffd8 	b	6e0 <__gmon_start__@plt>
 784:	d65f03c0 	ret
 788:	d503201f 	nop
 78c:	d503201f 	nop

0000000000000790 <deregister_tm_clones>:
 790:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 794:	91014000 	add	x0, x0, #0x50
 798:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 79c:	91014021 	add	x1, x1, #0x50
 7a0:	eb00003f 	cmp	x1, x0
 7a4:	540000c0 	b.eq	7bc <deregister_tm_clones+0x2c>  // b.none
 7a8:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf4a0>
 7ac:	f947e021 	ldr	x1, [x1, #4032]
 7b0:	b4000061 	cbz	x1, 7bc <deregister_tm_clones+0x2c>
 7b4:	aa0103f0 	mov	x16, x1
 7b8:	d61f0200 	br	x16
 7bc:	d65f03c0 	ret

00000000000007c0 <register_tm_clones>:
 7c0:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 7c4:	91014000 	add	x0, x0, #0x50
 7c8:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 7cc:	91014021 	add	x1, x1, #0x50
 7d0:	cb000021 	sub	x1, x1, x0
 7d4:	d37ffc22 	lsr	x2, x1, #63
 7d8:	8b810c41 	add	x1, x2, x1, asr #3
 7dc:	9341fc21 	asr	x1, x1, #1
 7e0:	b40000c1 	cbz	x1, 7f8 <register_tm_clones+0x38>
 7e4:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf4a0>
 7e8:	f947f042 	ldr	x2, [x2, #4064]
 7ec:	b4000062 	cbz	x2, 7f8 <register_tm_clones+0x38>
 7f0:	aa0203f0 	mov	x16, x2
 7f4:	d61f0200 	br	x16
 7f8:	d65f03c0 	ret
 7fc:	d503201f 	nop

0000000000000800 <__do_global_dtors_aux>:
 800:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 804:	910003fd 	mov	x29, sp
 808:	f9000bf3 	str	x19, [sp, #16]
 80c:	b0000093 	adrp	x19, 11000 <__libc_start_main@GLIBC_2.34>
 810:	39414260 	ldrb	w0, [x19, #80]
 814:	35000140 	cbnz	w0, 83c <__do_global_dtors_aux+0x3c>
 818:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf4a0>
 81c:	f947e400 	ldr	x0, [x0, #4040]
 820:	b4000080 	cbz	x0, 830 <__do_global_dtors_aux+0x30>
 824:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 828:	f9402400 	ldr	x0, [x0, #72]
 82c:	97ffffa5 	bl	6c0 <__cxa_finalize@plt>
 830:	97ffffd8 	bl	790 <deregister_tm_clones>
 834:	52800020 	mov	w0, #0x1                   	// #1
 838:	39014260 	strb	w0, [x19, #80]
 83c:	f9400bf3 	ldr	x19, [sp, #16]
 840:	a8c27bfd 	ldp	x29, x30, [sp], #32
 844:	d65f03c0 	ret
 848:	d503201f 	nop
 84c:	d503201f 	nop

0000000000000850 <frame_dummy>:
 850:	17ffffdc 	b	7c0 <register_tm_clones>

0000000000000854 <producer>:
 854:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 858:	910003fd 	mov	x29, sp
 85c:	f9000fe0 	str	x0, [sp, #24]
 860:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 864:	91276000 	add	x0, x0, #0x9d8
 868:	97ffff9a 	bl	6d0 <strdup@plt>
 86c:	f9001fe0 	str	x0, [sp, #56]
 870:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 874:	91016000 	add	x0, x0, #0x58
 878:	52800541 	mov	w1, #0x2a                  	// #42
 87c:	b9000001 	str	w1, [x0]
 880:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 884:	91018000 	add	x0, x0, #0x60
 888:	f9001be0 	str	x0, [sp, #48]
 88c:	f9401fe0 	ldr	x0, [sp, #56]
 890:	f90017e0 	str	x0, [sp, #40]
 894:	f94017e1 	ldr	x1, [sp, #40]
 898:	f9401be0 	ldr	x0, [sp, #48]
 89c:	c89ffc01 	stlr	x1, [x0]
 8a0:	d2800000 	mov	x0, #0x0                   	// #0
 8a4:	a8c47bfd 	ldp	x29, x30, [sp], #64
 8a8:	d65f03c0 	ret

00000000000008ac <consumer>:
 8ac:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 8b0:	910003fd 	mov	x29, sp
 8b4:	f9000fe0 	str	x0, [sp, #24]
 8b8:	f9001fff 	str	xzr, [sp, #56]
 8bc:	d503201f 	nop

 8c0:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 8c4:	91018000 	add	x0, x0, #0x60
 8c8:	f9001be0 	str	x0, [sp, #48]
 8cc:	f9401be0 	ldr	x0, [sp, #48]
 8d0:	c8dffc00 	ldar	x0, [x0]
 8d4:	f90017e0 	str	x0, [sp, #40]
 8d8:	f94017e0 	ldr	x0, [sp, #40]
 8dc:	f9001fe0 	str	x0, [sp, #56]
 8e0:	f9401fe0 	ldr	x0, [sp, #56]
 8e4:	f100001f 	cmp	x0, #0x0
 8e8:	54fffec0 	b.eq	8c0 <consumer+0x14>  // b.none

 8ec:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 8f0:	91276001 	add	x1, x0, #0x9d8
 8f4:	f9401fe0 	ldr	x0, [sp, #56]
 8f8:	97ffff82 	bl	700 <strcmp@plt>
 8fc:	7100001f 	cmp	w0, #0x0
 900:	54000120 	b.eq	924 <consumer+0x78>  // b.none

 904:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 908:	91288003 	add	x3, x0, #0xa20
 90c:	528002c2 	mov	w2, #0x16                  	// #22
 910:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 914:	9127a001 	add	x1, x0, #0x9e8
 918:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 91c:	9127e000 	add	x0, x0, #0x9f8
 920:	97ffff80 	bl	720 <__assert_fail@plt>
 924:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 928:	91016000 	add	x0, x0, #0x58
 92c:	b9400000 	ldr	w0, [x0]
 930:	7100a81f 	cmp	w0, #0x2a
 934:	54000120 	b.eq	958 <consumer+0xac>  // b.none
 938:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 93c:	91288003 	add	x3, x0, #0xa20
 940:	528002e2 	mov	w2, #0x17                  	// #23
 944:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 948:	9127a001 	add	x1, x0, #0x9e8
 94c:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 950:	91284000 	add	x0, x0, #0xa10
 954:	97ffff73 	bl	720 <__assert_fail@plt>
 958:	d2800000 	mov	x0, #0x0                   	// #0
 95c:	a8c47bfd 	ldp	x29, x30, [sp], #64
 960:	d65f03c0 	ret

0000000000000964 <main>:
 964:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 968:	910003fd 	mov	x29, sp
 96c:	b9001fe0 	str	w0, [sp, #28]
 970:	f9000be1 	str	x1, [sp, #16]
 974:	9100a3e4 	add	x4, sp, #0x28
 978:	d2800003 	mov	x3, #0x0                   	// #0
 97c:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 980:	91215002 	add	x2, x0, #0x854
 984:	d2800001 	mov	x1, #0x0                   	// #0
 988:	aa0403e0 	mov	x0, x4
 98c:	97ffff61 	bl	710 <pthread_create@plt>
 990:	910083e4 	add	x4, sp, #0x20
 994:	d2800003 	mov	x3, #0x0                   	// #0
 998:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 99c:	9122b002 	add	x2, x0, #0x8ac
 9a0:	d2800001 	mov	x1, #0x0                   	// #0
 9a4:	aa0403e0 	mov	x0, x4
 9a8:	97ffff5a 	bl	710 <pthread_create@plt>
 9ac:	52800000 	mov	w0, #0x0                   	// #0
 9b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
 9b4:	d65f03c0 	ret

Disassembly of section .fini:

00000000000009b8 <_fini>:
 9b8:	d503201f 	nop
 9bc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 9c0:	910003fd 	mov	x29, sp
 9c4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 9c8:	d65f03c0 	ret

Disassembly of section .rodata:

00000000000009d0 <_IO_stdin_used>:
 9d0:	00020001 	.inst	0x00020001 ; undefined
 9d4:	00000000 	udf	#0
 9d8:	6c6c6568 	ldnp	d8, d25, [x11, #-320]
 9dc:	6f77206f 	umlal2	v15.4s, v3.8h, v7.h[3]
 9e0:	00646c72 	.inst	0x00646c72 ; undefined
 9e4:	00000000 	udf	#0
 9e8:	6d6f7461 	ldp	d1, d29, [x3, #-272]
 9ec:	632d6369 	.inst	0x632d6369 ; undefined
 9f0:	632e7473 	.inst	0x632e7473 ; undefined
 9f4:	00000000 	udf	#0
 9f8:	72747321 	.inst	0x72747321 ; undefined
 9fc:	28706d63 	ldnp	w3, w27, [x11, #-128]
 a00:	202c3270 	.inst	0x202c3270 ; undefined
 a04:	49525453 	.inst	0x49525453 ; undefined
 a08:	0029474e 	.inst	0x0029474e ; NYI
 a0c:	00000000 	udf	#0
 a10:	61746164 	.inst	0x61746164 ; undefined
 a14:	203d3d20 	.inst	0x203d3d20 ; undefined
 a18:	00003234 	udf	#12852
 a1c:	00000000 	udf	#0

0000000000000a20 <__PRETTY_FUNCTION__.0>:
 a20:	736e6f63 	.inst	0x736e6f63 ; undefined
 a24:	72656d75 	.inst	0x72656d75 ; undefined
	...

Disassembly of section .eh_frame_hdr:

0000000000000a2c <__GNU_EH_FRAME_HDR>:
 a2c:	3b031b01 	.inst	0x3b031b01 ; undefined
 a30:	00000048 	udf	#72
 a34:	00000008 	udf	#8
 a38:	fffffd14 	.inst	0xfffffd14 ; undefined
 a3c:	00000060 	udf	#96
 a40:	fffffd64 	.inst	0xfffffd64 ; undefined
 a44:	00000074 	udf	#116
 a48:	fffffd94 	.inst	0xfffffd94 ; undefined
 a4c:	00000088 	udf	#136
 a50:	fffffdd4 	.inst	0xfffffdd4 ; undefined
 a54:	0000009c 	udf	#156
 a58:	fffffe24 	.inst	0xfffffe24 ; undefined
 a5c:	000000c0 	udf	#192
 a60:	fffffe28 	.inst	0xfffffe28 ; undefined
 a64:	000000d4 	udf	#212
 a68:	fffffe80 	.inst	0xfffffe80 ; undefined
 a6c:	000000f4 	udf	#244
 a70:	ffffff38 	.inst	0xffffff38 ; undefined
 a74:	00000114 	udf	#276

Disassembly of section .eh_frame:

0000000000000a78 <__FRAME_END__-0xe8>:
 a78:	00000010 	udf	#16
 a7c:	00000000 	udf	#0
 a80:	00527a01 	.inst	0x00527a01 ; undefined
 a84:	011e7804 	.inst	0x011e7804 ; undefined
 a88:	001f0c1b 	.inst	0x001f0c1b ; undefined
 a8c:	00000010 	udf	#16
 a90:	00000018 	udf	#24
 a94:	fffffcac 	.inst	0xfffffcac ; undefined
 a98:	00000034 	udf	#52
 a9c:	1e074100 	.inst	0x1e074100 ; undefined
 aa0:	00000010 	udf	#16
 aa4:	0000002c 	udf	#44
 aa8:	fffffce8 	.inst	0xfffffce8 ; undefined
 aac:	00000030 	udf	#48
 ab0:	00000000 	udf	#0
 ab4:	00000010 	udf	#16
 ab8:	00000040 	udf	#64
 abc:	fffffd04 	.inst	0xfffffd04 ; undefined
 ac0:	0000003c 	udf	#60
 ac4:	00000000 	udf	#0
 ac8:	00000020 	udf	#32
 acc:	00000054 	udf	#84
 ad0:	fffffd30 	.inst	0xfffffd30 ; undefined
 ad4:	00000048 	udf	#72
 ad8:	200e4100 	.inst	0x200e4100 ; undefined
 adc:	039e049d 	.inst	0x039e049d ; undefined
 ae0:	4e029342 	.inst	0x4e029342 ; undefined
 ae4:	0ed3ddde 	.inst	0x0ed3ddde ; undefined
 ae8:	00000000 	udf	#0
 aec:	00000010 	udf	#16
 af0:	00000078 	udf	#120
 af4:	fffffd5c 	.inst	0xfffffd5c ; undefined
 af8:	00000004 	udf	#4
 afc:	00000000 	udf	#0
 b00:	0000001c 	udf	#28
 b04:	0000008c 	udf	#140
 b08:	fffffd4c 	.inst	0xfffffd4c ; undefined
 b0c:	00000058 	udf	#88
 b10:	400e4100 	.inst	0x400e4100 ; undefined
 b14:	079e089d 	.inst	0x079e089d ; undefined
 b18:	0eddde54 	.inst	0x0eddde54 ; undefined
 b1c:	00000000 	udf	#0
 b20:	0000001c 	udf	#28
 b24:	000000ac 	udf	#172
 b28:	fffffd84 	.inst	0xfffffd84 ; undefined
 b2c:	000000b8 	udf	#184
 b30:	400e4100 	.inst	0x400e4100 ; undefined
 b34:	079e089d 	.inst	0x079e089d ; undefined
 b38:	0eddde6c 	.inst	0x0eddde6c ; undefined
 b3c:	00000000 	udf	#0
 b40:	0000001c 	udf	#28
 b44:	000000cc 	udf	#204
 b48:	fffffe1c 	.inst	0xfffffe1c ; undefined
 b4c:	00000054 	udf	#84
 b50:	300e4100 	adr	x0, 1d371 <__bss_end__+0xc309>
 b54:	059e069d 	mov	z29.s, p14/z, #52
 b58:	0eddde53 	.inst	0x0eddde53 ; undefined
 b5c:	00000000 	udf	#0

0000000000000b60 <__FRAME_END__>:
 b60:	00000000 	udf	#0

Disassembly of section .init_array:

0000000000010dc8 <__frame_dummy_init_array_entry>:
   10dc8:	00000850 	udf	#2128
   10dcc:	00000000 	udf	#0

Disassembly of section .fini_array:

0000000000010dd0 <__do_global_dtors_aux_fini_array_entry>:
   10dd0:	00000800 	udf	#2048
   10dd4:	00000000 	udf	#0

Disassembly of section .dynamic:

0000000000010dd8 <.dynamic>:
   10dd8:	00000001 	udf	#1
   10ddc:	00000000 	udf	#0
   10de0:	00000053 	udf	#83
   10de4:	00000000 	udf	#0
   10de8:	0000000c 	udf	#12
   10dec:	00000000 	udf	#0
   10df0:	00000678 	udf	#1656
   10df4:	00000000 	udf	#0
   10df8:	0000000d 	udf	#13
   10dfc:	00000000 	udf	#0
   10e00:	000009b8 	udf	#2488
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
   10e60:	000003f0 	udf	#1008
   10e64:	00000000 	udf	#0
   10e68:	00000006 	udf	#6
   10e6c:	00000000 	udf	#0
   10e70:	000002b8 	udf	#696
   10e74:	00000000 	udf	#0
   10e78:	0000000a 	udf	#10
   10e7c:	00000000 	udf	#0
   10e80:	000000b8 	udf	#184
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
   10ec0:	000000c0 	udf	#192
   10ec4:	00000000 	udf	#0
   10ec8:	00000014 	udf	#20
   10ecc:	00000000 	udf	#0
   10ed0:	00000007 	udf	#7
   10ed4:	00000000 	udf	#0
   10ed8:	00000017 	udf	#23
   10edc:	00000000 	udf	#0
   10ee0:	000005b8 	udf	#1464
   10ee4:	00000000 	udf	#0
   10ee8:	00000007 	udf	#7
   10eec:	00000000 	udf	#0
   10ef0:	000004f8 	udf	#1272
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
   10f30:	000004c8 	udf	#1224
   10f34:	00000000 	udf	#0
   10f38:	6fffffff 	.inst	0x6fffffff ; undefined
   10f3c:	00000000 	udf	#0
   10f40:	00000001 	udf	#1
   10f44:	00000000 	udf	#0
   10f48:	6ffffff0 	.inst	0x6ffffff0 ; undefined
   10f4c:	00000000 	udf	#0
   10f50:	000004a8 	udf	#1192
   10f54:	00000000 	udf	#0
   10f58:	6ffffff9 	.inst	0x6ffffff9 ; undefined
   10f5c:	00000000 	udf	#0
   10f60:	00000004 	udf	#4
	...

Disassembly of section .got:

0000000000010fb8 <.got>:
   10fb8:	00010dd8 	.inst	0x00010dd8 ; undefined
	...
   10fd8:	00000964 	udf	#2404
	...

Disassembly of section .got.plt:

0000000000010fe8 <.got.plt>:
	...
   11000:	00000690 	udf	#1680
   11004:	00000000 	udf	#0
   11008:	00000690 	udf	#1680
   1100c:	00000000 	udf	#0
   11010:	00000690 	udf	#1680
   11014:	00000000 	udf	#0
   11018:	00000690 	udf	#1680
   1101c:	00000000 	udf	#0
   11020:	00000690 	udf	#1680
   11024:	00000000 	udf	#0
   11028:	00000690 	udf	#1680
   1102c:	00000000 	udf	#0
   11030:	00000690 	udf	#1680
   11034:	00000000 	udf	#0
   11038:	00000690 	udf	#1680
   1103c:	00000000 	udf	#0

Disassembly of section .data:

0000000000011040 <__data_start>:
	...

0000000000011048 <__dso_handle>:
   11048:	00011048 	.inst	0x00011048 ; undefined
   1104c:	00000000 	udf	#0

Disassembly of section .bss:

0000000000011050 <completed.0>:
	...

0000000000011058 <data>:
	...

0000000000011060 <ptr>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi  // mi = first
   4:	4e472820 	trn1	v0.8h, v1.8h, v7.8h
   8:	31202955 	adds	w21, w10, #0x80a
   c:	2e322e31 	uqsub	v17.8b, v17.8b, v18.8b
  10:	Address 0x0000000000000010 is out of bounds.

