
a.out:     file format elf64-littleaarch64


Disassembly of section .interp:

0000000000000238 <.interp>:
 238:	62696c2f 	.inst	0x62696c2f ; undefined
 23c:	2d646c2f 	ldp	s15, s27, [x1, #-224]
 240:	756e696c 	.inst	0x756e696c ; undefined
 244:	61612d78 	.inst	0x61612d78 ; undefined
 248:	36686372 	tbz	w18, #13, eb4 <__FRAME_END__+0x624>
 24c:	6f732e34 	.inst	0x6f732e34 ; undefined
 250:	Address 0x0000000000000250 is out of bounds.


Disassembly of section .note.gnu.build-id:

0000000000000254 <.note.gnu.build-id>:
 254:	00000004 	udf	#4
 258:	00000014 	udf	#20
 25c:	00000003 	udf	#3
 260:	00554e47 	.inst	0x00554e47 ; undefined
 264:	b8ea54a5 	.inst	0xb8ea54a5 ; undefined
 268:	b66946d6 	tbz	x22, #45, 2b40 <__FRAME_END__+0x22b0>
 26c:	b3677501 	bfi	x1, x8, #25, #30
 270:	e58ee3aa 	.inst	0xe58ee3aa ; undefined
 274:	62179c18 	.inst	0x62179c18 ; undefined

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
 2d8:	00000580 	udf	#1408
	...
 2ec:	00170003 	.inst	0x00170003 ; undefined
 2f0:	00011020 	.inst	0x00011020 ; undefined
	...
 300:	00000010 	udf	#16
 304:	00000012 	udf	#18
	...
 318:	00000048 	udf	#72
 31c:	00000020 	udf	#32
	...
 330:	00000001 	udf	#1
 334:	00000022 	udf	#34
	...
 348:	00000064 	udf	#100
 34c:	00000020 	udf	#32
	...
 360:	00000022 	udf	#34
 364:	00000012 	udf	#18
	...
 378:	00000073 	udf	#115
 37c:	00000020 	udf	#32
	...

Disassembly of section .dynstr:

0000000000000390 <.dynstr>:
 390:	635f5f00 	.inst	0x635f5f00 ; undefined
 394:	665f6178 	.inst	0x665f6178 ; undefined
 398:	6c616e69 	ldnp	d9, d27, [x19, #-496]
 39c:	00657a69 	.inst	0x00657a69 ; undefined
 3a0:	696c5f5f 	ldpsw	xzr, x23, [x26, #-160]
 3a4:	735f6362 	.inst	0x735f6362 ; undefined
 3a8:	74726174 	.inst	0x74726174 ; undefined
 3ac:	69616d5f 	ldpsw	xzr, x27, [x10, #-248]
 3b0:	6261006e 	.inst	0x6261006e ; undefined
 3b4:	0074726f 	.inst	0x0074726f ; undefined
 3b8:	6362696c 	.inst	0x6362696c ; undefined
 3bc:	2e6f732e 	uabdl	v14.4s, v25.4h, v15.4h
 3c0:	4c470036 	.inst	0x4c470036 ; undefined
 3c4:	5f434249 	.inst	0x5f434249 ; undefined
 3c8:	37312e32 	tbnz	w18, #6, 298c <__FRAME_END__+0x20fc>
 3cc:	494c4700 	.inst	0x494c4700 ; undefined
 3d0:	325f4342 	.inst	0x325f4342 ; undefined
 3d4:	0034332e 	.inst	0x0034332e ; NYI
 3d8:	4d54495f 	.inst	0x4d54495f ; undefined
 3dc:	7265645f 	.inst	0x7265645f ; undefined
 3e0:	73696765 	.inst	0x73696765 ; undefined
 3e4:	54726574 	bc.mi	e5090 <__bss_end__+0xd4058>  // bc.first
 3e8:	6f6c434d 	mls	v13.8h, v26.8h, v12.h[2]
 3ec:	6154656e 	.inst	0x6154656e ; undefined
 3f0:	00656c62 	.inst	0x00656c62 ; undefined
 3f4:	6d675f5f 	ldp	d31, d23, [x26, #-400]
 3f8:	735f6e6f 	.inst	0x735f6e6f ; undefined
 3fc:	74726174 	.inst	0x74726174 ; undefined
 400:	5f005f5f 	.inst	0x5f005f5f ; undefined
 404:	5f4d5449 	shl	d9, d2, #13
 408:	69676572 	ldpsw	x18, x25, [x11, #-200]
 40c:	72657473 	.inst	0x72657473 ; undefined
 410:	6c434d54 	ldnp	d20, d19, [x10, #48]
 414:	54656e6f 	b.nv	cb1e0 <__bss_end__+0xba1a8>
 418:	656c6261 	fnmls	z1.h, p0/m, z19.h, z12.h
	...

Disassembly of section .gnu.version:

000000000000041e <.gnu.version>:
 41e:	00000000 	udf	#0
 422:	00020000 	.inst	0x00020000 ; undefined
 426:	00030001 	.inst	0x00030001 ; undefined
 42a:	00030001 	.inst	0x00030001 ; undefined
 42e:	Address 0x000000000000042e is out of bounds.


Disassembly of section .gnu.version_r:

0000000000000430 <.gnu.version_r>:
 430:	00020001 	.inst	0x00020001 ; undefined
 434:	00000028 	udf	#40
 438:	00000010 	udf	#16
 43c:	00000000 	udf	#0
 440:	06969197 	.inst	0x06969197 ; undefined
 444:	00030000 	.inst	0x00030000 ; undefined
 448:	00000032 	udf	#50
 44c:	00000010 	udf	#16
 450:	069691b4 	.inst	0x069691b4 ; undefined
 454:	00020000 	.inst	0x00020000 ; undefined
 458:	0000003d 	udf	#61
 45c:	00000000 	udf	#0

Disassembly of section .rela.dyn:

0000000000000460 <.rela.dyn>:
 460:	00010dc8 	.inst	0x00010dc8 ; undefined
 464:	00000000 	udf	#0
 468:	00000403 	udf	#1027
 46c:	00000000 	udf	#0
 470:	00000710 	udf	#1808
 474:	00000000 	udf	#0
 478:	00010dd0 	.inst	0x00010dd0 ; undefined
 47c:	00000000 	udf	#0
 480:	00000403 	udf	#1027
 484:	00000000 	udf	#0
 488:	000006c0 	udf	#1728
 48c:	00000000 	udf	#0
 490:	00010fd8 	.inst	0x00010fd8 ; undefined
 494:	00000000 	udf	#0
 498:	00000403 	udf	#1027
 49c:	00000000 	udf	#0
 4a0:	00000734 	udf	#1844
 4a4:	00000000 	udf	#0
 4a8:	00011028 	.inst	0x00011028 ; undefined
 4ac:	00000000 	udf	#0
 4b0:	00000403 	udf	#1027
 4b4:	00000000 	udf	#0
 4b8:	00011028 	.inst	0x00011028 ; undefined
 4bc:	00000000 	udf	#0
 4c0:	00010fc0 	.inst	0x00010fc0 ; undefined
 4c4:	00000000 	udf	#0
 4c8:	00000401 	udf	#1025
 4cc:	00000004 	udf	#4
	...
 4d8:	00010fc8 	.inst	0x00010fc8 ; undefined
 4dc:	00000000 	udf	#0
 4e0:	00000401 	udf	#1025
 4e4:	00000005 	udf	#5
	...
 4f0:	00010fd0 	.inst	0x00010fd0 ; undefined
 4f4:	00000000 	udf	#0
 4f8:	00000401 	udf	#1025
 4fc:	00000006 	udf	#6
	...
 508:	00010fe0 	.inst	0x00010fe0 ; undefined
 50c:	00000000 	udf	#0
 510:	00000401 	udf	#1025
 514:	00000008 	udf	#8
	...

Disassembly of section .rela.plt:

0000000000000520 <.rela.plt>:
 520:	00011000 	.inst	0x00011000 ; undefined
 524:	00000000 	udf	#0
 528:	00000402 	udf	#1026
 52c:	00000003 	udf	#3
	...
 538:	00011008 	.inst	0x00011008 ; undefined
 53c:	00000000 	udf	#0
 540:	00000402 	udf	#1026
 544:	00000005 	udf	#5
	...
 550:	00011010 	.inst	0x00011010 ; undefined
 554:	00000000 	udf	#0
 558:	00000402 	udf	#1026
 55c:	00000006 	udf	#6
	...
 568:	00011018 	.inst	0x00011018 ; undefined
 56c:	00000000 	udf	#0
 570:	00000402 	udf	#1026
 574:	00000007 	udf	#7
	...

Disassembly of section .init:

0000000000000580 <_init>:
 580:	d503201f 	nop
 584:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 588:	910003fd 	mov	x29, sp
 58c:	9400002a 	bl	634 <call_weak_fn>
 590:	a8c17bfd 	ldp	x29, x30, [sp], #16
 594:	d65f03c0 	ret

Disassembly of section .plt:

00000000000005a0 <.plt>:
 5a0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 5a4:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf770>
 5a8:	f947fe11 	ldr	x17, [x16, #4088]
 5ac:	913fe210 	add	x16, x16, #0xff8
 5b0:	d61f0220 	br	x17
 5b4:	d503201f 	nop
 5b8:	d503201f 	nop
 5bc:	d503201f 	nop

00000000000005c0 <__libc_start_main@plt>:
 5c0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 5c4:	f9400211 	ldr	x17, [x16]
 5c8:	91000210 	add	x16, x16, #0x0
 5cc:	d61f0220 	br	x17

00000000000005d0 <__cxa_finalize@plt>:
 5d0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 5d4:	f9400611 	ldr	x17, [x16, #8]
 5d8:	91002210 	add	x16, x16, #0x8
 5dc:	d61f0220 	br	x17

00000000000005e0 <__gmon_start__@plt>:
 5e0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 5e4:	f9400a11 	ldr	x17, [x16, #16]
 5e8:	91004210 	add	x16, x16, #0x10
 5ec:	d61f0220 	br	x17

00000000000005f0 <abort@plt>:
 5f0:	b0000090 	adrp	x16, 11000 <__libc_start_main@GLIBC_2.34>
 5f4:	f9400e11 	ldr	x17, [x16, #24]
 5f8:	91006210 	add	x16, x16, #0x18
 5fc:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000600 <_start>:
 600:	d503201f 	nop
 604:	d280001d 	mov	x29, #0x0                   	// #0
 608:	d280001e 	mov	x30, #0x0                   	// #0
 60c:	aa0003e5 	mov	x5, x0
 610:	f94003e1 	ldr	x1, [sp]
 614:	910023e2 	add	x2, sp, #0x8
 618:	910003e6 	mov	x6, sp
 61c:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf770>
 620:	f947ec00 	ldr	x0, [x0, #4056]
 624:	d2800003 	mov	x3, #0x0                   	// #0
 628:	d2800004 	mov	x4, #0x0                   	// #0
 62c:	97ffffe5 	bl	5c0 <__libc_start_main@plt>
 630:	97fffff0 	bl	5f0 <abort@plt>

0000000000000634 <call_weak_fn>:
 634:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf770>
 638:	f947e800 	ldr	x0, [x0, #4048]
 63c:	b4000040 	cbz	x0, 644 <call_weak_fn+0x10>
 640:	17ffffe8 	b	5e0 <__gmon_start__@plt>
 644:	d65f03c0 	ret
 648:	d503201f 	nop
 64c:	d503201f 	nop

0000000000000650 <deregister_tm_clones>:
 650:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 654:	9100c000 	add	x0, x0, #0x30
 658:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 65c:	9100c021 	add	x1, x1, #0x30
 660:	eb00003f 	cmp	x1, x0
 664:	540000c0 	b.eq	67c <deregister_tm_clones+0x2c>  // b.none
 668:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf770>
 66c:	f947e021 	ldr	x1, [x1, #4032]
 670:	b4000061 	cbz	x1, 67c <deregister_tm_clones+0x2c>
 674:	aa0103f0 	mov	x16, x1
 678:	d61f0200 	br	x16
 67c:	d65f03c0 	ret

0000000000000680 <register_tm_clones>:
 680:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 684:	9100c000 	add	x0, x0, #0x30
 688:	b0000081 	adrp	x1, 11000 <__libc_start_main@GLIBC_2.34>
 68c:	9100c021 	add	x1, x1, #0x30
 690:	cb000021 	sub	x1, x1, x0
 694:	d37ffc22 	lsr	x2, x1, #63
 698:	8b810c41 	add	x1, x2, x1, asr #3
 69c:	9341fc21 	asr	x1, x1, #1
 6a0:	b40000c1 	cbz	x1, 6b8 <register_tm_clones+0x38>
 6a4:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf770>
 6a8:	f947f042 	ldr	x2, [x2, #4064]
 6ac:	b4000062 	cbz	x2, 6b8 <register_tm_clones+0x38>
 6b0:	aa0203f0 	mov	x16, x2
 6b4:	d61f0200 	br	x16
 6b8:	d65f03c0 	ret
 6bc:	d503201f 	nop

00000000000006c0 <__do_global_dtors_aux>:
 6c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 6c4:	910003fd 	mov	x29, sp
 6c8:	f9000bf3 	str	x19, [sp, #16]
 6cc:	b0000093 	adrp	x19, 11000 <__libc_start_main@GLIBC_2.34>
 6d0:	3940c260 	ldrb	w0, [x19, #48]
 6d4:	35000140 	cbnz	w0, 6fc <__do_global_dtors_aux+0x3c>
 6d8:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf770>
 6dc:	f947e400 	ldr	x0, [x0, #4040]
 6e0:	b4000080 	cbz	x0, 6f0 <__do_global_dtors_aux+0x30>
 6e4:	b0000080 	adrp	x0, 11000 <__libc_start_main@GLIBC_2.34>
 6e8:	f9401400 	ldr	x0, [x0, #40]
 6ec:	97ffffb9 	bl	5d0 <__cxa_finalize@plt>
 6f0:	97ffffd8 	bl	650 <deregister_tm_clones>
 6f4:	52800020 	mov	w0, #0x1                   	// #1
 6f8:	3900c260 	strb	w0, [x19, #48]
 6fc:	f9400bf3 	ldr	x19, [sp, #16]
 700:	a8c27bfd 	ldp	x29, x30, [sp], #32
 704:	d65f03c0 	ret
 708:	d503201f 	nop
 70c:	d503201f 	nop

0000000000000710 <frame_dummy>:
 710:	17ffffdc 	b	680 <register_tm_clones>

0000000000000714 <add>:
 714:	d10043ff 	sub	sp, sp, #0x10
 718:	b9000fe0 	str	w0, [sp, #12]
 71c:	b9000be1 	str	w1, [sp, #8]
 720:	b9400fe1 	ldr	w1, [sp, #12]
 724:	b9400be0 	ldr	w0, [sp, #8]
 728:	0b000020 	add	w0, w1, w0
 72c:	910043ff 	add	sp, sp, #0x10
 730:	d65f03c0 	ret

0000000000000734 <main>:
 734:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 738:	910003fd 	mov	x29, sp
 73c:	b9001fe0 	str	w0, [sp, #28]
 740:	f9000be1 	str	x1, [sp, #16]
 744:	52800020 	mov	w0, #0x1                   	// #1
 748:	b9002fe0 	str	w0, [sp, #44]
 74c:	52800040 	mov	w0, #0x2                   	// #2
 750:	b9002be0 	str	w0, [sp, #40]
 754:	b9402be1 	ldr	w1, [sp, #40]
 758:	b9402fe0 	ldr	w0, [sp, #44]
 75c:	97ffffee 	bl	714 <add>
 760:	b90027e0 	str	w0, [sp, #36]
 764:	52800000 	mov	w0, #0x0                   	// #0
 768:	a8c37bfd 	ldp	x29, x30, [sp], #48
 76c:	d65f03c0 	ret

Disassembly of section .fini:

0000000000000770 <_fini>:
 770:	d503201f 	nop
 774:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 778:	910003fd 	mov	x29, sp
 77c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 780:	d65f03c0 	ret

Disassembly of section .rodata:

0000000000000784 <_IO_stdin_used>:
 784:	00020001 	.inst	0x00020001 ; undefined

Disassembly of section .eh_frame_hdr:

0000000000000788 <__GNU_EH_FRAME_HDR>:
 788:	3b031b01 	.inst	0x3b031b01 ; undefined
 78c:	00000044 	udf	#68
 790:	00000007 	udf	#7
 794:	fffffe78 	.inst	0xfffffe78 ; undefined
 798:	0000005c 	udf	#92
 79c:	fffffec8 	.inst	0xfffffec8 ; undefined
 7a0:	00000070 	udf	#112
 7a4:	fffffef8 	.inst	0xfffffef8 ; undefined
 7a8:	00000084 	udf	#132
 7ac:	ffffff38 	.inst	0xffffff38 ; undefined
 7b0:	00000098 	udf	#152
 7b4:	ffffff88 	.inst	0xffffff88 ; undefined
 7b8:	000000bc 	udf	#188
 7bc:	ffffff8c 	.inst	0xffffff8c ; undefined
 7c0:	000000d0 	udf	#208
 7c4:	ffffffac 	.inst	0xffffffac ; undefined
 7c8:	000000e8 	udf	#232

Disassembly of section .eh_frame:

00000000000007d0 <__FRAME_END__-0xc0>:
 7d0:	00000010 	udf	#16
 7d4:	00000000 	udf	#0
 7d8:	00527a01 	.inst	0x00527a01 ; undefined
 7dc:	011e7804 	.inst	0x011e7804 ; undefined
 7e0:	001f0c1b 	.inst	0x001f0c1b ; undefined
 7e4:	00000010 	udf	#16
 7e8:	00000018 	udf	#24
 7ec:	fffffe14 	.inst	0xfffffe14 ; undefined
 7f0:	00000034 	udf	#52
 7f4:	1e074100 	.inst	0x1e074100 ; undefined
 7f8:	00000010 	udf	#16
 7fc:	0000002c 	udf	#44
 800:	fffffe50 	.inst	0xfffffe50 ; undefined
 804:	00000030 	udf	#48
 808:	00000000 	udf	#0
 80c:	00000010 	udf	#16
 810:	00000040 	udf	#64
 814:	fffffe6c 	.inst	0xfffffe6c ; undefined
 818:	0000003c 	udf	#60
 81c:	00000000 	udf	#0
 820:	00000020 	udf	#32
 824:	00000054 	udf	#84
 828:	fffffe98 	.inst	0xfffffe98 ; undefined
 82c:	00000048 	udf	#72
 830:	200e4100 	.inst	0x200e4100 ; undefined
 834:	039e049d 	.inst	0x039e049d ; undefined
 838:	4e029342 	.inst	0x4e029342 ; undefined
 83c:	0ed3ddde 	.inst	0x0ed3ddde ; undefined
 840:	00000000 	udf	#0
 844:	00000010 	udf	#16
 848:	00000078 	udf	#120
 84c:	fffffec4 	.inst	0xfffffec4 ; undefined
 850:	00000004 	udf	#4
 854:	00000000 	udf	#0
 858:	00000014 	udf	#20
 85c:	0000008c 	udf	#140
 860:	fffffeb4 	.inst	0xfffffeb4 ; undefined
 864:	00000020 	udf	#32
 868:	100e4100 	adr	x0, 1d088 <__bss_end__+0xc050>
 86c:	00000e46 	udf	#3654
 870:	0000001c 	udf	#28
 874:	000000a4 	udf	#164
 878:	fffffebc 	.inst	0xfffffebc ; undefined
 87c:	0000003c 	udf	#60
 880:	300e4100 	adr	x0, 1d0a1 <__bss_end__+0xc069>
 884:	059e069d 	mov	z29.s, p14/z, #52
 888:	0eddde4d 	.inst	0x0eddde4d ; undefined
 88c:	00000000 	udf	#0

0000000000000890 <__FRAME_END__>:
 890:	00000000 	udf	#0

Disassembly of section .init_array:

0000000000010dc8 <__frame_dummy_init_array_entry>:
   10dc8:	00000710 	udf	#1808
   10dcc:	00000000 	udf	#0

Disassembly of section .fini_array:

0000000000010dd0 <__do_global_dtors_aux_fini_array_entry>:
   10dd0:	000006c0 	udf	#1728
   10dd4:	00000000 	udf	#0

Disassembly of section .dynamic:

0000000000010dd8 <.dynamic>:
   10dd8:	00000001 	udf	#1
   10ddc:	00000000 	udf	#0
   10de0:	00000028 	udf	#40
   10de4:	00000000 	udf	#0
   10de8:	0000000c 	udf	#12
   10dec:	00000000 	udf	#0
   10df0:	00000580 	udf	#1408
   10df4:	00000000 	udf	#0
   10df8:	0000000d 	udf	#13
   10dfc:	00000000 	udf	#0
   10e00:	00000770 	udf	#1904
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
   10e60:	00000390 	udf	#912
   10e64:	00000000 	udf	#0
   10e68:	00000006 	udf	#6
   10e6c:	00000000 	udf	#0
   10e70:	000002b8 	udf	#696
   10e74:	00000000 	udf	#0
   10e78:	0000000a 	udf	#10
   10e7c:	00000000 	udf	#0
   10e80:	0000008d 	udf	#141
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
   10ec0:	00000060 	udf	#96
   10ec4:	00000000 	udf	#0
   10ec8:	00000014 	udf	#20
   10ecc:	00000000 	udf	#0
   10ed0:	00000007 	udf	#7
   10ed4:	00000000 	udf	#0
   10ed8:	00000017 	udf	#23
   10edc:	00000000 	udf	#0
   10ee0:	00000520 	udf	#1312
   10ee4:	00000000 	udf	#0
   10ee8:	00000007 	udf	#7
   10eec:	00000000 	udf	#0
   10ef0:	00000460 	udf	#1120
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
   10f30:	00000430 	udf	#1072
   10f34:	00000000 	udf	#0
   10f38:	6fffffff 	.inst	0x6fffffff ; undefined
   10f3c:	00000000 	udf	#0
   10f40:	00000001 	udf	#1
   10f44:	00000000 	udf	#0
   10f48:	6ffffff0 	.inst	0x6ffffff0 ; undefined
   10f4c:	00000000 	udf	#0
   10f50:	0000041e 	udf	#1054
   10f54:	00000000 	udf	#0
   10f58:	6ffffff9 	.inst	0x6ffffff9 ; undefined
   10f5c:	00000000 	udf	#0
   10f60:	00000004 	udf	#4
	...

Disassembly of section .got:

0000000000010fb8 <.got>:
   10fb8:	00010dd8 	.inst	0x00010dd8 ; undefined
	...
   10fd8:	00000734 	udf	#1844
	...

Disassembly of section .got.plt:

0000000000010fe8 <.got.plt>:
	...
   11000:	000005a0 	udf	#1440
   11004:	00000000 	udf	#0
   11008:	000005a0 	udf	#1440
   1100c:	00000000 	udf	#0
   11010:	000005a0 	udf	#1440
   11014:	00000000 	udf	#0
   11018:	000005a0 	udf	#1440
   1101c:	00000000 	udf	#0

Disassembly of section .data:

0000000000011020 <__data_start>:
	...

0000000000011028 <__dso_handle>:
   11028:	00011028 	.inst	0x00011028 ; undefined
   1102c:	00000000 	udf	#0

Disassembly of section .bss:

0000000000011030 <completed.0>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi  // mi = first
   4:	4e472820 	trn1	v0.8h, v1.8h, v7.8h
   8:	31202955 	adds	w21, w10, #0x80a
   c:	2e322e31 	uqsub	v17.8b, v17.8b, v18.8b
  10:	Address 0x0000000000000010 is out of bounds.

