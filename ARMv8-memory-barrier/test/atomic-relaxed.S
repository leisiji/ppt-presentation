
a.out:     file format elf64-littleaarch64


Disassembly of section .interp:

0000000000000238 <.interp>:
 238:	62696c2f 	.inst	0x62696c2f ; undefined
 23c:	2d646c2f 	ldp	s15, s27, [x1, #-224]
 240:	756e696c 	.inst	0x756e696c ; undefined
 244:	61612d78 	.inst	0x61612d78 ; undefined
 248:	36686372 	tbz	w18, #13, eb4 <__FRAME_END__+0x31c>
 24c:	6f732e34 	.inst	0x6f732e34 ; undefined
 250:	Address 0x0000000000000250 is out of bounds.


Disassembly of section .note.gnu.build-id:

0000000000000254 <.note.gnu.build-id>:
 254:	00000004 	udf	#4
 258:	00000014 	udf	#20
 25c:	00000003 	udf	#3
 260:	00554e47 	.inst	0x00554e47 ; undefined
 264:	11d5f416 	.inst	0x11d5f416 ; undefined
 268:	ba7c53e4 	.inst	0xba7c53e4 ; undefined
 26c:	ec090750 	.inst	0xec090750 ; undefined
 270:	d9568fee 	.inst	0xd9568fee ; undefined
 274:	8e3799ce 	.inst	0x8e3799ce ; undefined

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
 2d8:	00000690 	udf	#1680
	...
 2ec:	00170003 	.inst	0x00170003 ; undefined
 2f0:	00011040 	.inst	0x00011040 ; undefined
	...
 300:	00000029 	udf	#41
 304:	00000012 	udf	#18
	...
 318:	00000077 	udf	#119
 31c:	00000020 	udf	#32
	...
 330:	00000001 	udf	#1
 334:	00000022 	udf	#34
	...
 348:	00000093 	udf	#147
 34c:	00000020 	udf	#32
	...
 360:	0000001d 	udf	#29
 364:	00000012 	udf	#18
	...
 378:	0000004a 	udf	#74
 37c:	00000012 	udf	#18
	...
 390:	0000003b 	udf	#59
 394:	00000012 	udf	#18
	...
 3a8:	000000a2 	udf	#162
 3ac:	00000020 	udf	#32
	...
 3c0:	00000050 	udf	#80
 3c4:	00000012 	udf	#18
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
 400:	72687470 	.inst	0x72687470 ; undefined
 404:	5f646165 	.inst	0x5f646165 ; undefined
 408:	6e696f6a 	umin	v10.8h, v27.8h, v9.8h
 40c:	675f5f00 	.inst	0x675f5f00 ; undefined
 410:	75617465 	.inst	0x75617465 ; undefined
 414:	6c617678 	ldnp	d24, d29, [x19, #-496]
 418:	6c5f5f00 	ldnp	d0, d23, [x24, #496]
 41c:	5f636269 	.inst	0x5f636269 ; undefined
 420:	72617473 	.inst	0x72617473 ; undefined
 424:	616d5f74 	.inst	0x616d5f74 ; undefined
 428:	70006e69 	adr	x9, 11f7 <__FRAME_END__+0x65f>
 42c:	65726874 	fnmls	z20.h, p2/m, z3.h, z18.h
 430:	635f6461 	.inst	0x635f6461 ; undefined
 434:	74616572 	.inst	0x74616572 ; undefined
 438:	62610065 	.inst	0x62610065 ; undefined
 43c:	0074726f 	.inst	0x0074726f ; undefined
 440:	6e697270 	uabdl2	v16.4s, v19.8h, v9.8h
 444:	6c006674 	stnp	d20, d25, [x19]
 448:	2e636269 	rsubhn	v9.4h, v19.4s, v3.4s
 44c:	362e6f73 	tbz	w19, #5, ffffffffffffd238 <__bss_end__+0xfffffffffffec1e0>
 450:	494c4700 	.inst	0x494c4700 ; undefined
 454:	325f4342 	.inst	0x325f4342 ; undefined
 458:	0037312e 	.inst	0x0037312e ; NYI
 45c:	42494c47 	.inst	0x42494c47 ; undefined
 460:	2e325f43 	uqrshl	v3.8b, v26.8b, v18.8b
 464:	5f003433 	.inst	0x5f003433 ; undefined
 468:	5f4d5449 	shl	d9, d2, #13
 46c:	65726564 	fnmls	z4.h, p1/m, z11.h, z18.h
 470:	74736967 	.inst	0x74736967 ; undefined
 474:	4d547265 	.inst	0x4d547265 ; undefined
 478:	6e6f6c43 	umin	v3.8h, v2.8h, v15.8h
 47c:	62615465 	.inst	0x62615465 ; undefined
 480:	5f00656c 	.inst	0x5f00656c ; undefined
 484:	6f6d675f 	sqshlu	v31.2d, v26.2d, #45
 488:	74735f6e 	.inst	0x74735f6e ; undefined
 48c:	5f747261 	sqdmlsl	s1, h19, v4.h[3]
 490:	495f005f 	.inst	0x495f005f ; undefined
 494:	725f4d54 	.inst	0x725f4d54 ; undefined
 498:	73696765 	.inst	0x73696765 ; undefined
 49c:	54726574 	bc.mi	e5148 <__bss_end__+0xd40f0>  // bc.first
 4a0:	6f6c434d 	mls	v13.8h, v26.8h, v12.h[2]
 4a4:	6154656e 	.inst	0x6154656e ; undefined
 4a8:	00656c62 	.inst	0x00656c62 ; undefined

Disassembly of section .gnu.version:

00000000000004ac <.gnu.version>:
 4ac:	00000000 	udf	#0
 4b0:	00020000 	.inst	0x00020000 ; undefined
 4b4:	00030001 	.inst	0x00030001 ; undefined
 4b8:	00030001 	.inst	0x00030001 ; undefined
 4bc:	00020003 	.inst	0x00020003 ; undefined
 4c0:	00030001 	.inst	0x00030001 ; undefined
 4c4:	Address 0x00000000000004c4 is out of bounds.


Disassembly of section .gnu.version_r:

00000000000004c8 <.gnu.version_r>:
 4c8:	00020001 	.inst	0x00020001 ; undefined
 4cc:	00000057 	udf	#87
 4d0:	00000010 	udf	#16
 4d4:	00000000 	udf	#0
 4d8:	06969197 	.inst	0x06969197 ; undefined
 4dc:	00030000 	.inst	0x00030000 ; undefined
 4e0:	00000061 	udf	#97
 4e4:	00000010 	udf	#16
 4e8:	069691b4 	.inst	0x069691b4 ; undefined
 4ec:	00020000 	.inst	0x00020000 ; undefined
 4f0:	0000006c 	udf	#108
 4f4:	00000000 	udf	#0

Disassembly of section .rela.dyn:

00000000000004f8 <.rela.dyn>:
 4f8:	00010dc0 	.inst	0x00010dc0 ; undefined
 4fc:	00000000 	udf	#0
 500:	00000403 	udf	#1027
 504:	00000000 	udf	#0
 508:	000008d0 	udf	#2256
 50c:	00000000 	udf	#0
 510:	00010dc8 	.inst	0x00010dc8 ; undefined
 514:	00000000 	udf	#0
 518:	00000403 	udf	#1027
 51c:	00000000 	udf	#0
 520:	00000780 	udf	#1920
 524:	00000000 	udf	#0
 528:	00010dd0 	.inst	0x00010dd0 ; undefined
 52c:	00000000 	udf	#0
 530:	00000403 	udf	#1027
 534:	00000000 	udf	#0
 538:	00000880 	udf	#2176
 53c:	00000000 	udf	#0
 540:	00010fd8 	.inst	0x00010fd8 ; undefined
 544:	00000000 	udf	#0
 548:	00000403 	udf	#1027
 54c:	00000000 	udf	#0
 550:	00000924 	udf	#2340
 554:	00000000 	udf	#0
 558:	00011048 	.inst	0x00011048 ; undefined
 55c:	00000000 	udf	#0
 560:	00000403 	udf	#1027
 564:	00000000 	udf	#0
 568:	00011048 	.inst	0x00011048 ; undefined
 56c:	00000000 	udf	#0
 570:	00010fc0 	.inst	0x00010fc0 ; undefined
 574:	00000000 	udf	#0
 578:	00000401 	udf	#1025
 57c:	00000004 	udf	#4
	...
 588:	00010fc8 	.inst	0x00010fc8 ; undefined
 58c:	00000000 	udf	#0
 590:	00000401 	udf	#1025
 594:	00000005 	udf	#5
	...
 5a0:	00010fd0 	.inst	0x00010fd0 ; undefined
 5a4:	00000000 	udf	#0
 5a8:	00000401 	udf	#1025
 5ac:	00000006 	udf	#6
	...
 5b8:	00010fe0 	.inst	0x00010fe0 ; undefined
 5bc:	00000000 	udf	#0
 5c0:	00000401 	udf	#1025
 5c4:	0000000a 	udf	#10
	...

Disassembly of section .rela.plt:

00000000000005d0 <.rela.plt>:
 5d0:	00011000 	.inst	0x00011000 ; undefined
 5d4:	00000000 	udf	#0
 5d8:	00000402 	udf	#1026
 5dc:	00000003 	udf	#3
	...
 5e8:	00011008 	.inst	0x00011008 ; undefined
 5ec:	00000000 	udf	#0
 5f0:	00000402 	udf	#1026
 5f4:	00000005 	udf	#5
	...
 600:	00011010 	.inst	0x00011010 ; undefined
 604:	00000000 	udf	#0
 608:	00000402 	udf	#1026
 60c:	00000006 	udf	#6
	...
 618:	00011018 	.inst	0x00011018 ; undefined
 61c:	00000000 	udf	#0
 620:	00000402 	udf	#1026
 624:	00000007 	udf	#7
	...
 630:	00011020 	.inst	0x00011020 ; undefined
 634:	00000000 	udf	#0
 638:	00000402 	udf	#1026
 63c:	00000008 	udf	#8
	...
 648:	00011028 	.inst	0x00011028 ; undefined
 64c:	00000000 	udf	#0
 650:	00000402 	udf	#1026
 654:	00000009 	udf	#9
	...
 660:	00011030 	.inst	0x00011030 ; undefined
 664:	00000000 	udf	#0
 668:	00000402 	udf	#1026
 66c:	0000000b 	udf	#11
	...
 678:	00011038 	.inst	0x00011038 ; undefined
 67c:	00000000 	udf	#0
 680:	00000402 	udf	#1026
 684:	0000000c 	udf	#12
	...

Disassembly of section .init:

0000000000000690 <_init>:
 690:	d503201f 	nop
 694:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 698:	910003fd 	mov	x29, sp
 69c:	94000056 	bl	7f4 <call_weak_fn>
 6a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 6a4:	d65f03c0 	ret

Disassembly of section .plt:

00000000000006b0 <.plt>:
 6b0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 6b4:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf468>
 6b8:	f947fe11 	ldr	x17, [x16, #4088]
 6bc:	913fe210 	add	x16, x16, #0xff8
 6c0:	d61f0220 	br	x17
 6c4:	d503201f 	nop
 6c8:	d503201f 	nop
 6cc:	d503201f 	nop

00000000000006d0 <__libc_start_main@plt>:
 6d0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6d4:	f9400211 	ldr	x17, [x16]
 6d8:	91000210 	add	x16, x16, #0x0
 6dc:	d61f0220 	br	x17

00000000000006e0 <__cxa_finalize@plt>:
 6e0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6e4:	f9400611 	ldr	x17, [x16, #8]
 6e8:	91002210 	add	x16, x16, #0x8
 6ec:	d61f0220 	br	x17

00000000000006f0 <__gmon_start__@plt>:
 6f0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 6f4:	f9400a11 	ldr	x17, [x16, #16]
 6f8:	91004210 	add	x16, x16, #0x10
 6fc:	d61f0220 	br	x17

0000000000000700 <__getauxval@plt>:
 700:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 704:	f9400e11 	ldr	x17, [x16, #24]
 708:	91006210 	add	x16, x16, #0x18
 70c:	d61f0220 	br	x17

0000000000000710 <abort@plt>:
 710:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 714:	f9401211 	ldr	x17, [x16, #32]
 718:	91008210 	add	x16, x16, #0x20
 71c:	d61f0220 	br	x17

0000000000000720 <pthread_create@plt>:
 720:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 724:	f9401611 	ldr	x17, [x16, #40]
 728:	9100a210 	add	x16, x16, #0x28
 72c:	d61f0220 	br	x17

0000000000000730 <printf@plt>:
 730:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 734:	f9401a11 	ldr	x17, [x16, #48]
 738:	9100c210 	add	x16, x16, #0x30
 73c:	d61f0220 	br	x17

0000000000000740 <pthread_join@plt>:
 740:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 744:	f9401e11 	ldr	x17, [x16, #56]
 748:	9100e210 	add	x16, x16, #0x38
 74c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000780 <init_have_lse_atomics>:
 780:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 784:	d2800200 	mov	x0, #0x10                  	// #16
 788:	910003fd 	mov	x29, sp
 78c:	97ffffdd 	bl	700 <__getauxval@plt>
 790:	53082000 	ubfx	w0, w0, #8, #1
 794:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 798:	a8c17bfd 	ldp	x29, x30, [sp], #16
 79c:	39014420 	strb	w0, [x1, #81]
 7a0:	d65f03c0 	ret
 7a4:	d503201f 	nop
 7a8:	d503201f 	nop
 7ac:	d503201f 	nop
 7b0:	d503201f 	nop
 7b4:	d503201f 	nop
 7b8:	d503201f 	nop
 7bc:	d503201f 	nop

00000000000007c0 <_start>:
 7c0:	d503201f 	nop
 7c4:	d280001d 	mov	x29, #0x0                   	// #0
 7c8:	d280001e 	mov	x30, #0x0                   	// #0
 7cc:	aa0003e5 	mov	x5, x0
 7d0:	f94003e1 	ldr	x1, [sp]
 7d4:	910023e2 	add	x2, sp, #0x8
 7d8:	910003e6 	mov	x6, sp
 7dc:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf468>
 7e0:	f947ec00 	ldr	x0, [x0, #4056]
 7e4:	d2800003 	mov	x3, #0x0                   	// #0
 7e8:	d2800004 	mov	x4, #0x0                   	// #0
 7ec:	97ffffb9 	bl	6d0 <__libc_start_main@plt>
 7f0:	97ffffc8 	bl	710 <abort@plt>

00000000000007f4 <call_weak_fn>:
 7f4:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf468>
 7f8:	f947e800 	ldr	x0, [x0, #4048]
 7fc:	b4000040 	cbz	x0, 804 <call_weak_fn+0x10>
 800:	17ffffbc 	b	6f0 <__gmon_start__@plt>
 804:	d65f03c0 	ret
 808:	d503201f 	nop
 80c:	d503201f 	nop

0000000000000810 <deregister_tm_clones>:
 810:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 814:	91014000 	add	x0, x0, #0x50
 818:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 81c:	91014021 	add	x1, x1, #0x50
 820:	eb00003f 	cmp	x1, x0
 824:	540000c0 	b.eq	83c <deregister_tm_clones+0x2c>  // b.none
 828:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf468>
 82c:	f947e021 	ldr	x1, [x1, #4032]
 830:	b4000061 	cbz	x1, 83c <deregister_tm_clones+0x2c>
 834:	aa0103f0 	mov	x16, x1
 838:	d61f0200 	br	x16
 83c:	d65f03c0 	ret

0000000000000840 <register_tm_clones>:
 840:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 844:	91014000 	add	x0, x0, #0x50
 848:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 84c:	91014021 	add	x1, x1, #0x50
 850:	cb000021 	sub	x1, x1, x0
 854:	d37ffc22 	lsr	x2, x1, #63
 858:	8b810c41 	add	x1, x2, x1, asr #3
 85c:	9341fc21 	asr	x1, x1, #1
 860:	b40000c1 	cbz	x1, 878 <register_tm_clones+0x38>
 864:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf468>
 868:	f947f042 	ldr	x2, [x2, #4064]
 86c:	b4000062 	cbz	x2, 878 <register_tm_clones+0x38>
 870:	aa0203f0 	mov	x16, x2
 874:	d61f0200 	br	x16
 878:	d65f03c0 	ret
 87c:	d503201f 	nop

0000000000000880 <__do_global_dtors_aux>:
 880:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 884:	910003fd 	mov	x29, sp
 888:	f9000bf3 	str	x19, [sp, #16]
 88c:	b0000093 	adrp	x19, 11000 <__libc_start_main@GLIBC_2.34>
 890:	39414260 	ldrb	w0, [x19, #80]
 894:	35000140 	cbnz	w0, 8bc <__do_global_dtors_aux+0x3c>
 898:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf468>
 89c:	f947e400 	ldr	x0, [x0, #4040]
 8a0:	b4000080 	cbz	x0, 8b0 <__do_global_dtors_aux+0x30>
 8a4:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 8a8:	f9402400 	ldr	x0, [x0, #72]
 8ac:	97ffff8d 	bl	6e0 <__cxa_finalize@plt>
 8b0:	97ffffd8 	bl	810 <deregister_tm_clones>
 8b4:	52800020 	mov	w0, #0x1                   	// #1
 8b8:	39014260 	strb	w0, [x19, #80]
 8bc:	f9400bf3 	ldr	x19, [sp, #16]
 8c0:	a8c27bfd 	ldp	x29, x30, [sp], #32
 8c4:	d65f03c0 	ret
 8c8:	d503201f 	nop
 8cc:	d503201f 	nop

00000000000008d0 <frame_dummy>:
 8d0:	17ffffdc 	b	840 <register_tm_clones>

00000000000008d4 <thread_entry>:
 8d4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 8d8:	910003fd 	mov	x29, sp
 8dc:	f9000fe0 	str	x0, [sp, #24]
 8e0:	f9400fe0 	ldr	x0, [sp, #24]
 8e4:	f90013e0 	str	x0, [sp, #32]
 8e8:	b9002fff 	str	wzr, [sp, #44]
 8ec:	14000008 	b	90c <thread_entry+0x38>
 8f0:	f94013e0 	ldr	x0, [sp, #32]
 8f4:	aa0003e1 	mov	x1, x0
 8f8:	52800020 	mov	w0, #0x1                   	// #1
 8fc:	9400003d 	bl	9f0 <__aarch64_ldadd4_relax>
 900:	b9402fe0 	ldr	w0, [sp, #44]
 904:	11000400 	add	w0, w0, #0x1
 908:	b9002fe0 	str	w0, [sp, #44]
 90c:	b9402fe0 	ldr	w0, [sp, #44]
 910:	71018c1f 	cmp	w0, #0x63
 914:	54fffeed 	b.le	8f0 <thread_entry+0x1c>
 918:	d2800000 	mov	x0, #0x0                   	// #0
 91c:	a8c37bfd 	ldp	x29, x30, [sp], #48
 920:	d65f03c0 	ret

0000000000000924 <main>:
 924:	a9b77bfd 	stp	x29, x30, [sp, #-144]!
 928:	910003fd 	mov	x29, sp
 92c:	b9001fe0 	str	w0, [sp, #28]
 930:	f9000be1 	str	x1, [sp, #16]
 934:	b9002fff 	str	wzr, [sp, #44]
 938:	b9008fff 	str	wzr, [sp, #140]
 93c:	1400000f 	b	978 <main+0x54>
 940:	9100c3e1 	add	x1, sp, #0x30
 944:	b9808fe0 	ldrsw	x0, [sp, #140]
 948:	d37df000 	lsl	x0, x0, #3
 94c:	8b000024 	add	x4, x1, x0
 950:	9100b3e0 	add	x0, sp, #0x2c
 954:	aa0003e3 	mov	x3, x0
 958:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 95c:	91235002 	add	x2, x0, #0x8d4
 960:	d2800001 	mov	x1, #0x0                   	// #0
 964:	aa0403e0 	mov	x0, x4
 968:	97ffff6e 	bl	720 <pthread_create@plt>
 96c:	b9408fe0 	ldr	w0, [sp, #140]
 970:	11000400 	add	w0, w0, #0x1
 974:	b9008fe0 	str	w0, [sp, #140]
 978:	b9408fe0 	ldr	w0, [sp, #140]
 97c:	7100241f 	cmp	w0, #0x9
 980:	54fffe0d 	b.le	940 <main+0x1c>
 984:	b9008bff 	str	wzr, [sp, #136]
 988:	1400000a 	b	9b0 <main+0x8c>
 98c:	b9808be0 	ldrsw	x0, [sp, #136]
 990:	d37df000 	lsl	x0, x0, #3
 994:	9100c3e1 	add	x1, sp, #0x30
 998:	f8606820 	ldr	x0, [x1, x0]
 99c:	d2800001 	mov	x1, #0x0                   	// #0
 9a0:	97ffff68 	bl	740 <pthread_join@plt>
 9a4:	b9408be0 	ldr	w0, [sp, #136]
 9a8:	11000400 	add	w0, w0, #0x1
 9ac:	b9008be0 	str	w0, [sp, #136]
 9b0:	b9408be0 	ldr	w0, [sp, #136]
 9b4:	7100241f 	cmp	w0, #0x9
 9b8:	54fffead 	b.le	98c <main+0x68>
 9bc:	9100b3e0 	add	x0, sp, #0x2c
 9c0:	88dffc00 	ldar	w0, [x0]
 9c4:	b90087e0 	str	w0, [sp, #132]
 9c8:	b94087e0 	ldr	w0, [sp, #132]
 9cc:	2a0003e1 	mov	w1, w0
 9d0:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 9d4:	91290000 	add	x0, x0, #0xa40
 9d8:	97ffff56 	bl	730 <printf@plt>
 9dc:	52800000 	mov	w0, #0x0                   	// #0
 9e0:	a8c97bfd 	ldp	x29, x30, [sp], #144
 9e4:	d65f03c0 	ret
 9e8:	d503201f 	nop
 9ec:	d503201f 	nop

00000000000009f0 <__aarch64_ldadd4_relax>:
 9f0:	d503245f 	bti	c
 9f4:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 9f8:	39414610 	ldrb	w16, [x16, #81]
 9fc:	34000070 	cbz	w16, a08 <__aarch64_ldadd4_relax+0x18>
 a00:	b8200020 	ldadd	w0, w0, [x1]
 a04:	d65f03c0 	ret
 a08:	2a0003f0 	mov	w16, w0
 a0c:	885f7c20 	ldxr	w0, [x1]
 a10:	0b100011 	add	w17, w0, w16
 a14:	880f7c31 	stxr	w15, w17, [x1]
 a18:	35ffffaf 	cbnz	w15, a0c <__aarch64_ldadd4_relax+0x1c>
 a1c:	d65f03c0 	ret

Disassembly of section .fini:

0000000000000a20 <_fini>:
 a20:	d503201f 	nop
 a24:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 a28:	910003fd 	mov	x29, sp
 a2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 a30:	d65f03c0 	ret

Disassembly of section .rodata:

0000000000000a38 <_IO_stdin_used>:
 a38:	00020001 	.inst	0x00020001 ; undefined
 a3c:	00000000 	udf	#0
 a40:	000a6425 	.inst	0x000a6425 ; undefined

Disassembly of section .eh_frame_hdr:

0000000000000a44 <__GNU_EH_FRAME_HDR>:
 a44:	3b031b01 	.inst	0x3b031b01 ; undefined
 a48:	00000050 	udf	#80
 a4c:	00000009 	udf	#9
 a50:	fffffd3c 	.inst	0xfffffd3c ; undefined
 a54:	00000134 	udf	#308
 a58:	fffffd7c 	.inst	0xfffffd7c ; undefined
 a5c:	00000068 	udf	#104
 a60:	fffffdcc 	.inst	0xfffffdcc ; undefined
 a64:	0000007c 	udf	#124
 a68:	fffffdfc 	.inst	0xfffffdfc ; undefined
 a6c:	00000090 	udf	#144
 a70:	fffffe3c 	.inst	0xfffffe3c ; undefined
 a74:	000000a4 	udf	#164
 a78:	fffffe8c 	.inst	0xfffffe8c ; undefined
 a7c:	000000c8 	udf	#200
 a80:	fffffe90 	.inst	0xfffffe90 ; undefined
 a84:	000000dc 	udf	#220
 a88:	fffffee0 	.inst	0xfffffee0 ; undefined
 a8c:	000000fc 	udf	#252
 a90:	ffffffac 	.inst	0xffffffac ; undefined
 a94:	0000011c 	udf	#284

Disassembly of section .eh_frame:

0000000000000a98 <__FRAME_END__-0x100>:
 a98:	00000010 	udf	#16
 a9c:	00000000 	udf	#0
 aa0:	00527a01 	.inst	0x00527a01 ; undefined
 aa4:	011e7804 	.inst	0x011e7804 ; undefined
 aa8:	001f0c1b 	.inst	0x001f0c1b ; undefined
 aac:	00000010 	udf	#16
 ab0:	00000018 	udf	#24
 ab4:	fffffd0c 	.inst	0xfffffd0c ; undefined
 ab8:	00000034 	udf	#52
 abc:	1e074100 	.inst	0x1e074100 ; undefined
 ac0:	00000010 	udf	#16
 ac4:	0000002c 	udf	#44
 ac8:	fffffd48 	.inst	0xfffffd48 ; undefined
 acc:	00000030 	udf	#48
 ad0:	00000000 	udf	#0
 ad4:	00000010 	udf	#16
 ad8:	00000040 	udf	#64
 adc:	fffffd64 	.inst	0xfffffd64 ; undefined
 ae0:	0000003c 	udf	#60
 ae4:	00000000 	udf	#0
 ae8:	00000020 	udf	#32
 aec:	00000054 	udf	#84
 af0:	fffffd90 	.inst	0xfffffd90 ; undefined
 af4:	00000048 	udf	#72
 af8:	200e4100 	.inst	0x200e4100 ; undefined
 afc:	039e049d 	.inst	0x039e049d ; undefined
 b00:	4e029342 	.inst	0x4e029342 ; undefined
 b04:	0ed3ddde 	.inst	0x0ed3ddde ; undefined
 b08:	00000000 	udf	#0
 b0c:	00000010 	udf	#16
 b10:	00000078 	udf	#120
 b14:	fffffdbc 	.inst	0xfffffdbc ; undefined
 b18:	00000004 	udf	#4
 b1c:	00000000 	udf	#0
 b20:	0000001c 	udf	#28
 b24:	0000008c 	udf	#140
 b28:	fffffdac 	.inst	0xfffffdac ; undefined
 b2c:	00000050 	udf	#80
 b30:	300e4100 	adr	x0, 1d351 <__bss_end__+0xc2f9>
 b34:	059e069d 	mov	z29.s, p14/z, #52
 b38:	0eddde52 	.inst	0x0eddde52 ; undefined
 b3c:	00000000 	udf	#0
 b40:	0000001c 	udf	#28
 b44:	000000ac 	udf	#172
 b48:	fffffddc 	.inst	0xfffffddc ; undefined
 b4c:	000000c4 	udf	#196
 b50:	900e4100 	adrp	x0, 1c820000 <__bss_end__+0x1c80efa8>
 b54:	9e129d01 	.inst	0x9e129d01 ; undefined
 b58:	ddde6f11 	.inst	0xddde6f11 ; undefined
 b5c:	0000000e 	udf	#14
 b60:	00000014 	udf	#20
 b64:	000000cc 	udf	#204
 b68:	fffffe88 	.inst	0xfffffe88 ; undefined
 b6c:	00000030 	udf	#48
	...
 b78:	0000001c 	udf	#28
 b7c:	000000e4 	udf	#228
 b80:	fffffc00 	.inst	0xfffffc00 ; undefined
 b84:	00000024 	udf	#36
 b88:	100e4100 	adr	x0, 1d3a8 <__bss_end__+0xc350>
 b8c:	019e029d 	.inst	0x019e029d ; undefined
 b90:	0eddde46 	.inst	0x0eddde46 ; undefined
 b94:	00000000 	udf	#0

0000000000000b98 <__FRAME_END__>:
 b98:	00000000 	udf	#0

Disassembly of section .init_array:

0000000000010dc0 <__frame_dummy_init_array_entry>:
   10dc0:	000008d0 	udf	#2256
   10dc4:	00000000 	udf	#0
   10dc8:	00000780 	udf	#1920
   10dcc:	00000000 	udf	#0

Disassembly of section .fini_array:

0000000000010dd0 <__do_global_dtors_aux_fini_array_entry>:
   10dd0:	00000880 	udf	#2176
   10dd4:	00000000 	udf	#0

Disassembly of section .dynamic:

0000000000010dd8 <.dynamic>:
   10dd8:	00000001 	udf	#1
   10ddc:	00000000 	udf	#0
   10de0:	00000057 	udf	#87
   10de4:	00000000 	udf	#0
   10de8:	0000000c 	udf	#12
   10dec:	00000000 	udf	#0
   10df0:	00000690 	udf	#1680
   10df4:	00000000 	udf	#0
   10df8:	0000000d 	udf	#13
   10dfc:	00000000 	udf	#0
   10e00:	00000a20 	udf	#2592
   10e04:	00000000 	udf	#0
   10e08:	00000019 	udf	#25
   10e0c:	00000000 	udf	#0
   10e10:	00010dc0 	.inst	0x00010dc0 ; undefined
   10e14:	00000000 	udf	#0
   10e18:	0000001b 	udf	#27
   10e1c:	00000000 	udf	#0
   10e20:	00000010 	udf	#16
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
   10e80:	000000bc 	udf	#188
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
   10ee0:	000005d0 	udf	#1488
   10ee4:	00000000 	udf	#0
   10ee8:	00000007 	udf	#7
   10eec:	00000000 	udf	#0
   10ef0:	000004f8 	udf	#1272
   10ef4:	00000000 	udf	#0
   10ef8:	00000008 	udf	#8
   10efc:	00000000 	udf	#0
   10f00:	000000d8 	udf	#216
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
   10f50:	000004ac 	udf	#1196
   10f54:	00000000 	udf	#0
   10f58:	6ffffff9 	.inst	0x6ffffff9 ; undefined
   10f5c:	00000000 	udf	#0
   10f60:	00000005 	udf	#5
	...

Disassembly of section .got:

0000000000010fb8 <.got>:
   10fb8:	00010dd8 	.inst	0x00010dd8 ; undefined
	...
   10fd8:	00000924 	udf	#2340
	...

Disassembly of section .got.plt:

0000000000010fe8 <.got.plt>:
	...
   11000:	000006b0 	udf	#1712
   11004:	00000000 	udf	#0
   11008:	000006b0 	udf	#1712
   1100c:	00000000 	udf	#0
   11010:	000006b0 	udf	#1712
   11014:	00000000 	udf	#0
   11018:	000006b0 	udf	#1712
   1101c:	00000000 	udf	#0
   11020:	000006b0 	udf	#1712
   11024:	00000000 	udf	#0
   11028:	000006b0 	udf	#1712
   1102c:	00000000 	udf	#0
   11030:	000006b0 	udf	#1712
   11034:	00000000 	udf	#0
   11038:	000006b0 	udf	#1712
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

0000000000011051 <__aarch64_have_lse_atomics>:
   11051:	00000000 	udf	#0
   11055:	Address 0x0000000000011055 is out of bounds.


Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi  // mi = first
   4:	4e472820 	trn1	v0.8h, v1.8h, v7.8h
   8:	31202955 	adds	w21, w10, #0x80a
   c:	2e322e31 	uqsub	v17.8b, v17.8b, v18.8b
  10:	Address 0x0000000000000010 is out of bounds.


Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	0000002c 	udf	#44
   4:	00000002 	udf	#2
   8:	00080000 	.inst	0x00080000 ; undefined
   c:	00000000 	udf	#0
  10:	000009f0 	udf	#2544
  14:	00000000 	udf	#0
  18:	00000030 	udf	#48
	...
  30:	0000002c 	udf	#44
  34:	00280002 	.inst	0x00280002 ; NYI
  38:	00080000 	.inst	0x00080000 ; undefined
  3c:	00000000 	udf	#0
  40:	00000780 	udf	#1920
  44:	00000000 	udf	#0
  48:	00000024 	udf	#36
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	00000024 	udf	#36
   4:	08010005 	stxrb	w1, w5, [x0]
   8:	00000000 	udf	#0
   c:	00000001 	udf	#1
  10:	0009f000 	.inst	0x0009f000 ; undefined
  14:	00000000 	udf	#0
  18:	00003000 	udf	#12288
  1c:	00060000 	.inst	0x00060000 ; undefined
  20:	004a0000 	.inst	0x004a0000 ; undefined
  24:	80010000 	.inst	0x80010000 ; undefined
  28:	000000a3 	udf	#163
  2c:	08010005 	stxrb	w1, w5, [x0]
  30:	00000014 	udf	#20
  34:	00006402 	udf	#25602
  38:	008c1d00 	.inst	0x008c1d00 ; undefined
  3c:	00480000 	.inst	0x00480000 ; undefined
  40:	000c0000 	.inst	0x000c0000 ; undefined
	...
  4c:	00570000 	.inst	0x00570000 ; undefined
  50:	04030000 	subr	z0.b, p0/m, z0.b, z0.b
  54:	01000001 	.inst	0x01000001 ; undefined
  58:	0040071d 	.inst	0x0040071d ; undefined
  5c:	03090000 	.inst	0x03090000 ; undefined
  60:	00011051 	.inst	0x00011051 ; undefined
  64:	00000000 	udf	#0
  68:	d6020101 	.inst	0xd6020101 ; undefined
  6c:	04000000 	add	z0.b, p0/m, z0.b, z0.b
  70:	00000058 	udf	#88
  74:	5d132701 	.inst	0x5d132701 ; undefined
  78:	5d000000 	.inst	0x5d000000 ; undefined
  7c:	05000000 	orr	z0.s, z0.s, #0x1
  80:	0000005d 	udf	#93
  84:	07080100 	.inst	0x07080100 ; undefined
  88:	000000dc 	udf	#220
  8c:	0000ee06 	udf	#60934
  90:	012a0100 	.inst	0x012a0100 ; undefined
  94:	00000780 	udf	#1920
  98:	00000000 	udf	#0
  9c:	00000024 	udf	#36
  a0:	00000000 	udf	#0
  a4:	d0079c01 	adrp	x1, f382000 <__bss_end__+0xf370fa8>
  a8:	01000000 	.inst	0x01000000 ; undefined
  ac:	005d112c 	.inst	0x005d112c ; undefined
  b0:	000e0000 	.inst	0x000e0000 ; undefined
  b4:	000c0000 	.inst	0x000c0000 ; undefined
  b8:	90080000 	adrp	x0, 10000000 <__bss_end__+0xffeefa8>
  bc:	00000007 	udf	#7
  c0:	47000000 	.inst	0x47000000 ; undefined
  c4:	09000000 	.inst	0x09000000 ; undefined
  c8:	40015001 	.inst	0x40015001 ; undefined
  cc:	Address 0x00000000000000cc is out of bounds.


Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	10001101 	adr	x1, 220 <__abi_tag-0x58>
   4:	12011117 	and	w23, w8, #0x8000000f
   8:	1b0e030f 	madd	w15, w24, w14, w0
   c:	130e250e 	sbfiz	w14, w8, #18, #10
  10:	00000005 	udf	#5
  14:	0b002401 	add	w1, w0, w0, lsl #9
  18:	030b3e0b 	.inst	0x030b3e0b ; undefined
  1c:	0200000e 	.inst	0x0200000e ; undefined
  20:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
  24:	1f030b13 	fmadd	s19, s24, s3, s2
  28:	17551f1b 	b	fffffffffd547c94 <__bss_end__+0xfffffffffd536c3c>
  2c:	17100111 	b	fffffffffc400470 <__bss_end__+0xfffffffffc3ef418>
  30:	34030000 	cbz	w0, 6030 <__FRAME_END__+0x5498>
  34:	3a0e0300 	adcs	w0, w24, w14
  38:	390b3b0b 	strb	w11, [x24, #718]
  3c:	3f13490b 	.inst	0x3f13490b ; undefined
  40:	00180219 	.inst	0x00180219 ; undefined
  44:	012e0400 	.inst	0x012e0400 ; undefined
  48:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
  4c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
  50:	19270b39 	.inst	0x19270b39 ; undefined
  54:	193c1349 	.inst	0x193c1349 ; undefined
  58:	00001301 	udf	#4865
  5c:	49000505 	.inst	0x49000505 ; undefined
  60:	06000013 	.inst	0x06000013 ; undefined
  64:	0e03012e 	tbl	v14.8b, {v9.16b}, v3.8b
  68:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
  6c:	19270b39 	.inst	0x19270b39 ; undefined
  70:	07120111 	.inst	0x07120111 ; undefined
  74:	197a1840 	.inst	0x197a1840 ; undefined
  78:	34070000 	cbz	w0, e078 <__FRAME_END__+0xd4e0>
  7c:	3a0e0300 	adcs	w0, w24, w14
  80:	390b3b0b 	strb	w11, [x24, #718]
  84:	0213490b 	.inst	0x0213490b ; undefined
  88:	1742b717 	b	fffffffffd0adce4 <__bss_end__+0xfffffffffd09cc8c>
  8c:	48080000 	stxrh	w8, w0, [x0]
  90:	7f017d01 	.inst	0x7f017d01 ; undefined
  94:	09000013 	.inst	0x09000013 ; undefined
  98:	18020049 	ldr	w9, 40a0 <__FRAME_END__+0x3508>
  9c:	0000187e 	udf	#6270
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	00000053 	udf	#83
   4:	00080005 	.inst	0x00080005 ; undefined
   8:	0000002e 	udf	#46
   c:	fb010104 	.inst	0xfb010104 ; undefined
  10:	01000d0e 	.inst	0x01000d0e ; undefined
  14:	00010101 	.inst	0x00010101 ; undefined
  18:	00010000 	.inst	0x00010000 ; undefined
  1c:	01010100 	.inst	0x01010100 ; undefined
  20:	0000021f 	udf	#543
  24:	00000000 	udf	#0
  28:	01020000 	.inst	0x01020000 ; undefined
  2c:	020f021f 	.inst	0x020f021f ; undefined
  30:	00000042 	udf	#66
  34:	00004200 	udf	#16896
  38:	09000100 	.inst	0x09000100 ; undefined
  3c:	0009f002 	.inst	0x0009f002 ; undefined
  40:	00000000 	udf	#0
  44:	02880300 	.inst	0x02880300 ; undefined
  48:	213e2101 	.inst	0x213e2101 ; undefined
  4c:	21212122 	.inst	0x21212122 ; undefined
  50:	01022121 	.inst	0x01022121 ; undefined
  54:	6f010100 	.inst	0x6f010100 ; undefined
  58:	05000000 	orr	z0.s, z0.s, #0x1
  5c:	2e000800 	ext	v0.8b, v0.8b, v0.8b, #1
  60:	04000000 	add	z0.b, p0/m, z0.b, z0.b
  64:	0efb0101 	.inst	0x0efb0101 ; undefined
  68:	0101000d 	.inst	0x0101000d ; undefined
  6c:	00000101 	udf	#257
  70:	00000100 	udf	#256
  74:	1f010101 	fmadd	s1, s8, s1, s0
  78:	00004802 	udf	#18434
  7c:	00000000 	udf	#0
  80:	1f010200 	fmadd	s0, s16, s1, s0
  84:	8c020f02 	.inst	0x8c020f02 ; undefined
  88:	00000000 	udf	#0
  8c:	000000ce 	udf	#206
  90:	00010501 	.inst	0x00010501 ; undefined
  94:	07800209 	.inst	0x07800209 ; undefined
  98:	00000000 	udf	#0
  9c:	2a030000 	orr	w0, w0, w3
  a0:	13030501 	sbfiz	w1, w8, #29, #2
  a4:	11060105 	add	w5, w8, #0x180
  a8:	05211905 	ext	z5.b, z5.b, z8.b, #14
  ac:	19051f01 	.inst	0x19051f01 ; undefined
  b0:	06030521 	.inst	0x06030521 ; undefined
  b4:	06380521 	.inst	0x06380521 ; undefined
  b8:	201e0501 	.inst	0x201e0501 ; undefined
  bc:	05210105 	ext	z5.b, z5.b, z8.b, #8
  c0:	01051f1e 	.inst	0x01051f1e ; undefined
  c4:	00010221 	.inst	0x00010221 ; undefined
  c8:	Address 0x00000000000000c8 is out of bounds.


Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	2e65736c 	uabdl	v12.4s, v27.4h, v5.4h
   4:	622f0053 	.inst	0x622f0053 ; undefined
   8:	646c6975 	.inst	0x646c6975 ; undefined
   c:	7261612f 	.inst	0x7261612f ; undefined
  10:	34366863 	cbz	w3, 6cd1c <__bss_end__+0x5bcc4>
  14:	6e696c2d 	umin	v13.8h, v1.8h, v9.8h
  18:	672d7875 	.inst	0x672d7875 ; undefined
  1c:	672d756e 	.inst	0x672d756e ; undefined
  20:	732f6363 	.inst	0x732f6363 ; undefined
  24:	672f6372 	.inst	0x672f6372 ; undefined
  28:	622d6363 	.inst	0x622d6363 ; undefined
  2c:	646c6975 	.inst	0x646c6975 ; undefined
  30:	7261612f 	.inst	0x7261612f ; undefined
  34:	34366863 	cbz	w3, 6cd40 <__bss_end__+0x5bce8>
  38:	6e696c2d 	umin	v13.8h, v1.8h, v9.8h
  3c:	672d7875 	.inst	0x672d7875 ; undefined
  40:	6c2f756e 	stnp	d14, d29, [x11, #-272]
  44:	63676269 	.inst	0x63676269 ; undefined
  48:	4e470063 	.inst	0x4e470063 ; undefined
  4c:	53412055 	.inst	0x53412055 ; undefined
  50:	332e3220 	.inst	0x332e3220 ; undefined
  54:	00312e36 	.inst	0x00312e36 ; NYI
  58:	65675f5f 	fnmla	z31.h, p7/m, z26.h, z7.h
  5c:	78756174 	ldumaxlh	w21, w20, [x11]
  60:	006c6176 	.inst	0x006c6176 ; undefined
  64:	20554e47 	.inst	0x20554e47 ; undefined
  68:	20373143 	.inst	0x20373143 ; undefined
  6c:	322e3131 	orr	w17, w9, #0x7ffc0000
  70:	2d20302e 	stp	s14, s12, [x1, #-256]
  74:	74696c6d 	.inst	0x74696c6d ; undefined
  78:	2d656c74 	ldp	s20, s27, [x3, #-216]
  7c:	69646e65 	ldpsw	x5, x27, [x19, #-224]
  80:	2d206e61 	stp	s1, s27, [x19, #-256]
  84:	6962616d 	ldpsw	x13, x24, [x11, #-240]
  88:	36706c3d 	tbz	w29, #14, e0c <__FRAME_END__+0x274>
  8c:	672d2034 	.inst	0x672d2034 ; undefined
  90:	20672d20 	.inst	0x20672d20 ; undefined
  94:	2d20672d 	stp	s13, s25, [x25, #-256]
  98:	2d20324f 	stp	s15, s12, [x18, #-256]
  9c:	2d20324f 	stp	s15, s12, [x18, #-256]
  a0:	2d20324f 	stp	s15, s12, [x18, #-256]
  a4:	69756266 	ldpsw	x6, x24, [x19, #-88]
  a8:	6e69646c 	umax	v12.8h, v3.8h, v9.8h
  ac:	696c2d67 	ldpsw	x7, x11, [x11, #-160]
  b0:	63636762 	.inst	0x63636762 ; undefined
  b4:	6e662d20 	uqsub	v0.8h, v9.8h, v6.8h
  b8:	74732d6f 	.inst	0x74732d6f ; undefined
  bc:	2d6b6361 	ldp	s1, s24, [x27, #-168]
  c0:	746f7270 	.inst	0x746f7270 ; undefined
  c4:	6f746365 	umlsl2	v5.4s, v27.8h, v4.h[3]
  c8:	662d2072 	.inst	0x662d2072 ; undefined
  cc:	00434950 	.inst	0x00434950 ; undefined
  d0:	61637768 	.inst	0x61637768 ; undefined
  d4:	425f0070 	.inst	0x425f0070 ; undefined
  d8:	006c6f6f 	.inst	0x006c6f6f ; undefined
  dc:	676e6f6c 	.inst	0x676e6f6c ; undefined
  e0:	736e7520 	.inst	0x736e7520 ; undefined
  e4:	656e6769 	fnmls	z9.h, p1/m, z27.h, z14.h
  e8:	6e692064 	usubl2	v4.4s, v3.8h, v9.8h
  ec:	6e690074 	uaddl2	v20.4s, v3.8h, v9.8h
  f0:	685f7469 	.inst	0x685f7469 ; undefined
  f4:	5f657661 	sqshl	d1, d19, #37
  f8:	5f65736c 	sqdmlsl	s12, h27, v5.h[2]
  fc:	6d6f7461 	ldp	d1, d29, [x3, #-272]
 100:	00736369 	.inst	0x00736369 ; undefined
 104:	61615f5f 	.inst	0x61615f5f ; undefined
 108:	36686372 	tbz	w18, #13, d74 <__FRAME_END__+0x1dc>
 10c:	61685f34 	.inst	0x61685f34 ; undefined
 110:	6c5f6576 	ldnp	d22, d25, [x11, #496]
 114:	615f6573 	.inst	0x615f6573 ; undefined
 118:	696d6f74 	ldpsw	x20, x27, [x27, #-152]
 11c:	Address 0x000000000000011c is out of bounds.


Disassembly of section .debug_line_str:

0000000000000000 <.debug_line_str>:
   0:	6975622f 	ldpsw	x15, x24, [x17, #-88]
   4:	612f646c 	.inst	0x612f646c ; undefined
   8:	68637261 	.inst	0x68637261 ; undefined
   c:	6c2d3436 	stnp	d22, d13, [x1, #-304]
  10:	78756e69 	.inst	0x78756e69 ; undefined
  14:	756e672d 	.inst	0x756e672d ; undefined
  18:	6363672d 	.inst	0x6363672d ; undefined
  1c:	6372732f 	.inst	0x6372732f ; undefined
  20:	6363672f 	.inst	0x6363672f ; undefined
  24:	2e31312d 	usubw	v13.8h, v9.8h, v17.8b
  28:	2f302e32 	.inst	0x2f302e32 ; undefined
  2c:	6762696c 	.inst	0x6762696c ; undefined
  30:	632f6363 	.inst	0x632f6363 ; undefined
  34:	69666e6f 	ldpsw	x15, x27, [x19, #-208]
  38:	61612f67 	.inst	0x61612f67 ; undefined
  3c:	36686372 	tbz	w18, #13, ca8 <__FRAME_END__+0x110>
  40:	736c0034 	.inst	0x736c0034 ; undefined
  44:	00532e65 	.inst	0x00532e65 ; undefined
  48:	6975622f 	ldpsw	x15, x24, [x17, #-88]
  4c:	612f646c 	.inst	0x612f646c ; undefined
  50:	68637261 	.inst	0x68637261 ; undefined
  54:	6c2d3436 	stnp	d22, d13, [x1, #-304]
  58:	78756e69 	.inst	0x78756e69 ; undefined
  5c:	756e672d 	.inst	0x756e672d ; undefined
  60:	6363672d 	.inst	0x6363672d ; undefined
  64:	6372732f 	.inst	0x6372732f ; undefined
  68:	6363672f 	.inst	0x6363672f ; undefined
  6c:	6975622d 	ldpsw	x13, x24, [x17, #-88]
  70:	612f646c 	.inst	0x612f646c ; undefined
  74:	68637261 	.inst	0x68637261 ; undefined
  78:	6c2d3436 	stnp	d22, d13, [x1, #-304]
  7c:	78756e69 	.inst	0x78756e69 ; undefined
  80:	756e672d 	.inst	0x756e672d ; undefined
  84:	62696c2f 	.inst	0x62696c2f ; undefined
  88:	00636367 	.inst	0x00636367 ; undefined
  8c:	6975622f 	ldpsw	x15, x24, [x17, #-88]
  90:	612f646c 	.inst	0x612f646c ; undefined
  94:	68637261 	.inst	0x68637261 ; undefined
  98:	6c2d3436 	stnp	d22, d13, [x1, #-304]
  9c:	78756e69 	.inst	0x78756e69 ; undefined
  a0:	756e672d 	.inst	0x756e672d ; undefined
  a4:	6363672d 	.inst	0x6363672d ; undefined
  a8:	6372732f 	.inst	0x6372732f ; undefined
  ac:	6363672f 	.inst	0x6363672f ; undefined
  b0:	2e31312d 	usubw	v13.8h, v9.8h, v17.8b
  b4:	2f302e32 	.inst	0x2f302e32 ; undefined
  b8:	6762696c 	.inst	0x6762696c ; undefined
  bc:	632f6363 	.inst	0x632f6363 ; undefined
  c0:	69666e6f 	ldpsw	x15, x27, [x19, #-208]
  c4:	61612f67 	.inst	0x61612f67 ; undefined
  c8:	36686372 	tbz	w18, #13, d34 <__FRAME_END__+0x19c>
  cc:	736c2f34 	.inst	0x736c2f34 ; undefined
  d0:	6e692d65 	uqsub	v5.8h, v11.8h, v9.8h
  d4:	632e7469 	.inst	0x632e7469 ; undefined
	...

Disassembly of section .debug_loclists:

0000000000000000 <.debug_loclists>:
   0:	00000017 	udf	#23
   4:	00080005 	.inst	0x00080005 ; undefined
   8:	00000000 	udf	#0
   c:	90080000 	adrp	x0, 10000000 <__bss_end__+0xffeefa8>
  10:	00000007 	udf	#7
  14:	04000000 	add	z0.b, p0/m, z0.b, z0.b
  18:	Address 0x0000000000000018 is out of bounds.


Disassembly of section .debug_rnglists:

0000000000000000 <.debug_rnglists>:
   0:	00000013 	udf	#19
   4:	00080005 	.inst	0x00080005 ; undefined
   8:	00000000 	udf	#0
   c:	00078007 	.inst	0x00078007 ; undefined
  10:	00000000 	udf	#0
  14:	Address 0x0000000000000014 is out of bounds.

