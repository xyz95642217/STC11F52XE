





;
;
;
; 0xe6 0x7d 4.6
;
;
; 77 06 5B 5E
;
;
;
;
; 2021/3/16 V1.00
;
;
;
; V1.01 需要移植到STC11F60XE里面

; 6.8版本编号称重表_20201212_004 这个文件

; ------------------------------------------------------------------------
;
;
; 以前通过这个程序给客户弄的   现在客户要求STC11F52 换 STC11F60XE
; 发现以前自己弄过  是没弄好吗？  程序下面加了一些AT24C的程序
;
;
;
; 
#include"define.h"






RESET:					
		ljmp	RESET_0
	;	ljmp	test_003
	;	ljmp	MY_main
; ======================================================

IE0_0000:					
		mov	DPTR, #2Dh
		movx	A, @DPTR
		mov	R7, A
		mov	R6, #0
		ret


; ======================================================


TF0_0000:
		ljmp	TF0_0

; ---------------------------------------------------------------------------

code_E:					
		setb	P1.5
		nop
		nop
		nop


		nop
		nop
		clr	A
		mov	DPTR, #34Eh
		movx	@DPTR, A
		mov	DPTR, #351h
		mov	A, #3
		movx	@DPTR, A
		ljmp	code_C851
 
; ======================================================

 
RI0_TI0:
		ljmp	RI0_TI0_0
 

; ======================================================


code_26:				
		mov	RAM_8, R7
		lcall	code_AD1F
 
		mov	A, RAM_8
		setb	C
		subb	A, R7
		jc	code_34
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_34:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
 
IADC:
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
 
IEX2:
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
 
IEX3:
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		orl	A, B
		jnz	code_66

 
IEX5:
		mov	R7, #1
		ret
 
; ---------------------------------------------------------------------------

code_66:				
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A

 
		mov	DPTR, #16Dh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
CTF:
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_BA
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_BA:				
		mov	DPTR, #16Ah
		movx	A, @DPTR
		dec	A
		jnz	code_C4
		ljmp	code_1B0
; ---------------------------------------------------------------------------

code_C4:				
		dec	A
		jnz	code_CA
		ljmp	code_29E
; ---------------------------------------------------------------------------

code_CA:				
		dec	A
		jnz	code_D0
		ljmp	code_6CC
; ---------------------------------------------------------------------------

code_D0:				
		add	A, #3
		jz	code_D7
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_D7:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_115
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_E9
		lcall	code_AFBA
		lcall	code_B8CD

code_E9:				
		mov	R7, RAM_8
		lcall	code_90FC
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jc	code_FB
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_FB:				
		lcall	code_AD91
		mov	A, R7
		jnz	code_104
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_104:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_115:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_157
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		setb	C
		subb	A, #0
		mov	A, B
		xrl	A, #80h
		subb	A, #80h
		jc	code_154
		lcall	code_AE71

code_154:				
		lcall	code_B832

code_157:				
		mov	R7, RAM_8
		lcall	code_210E
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_16C
		lcall	code_AD91
		mov	A, R7
		jnz	code_189

code_16C:				
		mov	DPTR, #1AAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #162h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_184
		mov	R7, #1
		sjmp	code_186
; ---------------------------------------------------------------------------

code_184:				
		mov	R7, #0

code_186:				
		mov	A, R7
		jnz	code_16C

code_189:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		mov	A, R7
		xrl	A, #1
		jz	code_199
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_199:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #16Ah
		mov	A, #1
		movx	@DPTR, A
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_1B0:				
		mov	DPTR, #104h
		movx	A, @DPTR
		mov	R5, A
		jnz	code_1BA
		ljmp	code_295
; ---------------------------------------------------------------------------

code_1BA:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		orl	A, B
		jnz	code_1EC
		ljmp	code_295
; ---------------------------------------------------------------------------

code_1EC:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_1FE
		mov	A, R5
		jz	code_1FB
		lcall	code_AFBA
		lcall	code_B8CD

code_1FB:				
		ljmp	code_2D5
; ---------------------------------------------------------------------------

code_1FE:				
		lcall	code_AE71
		lcall	code_B832
		mov	R7, RAM_8
		lcall	code_210E
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R5, A
		mov	R4, B
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		clr	C
		subb	A, R5
		mov	R7, A
		mov	A, B
		subb	A, R4
		mov	R6, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R7, A
		mov	A, R6
		subb	A, R4
		mov	R6, A
		mov	A, RAM_8
;  CTF


; ======================================================


code_274:
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jnc	code_292
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_292:				
		lcall	code_AFBA

code_295:				
		mov	DPTR, #16Ah
		mov	A, #2
		movx	@DPTR, A
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_29E:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_2DD
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_2C2
		lcall	code_AD91
		mov	A, R7
		jz	code_2C2
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A

code_2C2:				
		mov	DPTR, #16Bh
		movx	A, @DPTR
		jz	code_2CC
		inc	DPTR
		mov	A, #1
		movx	@DPTR, A

code_2CC:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_2D5
		lcall	code_B8CD

code_2D5:				
		mov	R7, RAM_8
		lcall	code_90FC
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_2DD:				
		mov	DPTR, #16Bh
		movx	A, @DPTR
		jz	code_2E6
		ljmp	code_4D0
; ---------------------------------------------------------------------------

code_2E6:				
		mov	DPTR, #1BEh
		movx	A, @DPTR
		jnz	code_2EE
		inc	DPTR
		movx	A, @DPTR

code_2EE:				
		jnz	code_2F3
		ljmp	code_463
; ---------------------------------------------------------------------------

code_2F3:				
		mov	DPTR, #1C0h
		movx	A, @DPTR
		jnz	code_2FB
		inc	DPTR
		movx	A, @DPTR

code_2FB:				
		jnz	code_300
		ljmp	code_463
; ---------------------------------------------------------------------------

code_300:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jnz	code_309
		ljmp	code_3BA
; ---------------------------------------------------------------------------

code_309:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		setb	C
		subb	A, #0
		mov	A, B
		xrl	A, #80h
		subb	A, #80h
		jnc	code_342
		ljmp	code_463
; ---------------------------------------------------------------------------

code_342:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPL, R7
		mov	DPH, A
		lcall	code_11C8
		mov	R5, A
		mov	R4, B
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		clr	C
		subb	A, R5
		mov	R7, A
		mov	A, B
		subb	A, R4
		mov	R6, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R7, A
		mov	A, R6
		subb	A, R4
		mov	R6, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jnc	code_3B7
		ljmp	code_463
; ---------------------------------------------------------------------------

code_3B7:				
		ljmp	code_44B
; ---------------------------------------------------------------------------

code_3BA:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #4
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		clr	A
		mov	R3, #5
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		push	RAM_6
		push	RAM_7
		mov	A, RAM_8
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		pop	RAM_7
		pop	RAM_6
		lcall	code_1259
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	C
		lcall	code_12C4
		jnc	code_463

code_44B:				
		mov	DPTR, #16Bh
		mov	A, #1
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #16Fh
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

code_463:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R7, A
		mov	A, B
		subb	A, R4
		mov	R6, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_4CB
		mov	R7, #1
		ljmp	code_640
; ---------------------------------------------------------------------------

code_4CB:				
		mov	R7, #0
		ljmp	code_640
; ---------------------------------------------------------------------------

code_4D0:				
		mov	DPTR, #16Ch
		movx	A, @DPTR
		jnz	code_4D9
		ljmp	code_5A2
; ---------------------------------------------------------------------------

code_4D9:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_4E9
		lcall	code_AD91
		mov	A, R7
		jnz	code_506

code_4E9:				
		mov	DPTR, #1BEh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #162h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_501
		mov	R7, #1
		sjmp	code_503
; ---------------------------------------------------------------------------

code_501:				
		mov	R7, #0

code_503:				
		mov	A, R7
		jnz	code_4E9

code_506:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		cjne	R7, #1,	code_536
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #16Ch
		movx	@DPTR, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #16Fh
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ljmp	code_645
; ---------------------------------------------------------------------------

code_536:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R7, A
		mov	A, B
		subb	A, R4
		mov	R6, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_59D
		mov	R7, #1
		sjmp	code_59F
; ---------------------------------------------------------------------------

code_59D:				
		mov	R7, #0

code_59F:				
		ljmp	code_640
; ---------------------------------------------------------------------------

code_5A2:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_5B2
		lcall	code_AD91
		mov	A, R7
		jnz	code_5CF

code_5B2:				
		mov	DPTR, #1C0h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #162h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_5CA
		mov	R7, #1
		sjmp	code_5CC
; ---------------------------------------------------------------------------

code_5CA:				
		mov	R7, #0

code_5CC:				
		mov	A, R7
		jnz	code_5B2

code_5CF:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		cjne	R7, #1,	code_5F0
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #16Ch
		mov	A, #1
		movx	@DPTR, A
		sjmp	code_645
; ---------------------------------------------------------------------------

code_5F0:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_63E
		mov	R7, #1
		sjmp	code_640
; ---------------------------------------------------------------------------

code_63E:				
		mov	R7, #0

code_640:				
		mov	DPTR, #26Bh
		mov	A, R7
		movx	@DPTR, A

code_645:				
		mov	DPTR, #16Bh
		movx	A, @DPTR
		jz	code_64F
		inc	DPTR
		movx	A, @DPTR
		jz	code_65F

code_64F:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_658
		lcall	code_B832

code_658:				
		mov	R7, RAM_8
		lcall	code_210E
		sjmp	code_66D
; ---------------------------------------------------------------------------

code_65F:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_668
		lcall	code_B8CD

code_668:				
		mov	R7, RAM_8
		lcall	code_90FC

code_66D:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		jnz	code_67A
		mov	DPTR, #176h
		movx	@DPTR, A
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_67A:				
		mov	DPTR, #12Ch
		movx	A, @DPTR
		jnz	code_683
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_683:				
		clr	A
		movx	@DPTR, A
		mov	DPTR, #176h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jnc	code_69E
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_699
		inc	DPTR
		movx	A, @DPTR

code_699:				
		jz	code_69E
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_69E:				
		mov	DPTR, #16Bh
		movx	A, @DPTR
		jz	code_6A8
		inc	DPTR
		movx	A, @DPTR
		jz	code_6AF

code_6A8:				
		clr	A
		mov	DPTR, #13Dh
		movx	@DPTR, A
		sjmp	code_6B5
; ---------------------------------------------------------------------------

code_6AF:				
		mov	DPTR, #13Dh
		mov	A, #1
		movx	@DPTR, A

code_6B5:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_6BE
		lcall	code_B8CD

code_6BE:				
		mov	R7, RAM_8
		lcall	code_90FC
		mov	DPTR, #16Ah
		mov	A, #3
		movx	@DPTR, A
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_6CC:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_6D5
		lcall	code_B8CD

code_6D5:				
		mov	R7, RAM_8
		lcall	code_90FC
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #10h
		jz	code_6E7
		mov	A, R7
		cjne	A, #11h, code_6EE

code_6E7:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A

code_6EE:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_732
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_712
		lcall	code_AD91
		mov	A, R7
		jz	code_712
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A

code_712:				
		clr	A
		mov	DPTR, #171h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #10h
		jnz	code_727
		ljmp	code_BA3
; ---------------------------------------------------------------------------

code_727:				
		mov	A, R7
		xrl	A, #11h
		jz	code_72F
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_72F:				
		ljmp	code_BA3
; ---------------------------------------------------------------------------

code_732:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	R6, A
		mov	A, R4
		subb	A, B
		mov	DPTR, #26Ch
		movx	@DPTR, A
		inc	DPTR
		xch	A, R6
		movx	@DPTR, A
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_78C
		lcall	code_AD91
		mov	A, R7
		jnz	code_7A9

code_78C:				
		mov	DPTR, #1A4h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #162h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_7A4
		mov	R7, #1
		sjmp	code_7A6
; ---------------------------------------------------------------------------

code_7A4:				
		mov	R7, #0

code_7A6:				
		mov	A, R7
		jnz	code_78C

code_7A9:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_B1FC
		setb	C
		mov	A, R7
		subb	A, #5
		mov	A, R6
		subb	A, #0
		jc	code_7BD
		ljmp	code_9C8
; ---------------------------------------------------------------------------

code_7BD:				
		mov	DPTR, #1C8h
		movx	A, @DPTR
		jnz	code_7C7
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #64h

code_7C7:				
		jnz	code_7CC
		ljmp	code_9C8
; ---------------------------------------------------------------------------

code_7CC:				
		clr	A
		mov	DPTR, #26Eh
		movx	@DPTR, A
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #64h
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_A4D3
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		mov	DPTR, #1C8h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		setb	C
		lcall	code_12C4
		jc	code_851
		mov	DPTR, #26Eh
		mov	A, #1
		movx	@DPTR, A

code_851:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #64h
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_A4D3
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		mov	DPTR, #1C8h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	C
		lcall	code_12C4
		jnc	code_8D7
		mov	DPTR, #26Eh
		mov	A, #0FFh
		movx	@DPTR, A

code_8D7:				
		mov	DPTR, #171h
		movx	A, @DPTR
		jz	code_8E0
		ljmp	code_9C0
; ---------------------------------------------------------------------------

code_8E0:				
		mov	DPTR, #26Eh
		movx	A, @DPTR
		jnz	code_8E9
		ljmp	code_9D1
; ---------------------------------------------------------------------------

code_8E9:				
		mov	DPTR, #171h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #1C8h
		movx	A, @DPTR
		jnz	code_8F7
		inc	DPTR
		movx	A, @DPTR

code_8F7:				
		jz	code_915
		mov	DPTR, #1C8h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_10EA
		lcall	code_A25D
		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		sjmp	code_91C
; ---------------------------------------------------------------------------

code_915:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_91C:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		push	RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		mov	DPTR, #1C8h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_10EA
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R7, A
		mov	A, R6
		subb	A, R4
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		pop	RAM_0
		lcall	code_1267
		clr	A
		mov	R3, #0Ah
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		clr	A
		mov	R3, #64h
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	DPTR, #271h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		lcall	code_9611
		mov	DPTR, #271h
		mov	A, R6
		movx	@DPTR, A
		mov	R4, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	R5, A
		mov	DPTR, #26Eh
		movx	A, @DPTR
		mov	R7, A
		rlc	A
		subb	A, ACC
		mov	R6, A
		lcall	code_10EA
		mov	DPTR, #172h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		sjmp	code_9D1
; ---------------------------------------------------------------------------

code_9C0:				
		mov	DPTR, #26Eh
		movx	A, @DPTR
		jnz	code_9D1
		sjmp	code_9C9
; ---------------------------------------------------------------------------

code_9C8:				
		clr	A

code_9C9:				
		mov	DPTR, #171h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_9D1:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		mov	A, R7
		xrl	A, #1
		jz	code_9E1
		ljmp	code_BAA
; ---------------------------------------------------------------------------

code_9E1:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #13Dh
		movx	A, @DPTR
		jnz	code_A11
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R7, RAM_8
		lcall	code_84D8
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R7, RAM_8
		lcall	code_3908
		sjmp	code_A67
; ---------------------------------------------------------------------------

code_A11:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	DPTR, #16Dh
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	DPTR, #170h
		movx	A, @DPTR
		subb	A, R5
		mov	R5, A
		mov	DPTR, #16Fh
		movx	A, @DPTR
		subb	A, R4
		mov	R4, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R5, A
		mov	A, B
		subb	A, R4
		mov	R4, A
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	R7, RAM_8
		lcall	code_5543

code_A67:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	R7, A
		mov	A, R4
		subb	A, B
		mov	R6, A
		mov	DPTR, #26Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_ABD
		ljmp	code_B9D
; ---------------------------------------------------------------------------

code_ABD:				
		mov	DPTR, #1D0h
		movx	A, @DPTR
		jnz	code_AC5
		inc	DPTR
		movx	A, @DPTR

code_AC5:				
		jnz	code_ACA
		ljmp	code_B9D
; ---------------------------------------------------------------------------

code_ACA:				
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #64h
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		push	RAM_6
		push	RAM_7
		mov	DPTR, #1D0h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		pop	RAM_7
		pop	RAM_6
		lcall	code_A4D3
		push	RAM_6
		push	RAM_7
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R6, B
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		pop	RAM_7
		pop	RAM_6
		setb	C
		lcall	code_12C4
		jnc	code_B9D
		mov	A, RAM_8
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #0Fh
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		clr	A
		mov	R3, #0Ah
		mov	R2, A
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		setb	C
		lcall	code_12C4
		jnc	code_B9D
		mov	DPTR, #16Ah
		mov	A, #2
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		sjmp	code_BA3
; ---------------------------------------------------------------------------

code_B9D:				
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_BA3:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A

code_BAA:				
		mov	DPTR, #171h
		movx	A, @DPTR
		jnz	code_BB3
		ljmp	code_C3A
; ---------------------------------------------------------------------------

code_BB3:				
		mov	A, RAM_8
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	DPTR, #173h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		mov	DPTR, #172h
		movx	A, @DPTR
		addc	A, B
		mov	R6, A
		lcall	code_9616
		mov	A, RAM_8
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	R7, A
		mov	A, R4
		subb	A, R6
		mov	R6, A
		mov	DPTR, #175h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		mov	DPTR, #174h
		movx	A, @DPTR
		addc	A, R6
		mov	DPTR, #1DAh
		sjmp	code_C69
; ---------------------------------------------------------------------------

code_C3A:				
		mov	A, RAM_8
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, RAM_8
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #174h
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #1DAh
		xch	A, R7

code_C69:				
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_274

; ---------------------------------------------------------------------------
 
code_C73:				
		ljmp	code_1028
;  CHUNK	FOR code_C7A
; ---------------------------------------------------------------------------
		mov	A, R0
		xrl	A, #80h
		mov	R0, A

; ======================================================


code_C7A:				

 
		mov	A, R1
		rlc	A
		mov	A, R0
		rlc	A
		jz	code_C91
		inc	A
		jz	code_C73
		mov	A, R5
		rlc	A
		mov	A, R4
		rlc	A
		jnz	code_C92
		mov	A, R0
		mov	R4, A
		mov	A, R1
		mov	R5, A
		mov	A, R2
		mov	R6, A
		mov	A, R3
		mov	R7, A

code_C91:				
		ret
; ---------------------------------------------------------------------------

code_C92:				
		inc	A
		jz	code_C73
		setb	C
		mov	A, R3
		subb	A, R7
		mov	A, R2
		subb	A, R6
		mov	A, R1
		subb	A, R5
		mov	A, R0
		clr	ACC.7
		mov	B, R4
		clr	B.7
		subb	A, B
		jc	code_CB3
		mov	A, R0
		xch	A, R4
		mov	R0, A
		mov	A, R1
		xch	A, R5
		mov	R1, A
		mov	A, R2
		xch	A, R6
		mov	R2, A
		mov	A, R3
		xch	A, R7
		mov	R3, A

code_CB3:				
		lcall	code_FF3
		mov	B, PSW
		anl	A, R0
		inc	A
		jnz	code_CC0
		jb	PSW.5, code_C73

code_CC0:				
		mov	A, R0
		inc	A
		jnz	code_CCB
		jnc	code_CC8
		cpl	PSW.5

code_CC8:				
		ljmp	code_1032
; ---------------------------------------------------------------------------

code_CCB:				
		mov	PSW.5, C
		mov	A, R4
		inc	A
		jz	code_CC8
		clr	A
		xch	A, R4
		push	ACC
		clr	C
		subb	A, R0
		mov	R0, A
		jz	code_D15
		subb	A, #18h
		jz	code_CE6
		jc	code_CED
		pop	ACC
		mov	R3, A
		ljmp	code_100A
; ---------------------------------------------------------------------------

code_CE6:				
		clr	A
		mov	R3, A
		mov	R2, A
		xch	A, R1
		mov	R4, A
		sjmp	code_D15
; ---------------------------------------------------------------------------

code_CED:				
		mov	A, R0
		jnb	ACC.4, code_CF7
		clr	A
		xch	A, R1
		mov	R3, A
		clr	A
		xch	A, R2
		mov	R4, A

code_CF7:				
		mov	A, R0
		jnb	ACC.3, code_D00
		clr	A
		xch	A, R1
		xch	A, R2
		xch	A, R3
		mov	R4, A

code_D00:				
		mov	A, R0
		anl	A, #7
		jz	code_D15
		mov	R0, A

code_D06:				
		clr	C
		mov	A, R1
		rrc	A
		mov	R1, A
		mov	A, R2
		rrc	A
		mov	R2, A
		mov	A, R3
		rrc	A
		mov	R3, A
		mov	A, R4
		rrc	A
		mov	R4, A
		djnz	R0, code_D06

code_D15:				
		jnb	B.5, code_D47
		clr	C
		clr	A
		subb	A, R4
		mov	R4, A
		mov	A, R7
		subb	A, R3
		mov	R7, A
		mov	A, R6
		subb	A, R2
		mov	R6, A
		mov	A, R5
		subb	A, R1
		mov	R5, A
		pop	ACC
		mov	R3, A
		mov	A, R7
		orl	A, R6
		orl	A, R5
		orl	A, R4
		jnz	code_D40
		ret
; ---------------------------------------------------------------------------

code_D2F:				
		djnz	R3, code_D34
		ljmp	code_102F
; ---------------------------------------------------------------------------

code_D34:				
		mov	A, R4
		add	A, R4
		mov	R4, A
		mov	A, R7
		rlc	A
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A

code_D40:				
		mov	A, R5
		jnb	ACC.7, code_D2F
		ljmp	code_100A
; ---------------------------------------------------------------------------

code_D47:				
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R6
		addc	A, R2
		mov	R6, A
		mov	A, R5
		addc	A, R1
		mov	R5, A
		pop	ACC
		mov	R3, A
		jnc	code_D68
		inc	R3
		cjne	R3, #0,	code_D5C
		ljmp	code_1032
; ---------------------------------------------------------------------------

code_D5C:				
		mov	A, R5
		rrc	A
		mov	R5, A
		mov	A, R6
		rrc	A
		mov	R6, A
		mov	A, R7
		rrc	A
		mov	R7, A
		mov	A, R4
		rrc	A
		mov	R4, A

code_D68:				
		ljmp	code_100A
;  code_C7A


; ======================================================


code_D6B:				
		mov	A, R4
		orl	A, R5
		jz	code_D80
		mov	A, R0
		orl	A, R1
		jnz	code_D8A
		mov	A, R5
		rlc	A
		mov	A, R4
		rlc	A
		inc	A
		jz	code_D87
		clr	A
		mov	R4, A
		mov	R7, A
		mov	R6, A
		mov	R5, A

code_D7F:				
		ret
; ---------------------------------------------------------------------------

code_D80:				
		mov	A, R1
		rlc	A
		mov	A, R0
		rlc	A
		inc	A
		jnz	code_D7F

code_D87:				
		ljmp	code_1028
; ---------------------------------------------------------------------------

code_D8A:				
		lcall	code_FF3
		anl	A, R0
		inc	A
		jz	code_D9A
		clr	A
		xch	A, R4
		add	A, #81h
		jnc	code_D9D
		add	A, R0
		jnc	code_DA3

code_D9A:				
		ljmp	code_1032
; ---------------------------------------------------------------------------

code_D9D:				
		add	A, R0
		jc	code_DA3
		ljmp	code_102F
; ---------------------------------------------------------------------------

code_DA3:				
		push	ACC
		mov	A, R3
		orl	A, R2
		jnz	code_DED
		cjne	R1, #80h, code_DB2

code_DAC:				
		pop	ACC
		mov	R3, A
		ljmp	code_101E
; ---------------------------------------------------------------------------

code_DB2:				
		mov	A, R7
		orl	A, R6
		jnz	code_DD2
		cjne	R5, #80h, code_DC1

code_DB9:				
		mov	A, R3
		mov	R7, A
		mov	A, R2
		mov	R6, A
		mov	A, R1
		mov	R5, A
		sjmp	code_DAC
; ---------------------------------------------------------------------------

code_DC1:				
		mov	A, R1
		mov	B, R5
		mul	AB
		mov	R6, A
		mov	A, B
		ljmp	code_E54
; ---------------------------------------------------------------------------

code_DCB:				
		mov	A, R1
		xch	A, R5
		mov	R1, A
		mov	A, R2
		mov	R6, A
		mov	A, R3
		mov	R7, A

code_DD2:				
		mov	A, R7
		mov	B, R1
		mul	AB
		mov	R4, A
		mov	A, B
		xch	A, R6
		mov	B, R1
		mul	AB
		add	A, R6
		mov	R7, A
		clr	A
		addc	A, B
		xch	A, R5
		mov	B, R1
		mul	AB
		add	A, R5
		mov	R6, A
		clr	A
		addc	A, B
		sjmp	code_E54
; ---------------------------------------------------------------------------

code_DED:				
		mov	A, R7
		orl	A, R6
		jnz	code_DF6
		cjne	R5, #80h, code_DCB
		sjmp	code_DB9
; ---------------------------------------------------------------------------

code_DF6:				
		mov	A, R7
		mov	B, R3
		mul	AB
		mov	R4, B
		mov	A, R6
		mov	B, R3
		mul	AB
		add	A, R4
		mov	R4, A
		clr	A
		addc	A, B
		mov	R0, A
		mov	A, R7
		mov	B, R2
		mul	AB
		add	A, R4
		mov	A, B
		addc	A, R0
		mov	R4, A
		clr	A
		rlc	A
		xch	A, R3
		mov	B, R5
		mul	AB
		add	A, R4
		mov	R4, A
		mov	A, B
		addc	A, R3
		mov	R0, A
		mov	A, R6
		mov	B, R2
		mul	AB
		add	A, R4
		mov	R4, A
		mov	A, B
		addc	A, R0
		mov	R0, A
		clr	A
		rlc	A
		xch	A, R7
		mov	B, R1
		mul	AB
		add	A, R4
		mov	R4, A
		mov	A, B
		addc	A, R0
		xch	A, R7
		addc	A, #0
		xch	A, R6
		mov	B, R1
		mul	AB
		add	A, R7
		mov	R7, A
		mov	A, B
		addc	A, R6
		mov	R6, A
		clr	A
		rlc	A
		xch	A, R1
		mov	B, R5
		mul	AB
		add	A, R6
		mov	R6, A
		mov	A, B
		addc	A, R1
		xch	A, R5
		mov	B, R2
		mul	AB
		add	A, R7
		mov	R7, A
		mov	A, B
		addc	A, R6
		mov	R6, A
		clr	A
		addc	A, R5

code_E54:				
		mov	R5, A
		rlc	A
		pop	ACC
		mov	R3, A
		jnc	code_E62
		inc	R3
		cjne	R3, #0,	code_E6E
		ljmp	code_1032
; ---------------------------------------------------------------------------

code_E62:				
		mov	A, R4
		add	A, R4
		mov	R4, A
		mov	A, R7
		rlc	A
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A

code_E6E:				
		ljmp	code_100A
;  code_D6B

; ---------------------------------------------------------------------------
 
code_E71:				
		ljmp	code_1032
;  CHUNK	FOR code_E74

; ======================================================


code_E74:				

 
		mov	A, R4
		anl	A, R5
		inc	A
		jz	code_E7E
		mov	A, R0
		anl	A, R1
		inc	A
		jnz	code_E81

code_E7E:				
		ljmp	code_1028
; ---------------------------------------------------------------------------

code_E81:				
		lcall	code_FF3
		anl	A, R0
		inc	A
		jz	code_E7E
		mov	A, R4
		orl	A, R0
		jz	code_E7E
		mov	A, R4
		jnz	code_E93
		mov	R5, A
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_E93:				
		xch	A, R0
		jz	code_E71
		add	A, #81h
		xch	A, R0
		jnc	code_EA4
		clr	C
		subb	A, R0
		jz	code_EA1
		jnc	code_EA7

code_EA1:				
		ljmp	code_102F
; ---------------------------------------------------------------------------

code_EA4:				
		subb	A, R0
		jnc	code_E71

code_EA7:				
		mov	DPL, A
		mov	A, R1
		add	A, R1
		orl	A, R3
		orl	A, R2
		jnz	code_EB4
		mov	R3, DPL
		ljmp	code_101E
; ---------------------------------------------------------------------------

code_EB4:				
		mov	B, #0
		mov	R4, #1Ah
		mov	R0, #80h

code_EBB:				
		clr	C
		mov	A, R7
		subb	A, R3
		mov	A, R6
		subb	A, R2
		mov	A, R5
		subb	A, R1
		jc	code_ED1

code_EC4:				
		clr	C
		mov	A, R7
		subb	A, R3
		mov	R7, A
		mov	A, R6
		subb	A, R2
		mov	R6, A
		mov	A, R5
		subb	A, R1
		mov	R5, A
		mov	A, R0
		orl	B, A

code_ED1:				
		djnz	R4, code_EF6
		mov	R4, B
		pop	ACC
		mov	R7, A
		pop	ACC
		mov	R6, A
		pop	ACC
		mov	R5, A
		mov	R3, DPL
		jb	ACC.7, code_EF3
		dec	R3
		mov	A, R3
		jz	code_EA1
		mov	A, R4
		add	A, R4
		mov	R4, A
		mov	A, R7
		rlc	A
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A

code_EF3:				
		ljmp	code_100A
; ---------------------------------------------------------------------------

code_EF6:				
		mov	A, R0
		rr	A
		mov	R0, A
		jnb	ACC.7, code_F01
		push	B
		mov	B, #0

code_F01:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A
		jc	code_EC4
		jnb	ACC.7, code_ED1
		sjmp	code_EBB
;  code_E74


; ======================================================


code_F11:				
		mov	A, #0F8h
		xch	A, R4
		xrl	A, #80h
		xch	A, R4
		xch	A, R0
		xrl	A, #80h
		xch	A, R0
		mov	DPL, A
		inc	A
		jz	code_F63
		clr	C
		mov	A, R3
		subb	A, R7
		mov	B, A
		mov	A, R2
		subb	A, R6
		orl	B, A
		mov	A, R1
		subb	A, R5
		orl	B, A
		mov	A, R0
		subb	A, R4
		orl	A, B
		jz	code_F63
		jnc	code_F4D
		mov	A, DPL
		anl	A, R7
		mov	R7, A
		mov	A, DPL
		cpl	A
		add	A, R3
		anl	A, DPL
		mov	R3, A
		jnc	code_F63
		inc	R2
		cjne	R2, #0,	code_F63
		inc	R1
		cjne	R1, #0,	code_F63
		inc	R0
		sjmp	code_F63
; ---------------------------------------------------------------------------

code_F4D:				
		mov	A, DPL
		anl	A, R3
		mov	R3, A
		mov	A, DPL
		cpl	A
		add	A, R7
		anl	A, DPL
		mov	R7, A
		jnc	code_F63
		inc	R6
		cjne	R6, #0,	code_F63
		inc	R5
		cjne	R5, #0,	code_F63
		inc	R4

code_F63:				
		clr	C
		mov	A, R3
		subb	A, R7
		mov	B, A
		mov	A, R2
		subb	A, R6
		orl	B, A
		mov	A, R1
		subb	A, R5
		orl	B, A
		mov	A, R0
		subb	A, R4
		orl	A, B
		jz	code_F7D
		xch	A, R4
		orl	A, R0
		jb	ACC.7, code_F7C
		cpl	C

code_F7C:				
		mov	A, R4

code_F7D:				
		ret
;  code_F11

; ---------------------------------------------------------------------------
		mov	B, #20h
		sjmp	code_F91

; ======================================================


code_F83:				
		mov	B, #10h
		sjmp	code_F8D
; ---------------------------------------------------------------------------
		mov	B, #8
		mov	R5, #0

code_F8D:				
		mov	R6, #0
		mov	R7, #0

code_F91:				
		rlc	A
		mov	PSW.5, C
		jnb	PSW.5, code_F9A
		lcall	code_12B6

code_F9A:				
		mov	A, R4
		rlc	A
		jc	code_FAE
		mov	A, R7
		rlc	A
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A
		mov	A, R4
		rlc	A
		mov	R4, A
		djnz	B, code_F9A
		ret
; ---------------------------------------------------------------------------

code_FAE:				
		mov	A, B
		add	A, #7Eh
		mov	C, PSW.5
		rrc	A
		xch	A, R4
		mov	ACC.7, C
		xch	A, R5
		xch	A, R6
		mov	R7, A
		ret
;  code_F83


; ======================================================


code_FBC:				
		mov	A, R5
		setb	ACC.7
		xch	A, R5
		rlc	A
		mov	A, R4
		rlc	A
		mov	PSW.5, C
		add	A, #81h
		jc	code_FCF
		clr	A

code_FCA:				
		mov	R7, A
		mov	R6, A
		mov	R5, A
		mov	R4, A

code_FCE:				
		ret
; ---------------------------------------------------------------------------

code_FCF:				
		mov	R4, A
		clr	A
		xch	A, R7
		xch	A, R6
		xch	A, R5
		xch	A, R4
		add	A, #0E0h
		jnc	code_FEA
		mov	A, #0FFh
		sjmp	code_FCA
; ---------------------------------------------------------------------------

code_FDD:				
		clr	C
		xch	A, R4
		rrc	A
		xch	A, R4
		xch	A, R5
		rrc	A
		xch	A, R5
		xch	A, R6
		rrc	A
		xch	A, R6
		xch	A, R7
		rrc	A
		xch	A, R7

code_FEA:				
		inc	A
		jnz	code_FDD
		jnb	PSW.5, code_FCE
		ljmp	code_12B6
;  code_FBC


; ======================================================


code_FF3:				
		mov	A, R1
		setb	ACC.7
		xch	A, R1
		rlc	A
		mov	A, R0
		rlc	A
		mov	R0, A
		mov	PSW.5, C
		mov	A, R5
		setb	ACC.7
		xch	A, R5
		rlc	A
		mov	A, R4
		rlc	A
		mov	R4, A
		jnc	code_1009
		cpl	PSW.5

code_1009:				
		ret
;  code_FF3

; ---------------------------------------------------------------------------
 
code_100A:				
		mov	A, R4
		jnb	ACC.7, code_101E
		inc	R7
		cjne	R7, #0,	code_101E
		inc	R6
		cjne	R6, #0,	code_101E
		inc	R5
		cjne	R5, #0,	code_101E
		inc	R3
		mov	A, R3
		jz	code_1032

code_101E:				
		mov	C, PSW.5
		mov	A, R3
		rrc	A
		mov	R4, A
		mov	A, R5
		mov	ACC.7, C
		mov	R5, A
		ret
; ---------------------------------------------------------------------------

code_1028:				
		mov	A, #0FFh

code_102A:				
		mov	R4, A
		mov	R5, A

code_102C:				
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_102F:				
		clr	A
		sjmp	code_102A
; ---------------------------------------------------------------------------

code_1032:				
		mov	C, PSW.5
		mov	A, #0FFh
		rrc	A
		mov	R4, A
		mov	R5, #80h
		clr	A
		sjmp	code_102C
;  CHUNK	FOR code_E74

; ======================================================


R3R2R1_GetACC_103D:				
		cjne	R3, #1,	code_1046
		mov	DPL, R1
		mov	DPH, R2
		movx	A, @DPTR
		ret
; ---------------------------------------------------------------------------

code_1046:				
		jnc	code_104A
		mov	A, @R1
		ret
; ---------------------------------------------------------------------------

code_104A:				
		cjne	R3, #0FEh, code_104F
		movx	A, @R1
		ret
; ---------------------------------------------------------------------------

code_104F:				
		mov	DPL, R1
		mov	DPH, R2
		clr	A
		movc	A, @A+DPTR
		ret
;  


; ======================================================


R3R2R1_GetACC_1056:				
		cjne	R3, #1,code_1065
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		movx	A, @DPTR
		ret
; ---------------------------------------------------------------------------

code_1065:				
		jnc	code_106D
		mov	A, R1
		add	A, DPL
		mov	R0, A
		mov	A, @R0
		ret
; ---------------------------------------------------------------------------

code_106D:				
		cjne	R3, #0FEh, code_1076
		mov	A, R1
		add	A, DPL
		mov	R0, A
		movx	A, @R0
		ret
; ---------------------------------------------------------------------------

code_1076:				
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		ret
;  


; ======================================================


code_1083:				
		cjne	R3, #1,	code_1095
		mov	R0, A
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		movx	A, @DPTR
		add	A, R0
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_1095:				
		jnc	code_10A0
		xch	A, DPL
		add	A, R1
		mov	R0, A
		mov	A, DPL
		add	A, @R0
		mov	@R0, A
		ret
; ---------------------------------------------------------------------------

code_10A0:				
		cjne	R3, #0FEh, code_10AC
		xch	A, DPL
		add	A, R1
		mov	R0, A
		movx	A, @R0
		add	A, DPL
		movx	@R0, A
		ret
; ---------------------------------------------------------------------------

code_10AC:				
		mov	R0, A
		mov	A, R2
		add	A, DPH
		mov	DPH, A
		mov	A, R1
		movc	A, @A+DPTR
		add	A, R0
		ret
;  code_1083


; ======================================================


WriteACC_ToR3R2R1_10B6:				
		cjne	R3, #1,code_10BF
		mov	DPL, R1
		mov	DPH, R2
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_10BF:				
		jnc	code_10C3
		mov	@R1, A
		ret
; ---------------------------------------------------------------------------

code_10C3:				
		cjne	R3, #0FEh, code_10C7
		movx	@R1, A

code_10C7:				
		ret
;  WriteACC_ToR3R2R1_10B6


; ======================================================


code_10C8:				
		mov	R0, A
		cjne	R3, #1,	code_10D9
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		mov	A, R0
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_10D9:				
		jnc	code_10E1
		mov	A, R1
		add	A, DPL
		xch	A, R0
		mov	@R0, A
		ret
; ---------------------------------------------------------------------------

code_10E1:				
		cjne	R3, #0FEh, code_10E9
		mov	A, R1
		add	A, DPL
		xch	A, R0
		movx	@R0, A

code_10E9:				
		ret
;  code_10C8


; ======================================================


code_10EA:				
		mov	A, R7
		mov	B, R5
		mul	AB
		mov	R0, B
		xch	A, R7
		mov	B, R4
		mul	AB
		add	A, R0
		xch	A, R6
		mov	B, R5
		mul	AB
		add	A, R6
		mov	R6, A
		ret
;  code_10EA


; ======================================================


DIV_10FC:				
		cjne	R4, #0,	code_110A
		cjne	R6, #0,	code_112B
		mov	A, R7
		mov	B, R5
		div	AB
		mov	R7, A
		mov	R5, B
		ret
; ---------------------------------------------------------------------------

code_110A:				
		clr	A
		xch	A, R4
		mov	R0, A
		mov	B, #8

code_1110:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R4
		rlc	A
		mov	R4, A
		mov	A, R6
		subb	A, R5
		mov	A, R4
		subb	A, R0
		jc	code_1124
		mov	R4, A
		mov	A, R6
		subb	A, R5
		mov	R6, A
		inc	R7

code_1124:				
		djnz	B, code_1110
		clr	A
		xch	A, R6
		mov	R5, A
		ret
; ---------------------------------------------------------------------------

code_112B:				
		mov	A, R5
		mov	R0, A
		mov	B, A
		mov	A, R6
		div	AB
		jb	PSW.2, code_1150
		mov	R6, A
		mov	R5, B
		mov	B, #8

code_113A:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R5
		rlc	A
		mov	R5, A
		jc	code_1149
		subb	A, R0
		jnc	code_114B
		djnz	B, code_113A
		ret
; ---------------------------------------------------------------------------

code_1149:				
		clr	C
		subb	A, R0

code_114B:				
		mov	R5, A
		inc	R7
		djnz	B, code_113A

code_1150:				
		ret
;  


; ======================================================


code_1151:				
		clr	PSW.5
		mov	A, R4
		jnb	ACC.7, code_1160
		cpl	PSW.5
		clr	A
		clr	C
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, R4
		mov	R4, A

code_1160:				
		mov	A, R6
		jnb	ACC.7, code_1179
		cpl	PSW.5
		clr	A
		clr	C
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A
		lcall	DIV_10FC
		clr	C
		clr	A
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, R4
		mov	R4, A
		sjmp	code_117C
; ---------------------------------------------------------------------------

code_1179:				
		lcall	DIV_10FC

code_117C:				
		jnb	PSW.5, code_1186
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A

code_1186:				
		ret
;  code_1151


; ======================================================


code_1187:				
		xch	A, B
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		add	A, R0
		movx	@DPTR, A
		xch	A, B
		mov	R0, A
		mov	A, DPL
		dec	DPL
		jnz	code_1199
		dec	DPH

code_1199:				
		movx	A, @DPTR
		addc	A, R0
		movx	@DPTR, A
		ret
;  code_1187


; ======================================================


code_119D:				
		cjne	R3, #1,	code_11AA
		mov	DPL, R1
		mov	DPH, R2
		movx	A, @DPTR
		mov	B, A
		inc	DPTR
		movx	A, @DPTR
		ret
; ---------------------------------------------------------------------------

code_11AA:				
		jnc	code_11B2
		mov	B, @R1
		inc	R1
		mov	A, @R1
		dec	R1
		ret
; ---------------------------------------------------------------------------

code_11B2:				
		cjne	R3, #0FEh, code_11BC
		movx	A, @R1
		mov	B, A
		inc	R1
		movx	A, @R1
		dec	R1
		ret
; ---------------------------------------------------------------------------

code_11BC:				
		mov	DPL, R1
		mov	DPH, R2
		clr	A
		movc	A, @A+DPTR
		mov	B, A
		mov	A, #1
		movc	A, @A+DPTR
		ret
;  code_119D


; ======================================================


code_11C8:				
		cjne	R3, #1,	code_11DB
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		movx	A, @DPTR
		mov	B, A
		inc	DPTR
		movx	A, @DPTR
		ret
; ---------------------------------------------------------------------------

code_11DB:				
		jnc	code_11E6
		mov	A, R1
		add	A, DPL
		mov	R0, A
		mov	B, @R0
		inc	R0
		mov	A, @R0
		ret
; ---------------------------------------------------------------------------

code_11E6:				
		cjne	R3, #0FEh, code_11F3
		mov	A, R1
		add	A, DPL
		mov	R0, A
		movx	A, @R0
		mov	B, A
		inc	R0
		movx	A, @R0
		ret
; ---------------------------------------------------------------------------

code_11F3:				
		mov	A, DPH
		add	A, R2
		mov	DPH, A
		mov	A, R1
		movc	A, @A+DPTR
		mov	B, A
		inc	DPTR
		mov	A, R1
		movc	A, @A+DPTR
		ret
;  code_11C8


; ======================================================


code_1200:				
		cjne	R3, #1,	code_120D
		mov	DPL, R1
		mov	DPH, R2
		movx	@DPTR, A
		mov	A, B
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_120D:				
		jnc	code_1215
		mov	@R1, A
		inc	R1
		mov	@R1, B
		dec	R1
		ret
; ---------------------------------------------------------------------------

code_1215:				
		cjne	R3, #0FEh, code_121E
		movx	@R1, A
		mov	A, B
		inc	R1
		movx	@R1, A
		dec	R1

code_121E:				
		ret
;  code_1200


; ======================================================


code_121F:				
		mov	R0, A
		cjne	R3, #1,	code_1234
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		mov	A, R0
		movx	@DPTR, A
		mov	A, B
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_1234:				
		jnc	code_123F
		mov	A, R1
		add	A, DPL
		xch	A, R0
		mov	@R0, A
		inc	R0
		mov	@R0, B
		ret
; ---------------------------------------------------------------------------

code_123F:				
		cjne	R3, #0FEh, code_124B
		mov	A, R1
		add	A, DPL
		xch	A, R0
		movx	@R0, A
		mov	A, B
		inc	R0
		movx	@R0, A

code_124B:				
		ret
;  code_121F


; ======================================================


code_124C:				
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R6
		addc	A, R2
		mov	R6, A
		mov	A, R5
		addc	A, R1
		mov	R5, A
		mov	A, R4
		addc	A, R0
		mov	R4, A
		ret
;  code_124C


; ======================================================


code_1259:				
		clr	C
		mov	A, R7
		subb	A, R3
		mov	R7, A
		mov	A, R6
		subb	A, R2
		mov	R6, A
		mov	A, R5
		subb	A, R1
		mov	R5, A
		mov	A, R4
		subb	A, R0
		mov	R4, A
		ret
;  code_1259


; ======================================================


code_1267:				
		mov	A, R0
		mov	B, R7
		mul	AB
		xch	A, R4
		mov	B, R3
		mul	AB
		add	A, R4
		mov	R4, A
		mov	A, R1
		mov	B, R6
		mul	AB
		add	A, R4
		mov	R4, A
		mov	B, R2
		mov	A, R5
		mul	AB
		add	A, R4
		mov	R4, A
		mov	A, R2
		mov	B, R6
		mul	AB
		xch	A, R5
		mov	R0, B
		mov	B, R3
		mul	AB
		add	A, R5
		xch	A, R4
		addc	A, R0
		add	A, B
		mov	R5, A
		mov	A, R1
		mov	B, R7
		mul	AB
		add	A, R4
		xch	A, R5
		addc	A, B
		mov	R4, A
		mov	A, R3
		mov	B, R6
		mul	AB
		mov	R6, A
		mov	R1, B
		mov	A, R3
		mov	B, R7
		mul	AB
		xch	A, R7
		xch	A, B
		add	A, R6
		xch	A, R5
		addc	A, R1
		mov	R6, A
		clr	A
		addc	A, R4
		mov	R4, A
		mov	A, R2
		mul	AB
		add	A, R5
		xch	A, R6
		addc	A, B
		mov	R5, A
		clr	A
		addc	A, R4
		mov	R4, A
		ret
;  code_1267


; ======================================================


code_12B6:				
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A
		clr	A
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, R4
		mov	R4, A
		ret
;  code_12B6


; ======================================================


code_12C4:				
		mov	A, R3
		subb	A, R7
		mov	B, A
		mov	A, R2
		subb	A, R6
		orl	B, A
		mov	A, R1
		subb	A, R5
		orl	B, A
		mov	A, R4
		xrl	A, #80h
		xch	A, R0
		xrl	A, #80h
		subb	A, R0
		orl	A, B
		ret
;  code_12C4


; ======================================================


code_12DA:				
		mov	A, R3
		subb	A, R7
		mov	B, A
		mov	A, R2
		subb	A, R6
		orl	B, A
		mov	A, R1
		subb	A, R5
		orl	B, A
		mov	A, R0
		subb	A, R4
		orl	A, B
		ret
;  code_12DA


; ======================================================


code_12EB:				
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_12EB


; ======================================================


code_12F7:				
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		inc	DPTR
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		ret
;  code_12F7


; ======================================================


code_1303:				
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_1303


; ======================================================


code_130F:				
		mov	R0, DPL
		mov	B, DPH
		pop	DPH
		pop	DPL
		lcall	code_1326
		lcall	code_1326
		lcall	code_1326
		lcall	code_1326
		clr	A
		jmp	@A+DPTR
;  code_130F


; ======================================================


code_1326:				
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		xch	A, DPH
		xch	A, B
		xch	A, DPH
		xch	A, R0
		xch	A, DPL
		xch	A, R0
		movx	@DPTR, A
		inc	DPTR
		xch	A, DPH
		xch	A, B
		xch	A, DPH
		xch	A, R0
		xch	A, DPL
		xch	A, R0
		ret
;  code_1326


; ======================================================


code_1340:				
		mul	AB
		add	A, DPL
		mov	DPL, A
		mov	A, B
		addc	A, DPH
		mov	DPH, A
		ret
;  code_1340


; ======================================================


code_134C:				
		mov	R2, A
		mov	A, @R0
		mov	R3, A
		inc	R0
		inc	R0
		mov	A, @R0
		mov	R1, A
		add	A, B
		mov	@R0, A
		dec	R0
		mov	A, @R0
		xch	A, R2
		addc	A, R2
		mov	@R0, A
		ret
;  code_134C


; ======================================================


code_135C:				
		movx	A, @DPTR
		mov	R3, A
		inc	DPTR
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		ret
;  code_135C


; ======================================================


code_1365:				
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, R2
		movx	@DPTR, A
		inc	DPTR
		mov	A, R1
		movx	@DPTR, A
		ret
;  code_1365


; ======================================================


code_136E:				
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R2, A
		mov	A, #2
		movc	A, @A+DPTR
		mov	R1, A
		ret
;  code_136E


; ======================================================


code_137A:				

 
		cjne	R3, #1,	code_138A
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		ljmp	code_135C
; ---------------------------------------------------------------------------

code_138A:				
		jnc	code_1393
		mov	A, R1
		add	A, DPL
		mov	R0, A
		ljmp	code_14CB
; ---------------------------------------------------------------------------

code_1393:				
		cjne	R3, #0FEh, code_139D
		mov	A, R1
		add	A, DPL
		mov	R0, A
		ljmp	code_14D4
; ---------------------------------------------------------------------------

code_139D:				
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		ljmp	code_136E
;  code_137A


; ======================================================


switch_13AA:				
		pop	DPH
		pop	DPL
		mov	R0, A

code_13AF:				
		clr	A
		movc	A, @A+DPTR
		jnz	code_13C5
		mov	A, #1
		movc	A, @A+DPTR
		jnz	code_13C5
		inc	DPTR
		inc	DPTR

code_13BA:				
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	DPL, A
		mov	DPH, R0
		clr	A
		jmp	@A+DPTR
; ---------------------------------------------------------------------------

code_13C5:				
		mov	A, #2
		movc	A, @A+DPTR
		xrl	A, R0
		jz	code_13BA
		inc	DPTR
		inc	DPTR
		inc	DPTR
		sjmp	code_13AF
;  switch_13AA


; ======================================================


nextFour_13D0:				
		pop	DPH
		pop	DPL
		mov	R0, A

code_13D5:				
		clr	A
		movc	A, @A+DPTR
		jnz	code_13EB
		mov	A, #1
		movc	A, @A+DPTR
		jnz	code_13EB
		inc	DPTR
		inc	DPTR

code_13E0:				
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	DPL, A
		mov	DPH, R0
		clr	A
		jmp	@A+DPTR
; ---------------------------------------------------------------------------

code_13EB:				
		mov	A, #2
		movc	A, @A+DPTR
		cjne	A, B, code_13F7
		mov	A, #3
		movc	A, @A+DPTR
		xrl	A, R0
		jz	code_13E0

code_13F7:				
		inc	DPTR
		inc	DPTR
		inc	DPTR
		inc	DPTR
		sjmp	code_13D5
;  nextFour_13D0

; ---------------------------------------------------------------------------
 
code_13FD:				
		mov	B, #8
		mov	DPL, #0

code_1403:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		xch	A, R5
		rlc	A
		xch	A, R5
		xch	A, R4
		rlc	A
		xch	A, R4
		xch	A, DPL
		rlc	A
		xch	A, DPL
		subb	A, R3
		mov	A, R5
		subb	A, R2
		mov	A, R4
		subb	A, R1
		mov	A, DPL
		subb	A, R0
		jc	code_142A
		mov	DPL, A
		mov	A, R6
		subb	A, R3
		mov	R6, A
		mov	A, R5
		subb	A, R2
		mov	R5, A
		mov	A, R4
		subb	A, R1
		mov	R4, A
		inc	R7

code_142A:				
		djnz	B, code_1403
		clr	A
		xch	A, R6
		mov	R3, A
		clr	A
		xch	A, R5
		mov	R2, A
		clr	A
		xch	A, R4
		mov	R1, A
		mov	R0, DPL
		ret
;  CHUNK	FOR code_1439

; ======================================================


code_1439:				

 
		cjne	R0, #0,	code_13FD
		cjne	R1, #0,	code_1498
		cjne	R2, #0,	code_146F
		mov	A, R4
		mov	B, R3
		div	AB
		xch	A, R7
		xch	A, R6
		xch	A, R5
		mov	R4, A
		mov	A, B
		xch	A, R3
		mov	R1, A
		mov	R0, #18h

code_1450:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A
		mov	A, R4
		rlc	A
		mov	R4, A
		mov	A, R3
		rlc	A
		mov	R3, A
		jbc	PSW.7, code_1465
		subb	A, R1
		jc	code_1469

code_1465:				
		mov	A, R3
		subb	A, R1
		mov	R3, A
		inc	R7

code_1469:				
		djnz	R0, code_1450
		clr	A
		mov	R1, A
		mov	R2, A
		ret
; ---------------------------------------------------------------------------

code_146F:				
		mov	R0, #18h

code_1471:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A
		mov	A, R4
		rlc	A
		mov	R4, A
		xch	A, R1
		rlc	A
		xch	A, R1
		jbc	PSW.7, code_1488
		subb	A, R3
		mov	A, R1
		subb	A, R2
		jc	code_148F

code_1488:				
		mov	A, R4
		subb	A, R3
		mov	R4, A
		mov	A, R1
		subb	A, R2
		mov	R1, A
		inc	R7

code_148F:				
		djnz	R0, code_1471
		clr	A
		xch	A, R1
		mov	R2, A
		clr	A
		xch	A, R4
		mov	R3, A
		ret
; ---------------------------------------------------------------------------

code_1498:				
		mov	B, #10h

code_149B:				
		mov	A, R7
		add	A, R7
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	A, R5
		rlc	A
		mov	R5, A
		xch	A, R4
		rlc	A
		xch	A, R4
		xch	A, R0
		rlc	A
		xch	A, R0
		jbc	PSW.7, code_14B4
		subb	A, R3
		mov	A, R4
		subb	A, R2
		mov	A, R0
		subb	A, R1
		jc	code_14BE

code_14B4:				
		mov	A, R5
		subb	A, R3
		mov	R5, A
		mov	A, R4
		subb	A, R2
		mov	R4, A
		mov	A, R0
		subb	A, R1
		mov	R0, A
		inc	R7

code_14BE:				
		djnz	B, code_149B
		clr	A
		xch	A, R5
		mov	R3, A
		clr	A
		xch	A, R4
		mov	R2, A
		clr	A
		xch	A, R0
		mov	R1, A
		ret
;  code_1439

; ---------------------------------------------------------------------------
 
code_14CB:				
		mov	A, @R0
		mov	R3, A
		inc	R0
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R1, A
		ret
; ---------------------------------------------------------------------------

code_14D4:				
		movx	A, @R0
		mov	R3, A
		inc	R0
		movx	A, @R0
		mov	R2, A
		inc	R0
		movx	A, @R0
		mov	R1, A
		ret
;  CHUNK	FOR code_137A

; ======================================================


code_14DD:				
		lcall	code_AD1F
		mov	DPTR, #269h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #0
		jc	code_14F1
		setb	C
		sjmp	code_14F2
; ---------------------------------------------------------------------------

code_14F1:				
		clr	C

code_14F2:				
		jc	code_151C
		lcall	code_6472
		mov	A, R7
		jnz	code_14FD
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_14FD:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_1508
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1508:				
		mov	DPTR, #169h
		movx	A, @DPTR
		jz	code_1511
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1511:				
		lcall	code_BECF
		mov	R7, #1
		lcall	code_95B2
		lcall	code_909C

code_151C:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #1
		jc	code_1528
		setb	C
		sjmp	code_1529
; ---------------------------------------------------------------------------

code_1528:				
		clr	C

code_1529:				
		jc	code_155C
		mov	R7, #1
		lcall	code_26
		mov	A, R7
		jnz	code_1536
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1536:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_1541
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1541:				
		mov	R7, #1
		lcall	code_7CEA
		mov	DPTR, #269h
		movx	A, @DPTR
		setb	C
		subb	A, #1
		jc	code_1556
		mov	R7, #2
		lcall	code_95B2
		sjmp	code_1559
; ---------------------------------------------------------------------------

code_1556:				
		lcall	code_CCB4

code_1559:				
		lcall	code_909C

code_155C:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #2
		jc	code_1568
		setb	C
		sjmp	code_1569
; ---------------------------------------------------------------------------

code_1568:				
		clr	C

code_1569:				
		jc	code_15A9
		mov	DPTR, #269h
		movx	A, @DPTR
		subb	A, #2
		jnc	code_1578
		lcall	code_CCB4
		sjmp	code_15A9
; ---------------------------------------------------------------------------

code_1578:				
		mov	R7, #2
		lcall	code_26
		mov	A, R7
		jnz	code_1583
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1583:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_158E
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_158E:				
		mov	R7, #2
		lcall	code_7CEA
		mov	DPTR, #269h
		movx	A, @DPTR
		setb	C
		subb	A, #2
		jc	code_15A3
		mov	R7, #3
		lcall	code_95B2
		sjmp	code_15A6
; ---------------------------------------------------------------------------

code_15A3:				
		lcall	code_CCB4

code_15A6:				
		lcall	code_909C

code_15A9:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #3
		jc	code_15B5
		setb	C
		sjmp	code_15B6
; ---------------------------------------------------------------------------

code_15B5:				
		clr	C

code_15B6:				
		jc	code_15F6
		lcall	code_AD1F
		mov	A, R7
		subb	A, #3
		jnc	code_15C5
		lcall	code_CCB4
		sjmp	code_15F6
; ---------------------------------------------------------------------------

code_15C5:				
		mov	R7, #3
		lcall	code_26
		mov	A, R7
		jnz	code_15D0
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_15D0:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_15DB
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_15DB:				
		mov	R7, #3
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #3
		jc	code_15F0
		mov	R7, #4
		lcall	code_95B2
		sjmp	code_15F3
; ---------------------------------------------------------------------------

code_15F0:				
		lcall	code_CCB4

code_15F3:				
		lcall	code_909C

code_15F6:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #4
		jc	code_1602
		setb	C
		sjmp	code_1603
; ---------------------------------------------------------------------------

code_1602:				
		clr	C

code_1603:				
		jc	code_1643
		lcall	code_AD1F
		mov	A, R7
		subb	A, #4
		jnc	code_1612
		lcall	code_CCB4
		sjmp	code_1643
; ---------------------------------------------------------------------------

code_1612:				
		mov	R7, #4
		lcall	code_26
		mov	A, R7
		jnz	code_161D
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_161D:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_1628
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1628:				
		mov	R7, #4
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #4
		jc	code_163D
		mov	R7, #5
		lcall	code_95B2
		sjmp	code_1640
; ---------------------------------------------------------------------------

code_163D:				
		lcall	code_CCB4

code_1640:				
		lcall	code_909C

code_1643:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #5
		jc	code_164F
		setb	C
		sjmp	code_1650
; ---------------------------------------------------------------------------

code_164F:				
		clr	C

code_1650:				
		jc	code_1690
		lcall	code_AD1F
		mov	A, R7
		subb	A, #5
		jnc	code_165F
		lcall	code_CCB4
		sjmp	code_1690
; ---------------------------------------------------------------------------

code_165F:				
		mov	R7, #5
		lcall	code_26
		mov	A, R7
		jnz	code_166A
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_166A:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_1675
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1675:				
		mov	R7, #5
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #5
		jc	code_168A
		mov	R7, #6
		lcall	code_95B2
		sjmp	code_168D
; ---------------------------------------------------------------------------

code_168A:				
		lcall	code_CCB4

code_168D:				
		lcall	code_909C

code_1690:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #6
		jc	code_169C
		setb	C
		sjmp	code_169D
; ---------------------------------------------------------------------------

code_169C:				
		clr	C

code_169D:				
		jc	code_16DD
		lcall	code_AD1F
		mov	A, R7
		subb	A, #6
		jnc	code_16AC
		lcall	code_CCB4
		sjmp	code_16DD
; ---------------------------------------------------------------------------

code_16AC:				
		mov	R7, #6
		lcall	code_26
		mov	A, R7
		jnz	code_16B7
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_16B7:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_16C2
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_16C2:				
		mov	R7, #6
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #6
		jc	code_16D7
		mov	R7, #7
		lcall	code_95B2
		sjmp	code_16DA
; ---------------------------------------------------------------------------

code_16D7:				
		lcall	code_CCB4

code_16DA:				
		lcall	code_909C

code_16DD:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #7
		jc	code_16E9
		setb	C
		sjmp	code_16EA
; ---------------------------------------------------------------------------

code_16E9:				
		clr	C

code_16EA:				
		jc	code_172A
		lcall	code_AD1F
		mov	A, R7
		subb	A, #7
		jnc	code_16F9
		lcall	code_CCB4
		sjmp	code_172A
; ---------------------------------------------------------------------------

code_16F9:				
		mov	R7, #7
		lcall	code_26
		mov	A, R7
		jnz	code_1704
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1704:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_170F
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_170F:				
		mov	R7, #7
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #7
		jc	code_1724
		mov	R7, #8
		lcall	code_95B2
		sjmp	code_1727
; ---------------------------------------------------------------------------

code_1724:				
		lcall	code_CCB4

code_1727:				
		lcall	code_909C

code_172A:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #8
		jc	code_1736
		setb	C
		sjmp	code_1737
; ---------------------------------------------------------------------------

code_1736:				
		clr	C

code_1737:				
		jc	code_1777
		lcall	code_AD1F
		mov	A, R7
		subb	A, #8
		jnc	code_1746
		lcall	code_CCB4
		sjmp	code_1777
; ---------------------------------------------------------------------------

code_1746:				
		mov	R7, #8
		lcall	code_26
		mov	A, R7
		jnz	code_1751
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_1751:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_175C
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_175C:				
		mov	R7, #8
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #8
		jc	code_1771
		mov	R7, #9
		lcall	code_95B2
		sjmp	code_1774
; ---------------------------------------------------------------------------

code_1771:				
		lcall	code_CCB4

code_1774:				
		lcall	code_909C

code_1777:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #9
		jc	code_1783
		setb	C
		sjmp	code_1784
; ---------------------------------------------------------------------------

code_1783:				
		clr	C

code_1784:				
		jc	code_17C4
		lcall	code_AD1F
		mov	A, R7
		subb	A, #9
		jnc	code_1793
		lcall	code_CCB4
		sjmp	code_17C4
; ---------------------------------------------------------------------------

code_1793:				
		mov	R7, #9
		lcall	code_26
		mov	A, R7
		jnz	code_179E
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_179E:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_17A9
		ljmp	code_1835
; ---------------------------------------------------------------------------

code_17A9:				
		mov	R7, #9
		lcall	code_7CEA
		lcall	code_AD1F
		mov	A, R7
		setb	C
		subb	A, #9
		jc	code_17BE
		mov	R7, #0Ah
		lcall	code_95B2
		sjmp	code_17C1
; ---------------------------------------------------------------------------

code_17BE:				
		lcall	code_CCB4

code_17C1:				
		lcall	code_909C

code_17C4:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #0Ah
		jc	code_17D0
		setb	C
		sjmp	code_17D1
; ---------------------------------------------------------------------------

code_17D0:				
		clr	C

code_17D1:				
		jc	code_17EA
		lcall	code_4F85
		mov	A, R7
		jz	code_1835
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_1835
		lcall	code_CE03
		lcall	code_A763
		lcall	code_909C

code_17EA:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #0Bh
		jc	code_17F6
		setb	C
		sjmp	code_17F7
; ---------------------------------------------------------------------------

code_17F6:				
		clr	C

code_17F7:				
		jc	code_1810
		lcall	code_48F6
		mov	A, R7
		jz	code_1835
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_1835
		lcall	code_BC15
		lcall	code_CE76
		lcall	code_909C

code_1810:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #0Ch
		jc	code_181C
		setb	C
		sjmp	code_181D
; ---------------------------------------------------------------------------

code_181C:				
		clr	C

code_181D:				
		jc	code_1835
		lcall	code_7363
		mov	A, R7
		jz	code_1835
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_1835
		lcall	nullsub_4
		lcall	code_CEB8
		lcall	code_909C

code_1835:				
		ret
;  code_14DD


; ======================================================


code_1836:				
		mov	RAM_10,	R3
		mov	RAM_11,	R2
		mov	RAM_12,	R1
		mov	DPTR, #6
		lcall	R3R2R1_GetACC_1056
		jnz	code_1847
		ljmp	code_1B4E
; ---------------------------------------------------------------------------

code_1847:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		jnz	code_1867
		mov	DPTR, #7
		mov	B, A
		lcall	code_121F
		mov	DPTR, #6
		clr	A
		lcall	code_10C8
		ljmp	code_1B4E
; ---------------------------------------------------------------------------

code_1867:				
		clr	A
		mov	DPTR, #278h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #274h
		movx	@DPTR, A

code_1872:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		dec	A
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jc	code_188C
		ljmp	code_1939
; ---------------------------------------------------------------------------

code_188C:				
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		mov	A, R6
		add	A, R5
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R7, RAM_5
		mov	DPTR, #273h
		mov	A, R7
		movx	@DPTR, A
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R7, RAM_5
		mov	DPTR, #27Ah
		mov	A, R7
		movx	@DPTR, A
		mov	A, R1
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, R2
		mov	R2, A
		mov	B, #2
		mov	A, R7
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, RAM_12
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_11
		mov	R2, A
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	R4, B
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jnc	code_1900
		mov	DPTR, #279h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_1900:				
		mov	R3, RAM_10
		mov	A, RAM_12
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_11
		mov	R2, A
		mov	DPTR, #27Ah
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		setb	C
		mov	A, R5
		subb	A, R7
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_1930
		mov	DPTR, #278h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_1930:				
		mov	DPTR, #274h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_1872
; ---------------------------------------------------------------------------

code_1939:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		setb	C
		subb	A, #2
		jc	code_1965
		mov	A, R7
		rrc	A
		mov	R7, A
		mov	DPTR, #279h
		movx	A, @DPTR
		mov	R6, A
		mov	DPTR, #278h
		movx	A, @DPTR
		clr	C
		subb	A, R6
		mov	R6, A
		clr	C
		mov	A, R7
		xrl	A, #80h
		mov	R0, A
		mov	A, R6
		xrl	A, #80h
		subb	A, R0
		jnc	code_1987

code_1965:				
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		clr	C
		rrc	A
		cpl	A
		inc	A
		mov	R7, A
		mov	DPTR, #279h
		movx	A, @DPTR
		mov	R6, A
		mov	DPTR, #278h
		movx	A, @DPTR
		clr	C
		subb	A, R6
		mov	R6, A
		setb	C
		mov	A, R7
		xrl	A, #80h
		mov	R0, A
		mov	A, R6
		xrl	A, #80h
		subb	A, R0
		jnc	code_198F

code_1987:				
		mov	DPTR, #277h
		mov	A, #1
		movx	@DPTR, A
		sjmp	code_1994
; ---------------------------------------------------------------------------

code_198F:				
		clr	A
		mov	DPTR, #277h
		movx	@DPTR, A

code_1994:				
		mov	DPTR, #26Fh
		lcall	code_130F
		nop
		nop
		nop
		nop
		mov	DPTR, #277h
		movx	A, @DPTR
		mov	DPTR, #275h
		jz	code_19AC
		mov	A, #0Ah
		movx	@DPTR, A
		sjmp	code_19AF
; ---------------------------------------------------------------------------

code_19AC:				
		mov	A, #1
		movx	@DPTR, A

code_19AF:				
		clr	A
		mov	DPTR, #276h
		movx	@DPTR, A
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		clr	C
		subb	A, #3
		jnc	code_19C2
		ljmp	code_1A7F
; ---------------------------------------------------------------------------

code_19C2:				
		clr	A
		mov	DPTR, #274h
		movx	@DPTR, A

code_19C7:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jc	code_19E0
		ljmp	code_1B25
; ---------------------------------------------------------------------------

code_19E0:				
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		mov	A, R6
		add	A, R5
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R7, RAM_5
		mov	DPTR, #273h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #3
		lcall	R3R2R1_GetACC_1056
		xrl	A, R7
		jz	code_1A76
		mov	DPTR, #4
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #273h
		movx	A, @DPTR
		xrl	A, R7
		jz	code_1A76
		mov	DPTR, #26Fh
		lcall	code_12F7
		push	RAM_0
		push	RAM_1
		push	RAM_2
		push	RAM_3
		mov	R3, RAM_10
		mov	A, RAM_12
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_11
		mov	R2, A
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R6, B
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R4, A
		mov	R5, A
		mov	R6, A
		lcall	code_1267
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_124C
		mov	DPTR, #26Fh
		lcall	code_1303
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		add	A, R7
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		jz	code_1A76
		mov	DPTR, #275h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_1A76:				
		mov	DPTR, #274h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_19C7
; ---------------------------------------------------------------------------

code_1A7F:				
		clr	A
		mov	DPTR, #274h
		movx	@DPTR, A

code_1A84:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jc	code_1A9C
		ljmp	code_1B25
; ---------------------------------------------------------------------------

code_1A9C:				
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #273h
		mov	A, R5
		movx	@DPTR, A
		mov	DPTR, #26Fh
		lcall	code_12F7
		push	RAM_0
		push	RAM_1
		push	RAM_2
		push	RAM_3
		mov	R3, RAM_10
		mov	A, RAM_12
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_11
		mov	R2, A
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R6, B
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R4, A
		mov	R5, A
		mov	R6, A
		lcall	code_1267
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_124C
		mov	DPTR, #26Fh
		lcall	code_1303
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		add	A, R7
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		jz	code_1B1C
		mov	DPTR, #275h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_1B1C:				
		mov	DPTR, #274h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_1A84
; ---------------------------------------------------------------------------

code_1B25:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, A
		clr	A
		mov	R2, A
		mov	R1, A
		mov	R0, A
		mov	DPTR, #26Fh
		lcall	code_12EB
		lcall	code_A4D3
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #7
		mov	A, R6
		mov	B, R7
		lcall	code_121F
		mov	DPTR, #6
		clr	A
		lcall	code_10C8

code_1B4E:				
		mov	DPTR, #7
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		ret
;  code_1836

; ---------------------------------------------------------------------------

code_1B58:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	DPTR, #138h
		movx	A, @DPTR
		jnz	code_1B6B
		ljmp	code_1D58
; ---------------------------------------------------------------------------

code_1B6B:				
		mov	DPTR, #96h
		movx	A, @DPTR
		jnz	code_1B74
		ljmp	code_1CA3
; ---------------------------------------------------------------------------

code_1B74:				
		mov	A, RAM_14
		xrl	A, #2
		jnz	code_1B7E
		mov	A, RAM_13
		xrl	A, #2

code_1B7E:				
		jz	code_1B98
		mov	A, RAM_14
		xrl	A, #4
		jnz	code_1B8A
		mov	A, RAM_13
		xrl	A, #2

code_1B8A:				
		jz	code_1B98
		mov	A, RAM_14
		xrl	A, #8
		jnz	code_1B96
		mov	A, RAM_13
		xrl	A, #2

code_1B96:				
		jnz	code_1BD0

code_1B98:				
		mov	A, RAM_14
		cjne	A, #2, code_1BA9
		mov	A, RAM_13
		cjne	A, #2, code_1BA9
		mov	R7, #1
		lcall	code_CE8B
		sjmp	code_1BD5
; ---------------------------------------------------------------------------

code_1BA9:				
		mov	A, RAM_14
		cjne	A, #4, code_1BBA
		mov	A, RAM_13
		cjne	A, #2, code_1BBA
		mov	R7, #1
		lcall	code_CDCA
		sjmp	code_1BC9
; ---------------------------------------------------------------------------

code_1BBA:				
		mov	A, RAM_14
		cjne	A, #8, code_1BDA
		mov	A, RAM_13
		cjne	A, #2, code_1BDA
		mov	R7, #1
		lcall	code_CE8B

code_1BC9:				
		mov	R7, #2
		lcall	code_CE8B
		sjmp	code_1BDA
; ---------------------------------------------------------------------------

code_1BD0:				
		mov	R7, #1
		lcall	code_CDCA

code_1BD5:				
		mov	R7, #2
		lcall	code_CDCA

code_1BDA:				
		mov	A, RAM_14
		xrl	A, #20h
		jnz	I2C_Start_1BE4
		mov	A, RAM_13
		xrl	A, #2

I2C_Start_1BE4:				
		jz	code_1BFE
		mov	A, RAM_14
		xrl	A, #40h
		jnz	code_1BF0
		mov	A, RAM_13
		xrl	A, #2

code_1BF0:				
		jz	code_1BFE
		mov	A, RAM_14
		xrl	A, #80h
		jnz	code_1BFC
		mov	A, RAM_13
		xrl	A, #2

code_1BFC:				
		jnz	I2C_Write_Byte_1C36

code_1BFE:				
		mov	A, RAM_14
		cjne	A, #20h, code_1C0F
		mov	A, RAM_13
		cjne	A, #2, code_1C0F
		mov	R7, #4
		lcall	code_CE8B
		sjmp	I2C_Write_Byte_1C3B
; ---------------------------------------------------------------------------

code_1C0F:				
		mov	A, RAM_14
		cjne	A, #40h, code_1C20
		mov	A, RAM_13
		cjne	A, #2, code_1C20
		mov	R7, #4
		lcall	code_CDCA
		sjmp	code_1C2F
; ---------------------------------------------------------------------------

code_1C20:				
		mov	A, RAM_14
		cjne	A, #80h, code_1C40
		mov	A, RAM_13
		cjne	A, #2, code_1C40
		mov	R7, #4
		lcall	code_CE8B

code_1C2F:				
		mov	R7, #8
		lcall	code_CE8B
		sjmp	code_1C40
; ---------------------------------------------------------------------------

I2C_Write_Byte_1C36:				
		mov	R7, #4
		lcall	code_CDCA

I2C_Write_Byte_1C3B:				
		mov	R7, #8
		lcall	code_CDCA

code_1C40:				
		mov	A, RAM_14
		jnz	code_1C48
		mov	A, RAM_13
		xrl	A, #0Ah

code_1C48:				
		jz	code_1C60
		mov	A, RAM_14
		jnz	code_1C52
		mov	A, RAM_13
		xrl	A, #3

code_1C52:				
		jz	code_1C60
		mov	A, RAM_14
		xrl	A, #10h
		jnz	code_1C5E
		mov	A, RAM_13
		xrl	A, #2

code_1C5E:				
		jnz	code_1C99

code_1C60:				
		clr	A
		cjne	A, RAM_14, code_1C70
		mov	A, RAM_13
		cjne	A, #0Ah, code_1C70
		mov	R7, #40h
		lcall	code_CE8B
		sjmp	code_1C9E
; ---------------------------------------------------------------------------

code_1C70:				
		clr	A
		cjne	A, RAM_14, code_1C80
		mov	A, RAM_13
		cjne	A, #3, code_1C80
		mov	R7, #40h
		lcall	code_CDCA
		sjmp	code_1C94
; ---------------------------------------------------------------------------

code_1C80:				
		mov	A, RAM_14
		xrl	A, #10h
		jnz	code_1C8A
		mov	A, RAM_13
		xrl	A, #2

code_1C8A:				
		jz	code_1C8F
		ljmp	code_1D58
; ---------------------------------------------------------------------------

code_1C8F:				
		mov	R7, #40h
		lcall	code_CE8B

code_1C94:				
		mov	R7, #80h
		ljmp	code_1D4E
; ---------------------------------------------------------------------------

code_1C99:				
		mov	R7, #40h
		lcall	code_CDCA

code_1C9E:				
		mov	R7, #80h
		ljmp	code_1D55
; ---------------------------------------------------------------------------

code_1CA3:				
		mov	A, RAM_14
		cjne	A, #2, code_1CB4
		mov	A, RAM_13
		cjne	A, #2, code_1CB4
		mov	R7, #1
		lcall	code_CE8B
		sjmp	code_1CB9
; ---------------------------------------------------------------------------

code_1CB4:				
		mov	R7, #1
		lcall	code_CDCA

code_1CB9:				
		mov	A, RAM_14
		cjne	A, #4, code_1CCA
		mov	A, RAM_13
		cjne	A, #2, code_1CCA
		mov	R7, #2
		lcall	code_CE8B
		sjmp	code_1CCF
; ---------------------------------------------------------------------------

code_1CCA:				
		mov	R7, #2
		lcall	code_CDCA

code_1CCF:				
		mov	A, RAM_14
		cjne	A, #8, code_1CE0
		mov	A, RAM_13
		cjne	A, #2, code_1CE0
		mov	R7, #4
		lcall	code_CE8B
		sjmp	code_1CE5
; ---------------------------------------------------------------------------

code_1CE0:				
		mov	R7, #4
		lcall	code_CDCA

code_1CE5:				
		mov	A, RAM_14
		cjne	A, #20h, code_1CF6
		mov	A, RAM_13
		cjne	A, #2, code_1CF6
		mov	R7, #8
		lcall	code_CE8B
		sjmp	code_1CFB
; ---------------------------------------------------------------------------

code_1CF6:				
		mov	R7, #8
		lcall	code_CDCA

code_1CFB:				
		mov	DPTR, #94h
		movx	A, @DPTR
		jz	code_1D2D
		mov	A, RAM_14
		cjne	A, #40h, code_1D12
		mov	A, RAM_13
		cjne	A, #2, code_1D12
		mov	R7, #40h
		lcall	code_CE8B
		sjmp	code_1D17
; ---------------------------------------------------------------------------

code_1D12:				
		mov	R7, #40h
		lcall	code_CDCA

code_1D17:				
		mov	A, RAM_14
		cjne	A, #80h, code_1D28
		mov	A, RAM_13
		cjne	A, #2, code_1D28
		mov	R7, #80h
		lcall	code_CE8B
		sjmp	code_1D2D
; ---------------------------------------------------------------------------

code_1D28:				
		mov	R7, #80h
		lcall	code_CDCA

code_1D2D:				
		clr	A
		cjne	A, RAM_14, code_1D3D
		mov	A, RAM_13
		cjne	A, #0Ah, code_1D3D
		mov	R7, #10h
		lcall	code_CE8B
		sjmp	code_1D42
; ---------------------------------------------------------------------------

code_1D3D:				
		mov	R7, #10h
		lcall	code_CDCA

code_1D42:				
		mov	A, RAM_14
		cjne	A, #10h, code_1D53
		mov	A, RAM_13
		cjne	A, #2, code_1D53
		mov	R7, #20h

code_1D4E:				
		lcall	code_CE8B
		sjmp	code_1D58
; ---------------------------------------------------------------------------

code_1D53:				
		mov	R7, #20h

code_1D55:				
		lcall	code_CDCA

code_1D58:				
		clr	A
		cjne	A, RAM_14, code_1D74
		mov	A, RAM_13
		cjne	A, #10h, code_1D74
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		xrl	A, #0Ah
		jz	code_1D71
		ljmp	code_1E33
; ---------------------------------------------------------------------------

code_1D71:				
		ljmp	code_BEEE
; ---------------------------------------------------------------------------

code_1D74:				
		clr	A
		cjne	A, RAM_14, code_1D9B
		mov	A, RAM_13
		cjne	A, #4, code_1D9B
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		xrl	A, #0Ah
		jz	code_1D8D
		ljmp	code_1E33
; ---------------------------------------------------------------------------

code_1D8D:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jz	code_1D98
		ljmp	code_1E33
; ---------------------------------------------------------------------------

code_1D98:				
		ljmp	code_C61C
; ---------------------------------------------------------------------------

code_1D9B:				
		clr	A
		cjne	A, RAM_14, code_1DC0
		mov	A, RAM_13
		cjne	A, #1, code_1DC0
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		xrl	A, #0Ah
		jz	code_1DB4
		ljmp	code_1E33
; ---------------------------------------------------------------------------

code_1DB4:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jnz	code_1E33
		mov	R7, A
		ljmp	code_B7E4
; ---------------------------------------------------------------------------

code_1DC0:				
		clr	A
		cjne	A, RAM_14, code_1DEA
		mov	A, RAM_13
		cjne	A, #80h, code_1DEA
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_1E33
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jnz	code_1E33
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_1DE4
		inc	DPTR
		movx	A, @DPTR

code_1DE4:				
		jz	code_1E33
		mov	R7, #14h
		sjmp	code_1E30
; ---------------------------------------------------------------------------

code_1DEA:				
		clr	A
		cjne	A, RAM_14, code_1E02
		mov	A, RAM_13
		cjne	A, #40h, code_1E02
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_1E33
		mov	R7, #28h
		sjmp	code_1E30
; ---------------------------------------------------------------------------

code_1E02:				
		clr	A
		cjne	A, RAM_14, code_1E1A
		mov	A, RAM_13
		cjne	A, #20h, code_1E1A
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_1E33
		mov	R7, #1Eh
		sjmp	code_1E30
; ---------------------------------------------------------------------------

code_1E1A:				
		clr	A
		cjne	A, RAM_14, code_1E33
		mov	A, RAM_13
		cjne	A, #22h, code_1E33
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_1E33
		mov	R7, #32h

code_1E30:				
		lcall	code_BBAC

code_1E33:				
		ret
; ---------------------------------------------------------------------------
		db    0
		db  77h
		db    6
		db    6
		db    0
		db  77h
		db    6
		db  5Bh
		db    0
		db  77h
		db    6
		db  4Fh
		db  77h
		db    6
		db    6
		db  5Eh

		db  0X77,0X06,0X5B,0X5E
	; 	db  0X77,0X07,0X5B,0X5E

		db  77h
		db    6
		db  4Fh
		db  5Eh
		db    0
		db  77h
		db  5Bh
		db    6
		db    0
		db  77h
		db  5Bh
		db  5Bh
		db    0
		db  77h
		db  5Bh
		db  4Fh
		db    0
		db  77h
		db  6Dh
		db    6
		db    0
		db  77h
		db  6Dh
		db  5Bh
		db    0
		db  77h
		db  6Dh
		db  4Fh
		db  77h
		db  39h
		db    6
		db    6
		db  77h
		db  39h
		db    6
		db  5Bh
		db  77h
		db  39h
		db    6
		db  4Fh
		db    0
		db  77h
		db  66h
		db    6
		db    0
		db  77h
		db  66h
		db  4Fh
		db    0
		db  77h
		db  7Dh
		db    6
		db    0
		db  77h
		db  7Dh
		db  5Bh
		db    0
		db  77h
		db  7Dh
		db  4Fh
		db  77h
		db  5Bh
		db    6
		db  73h
		db  77h
		db  5Bh
		db  5Bh
		db  73h
		db  77h
		db  5Bh
		db  4Fh
		db  73h
		db  77h
		db  5Bh
		db    6
		db  5Eh
		db  77h
		db  5Bh
		db  5Bh
		db  5Eh
		db  77h
		db  5Bh
		db  4Fh
		db  5Eh
		db  77h
		db  39h
		db    6
		db  5Eh
		db  77h
		db  39h
		db  5Bh
		db  5Eh
		db  77h
		db  39h
		db  4Fh
		db  5Eh
		db    0
		db    0
		db    0
		db  3Fh
		db    0
		db    0
		db    0
		db    6
		db    0
		db    0
		db    0
		db  5Bh
		db    0
		db    0
		db    0
		db  4Fh
		db    0
		db    0
		db    0
		db  6Dh
		db    0
		db  5Ch
		db  71h
		db  71h
		db    0
		db    0
		db  5Ch
		db  54h
		db  54h
		db  5Ch
		db  54h
		db  79h
		db    0
		db  38h
		db  5Ch
		db  1Ch
		db  76h
		db    4
		db  6Fh
		db  76h
		db  73h
		db  38h
		db  78h
		db    6
		db  78h
		db  5Bh
		db  78h
		db  4Fh
		db  78h
		db  66h
		db  73h
		db  73h
		db  71h
		db  3Eh
		db  79h
		db  3Fh
		db  39h
		db  54h
		db  54h
		db  54h
		db  73h
		db  78h
		db  73h
		db  5Ch
		db  58h
		db  77h
		db  73h
		db  50h
		db  7Ch
		db  38h
		db  50h
		db  5Ch
		db  50h
		db  71h
		db  39h
		db  5Ch
		db  71h
		db  78h
		db  71h
		db  5Eh
		db  5Eh
		db    0
		db  78h
		db  50h
		db  0Eh
		db  38h
		db  78h
		db  37h
		db  78h
		db  6Dh
		db 0FFh
		db  1Eh
		db 0A8h
		db 0FFh
		db  1Eh
		db 0ACh
		db 0FFh
		db  1Eh
		db 0B0h
		db 0FFh
		db  1Eh
		db 0B4h
		db 0FFh
		db  1Eh
		db 0A8h
		db 0FFh
		db  1Eh
		db 0ACh
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db 0FFh
		db  1Eh
		db 0A8h
		db 0FFh
		db  1Eh
		db 0ACh
		db 0FFh
		db  1Eh
		db 0A8h
		db 0FFh
		db  1Eh
		db 0ACh
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db 0FFh
		db  1Eh
		db 0ACh
		db 0FFh
		db  1Eh
		db 0B0h
		db 0FFh
		db  1Eh
		db 0B8h
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db    1
		db 0FFh
		db  1Eh
		db 0D0h
		db    3
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0D2h
		db    3
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0D4h
		db    3
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0D6h
		db    3
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0D8h
		db    3
		db    1
		db    0
		db    0
		db    0
		db    0
		db    2
		db 0FFh
		db  1Eh
		db 0DAh
		db    0
		db    0
		db 0FFh
		db  1Fh
		db    2
		db    4
		db    2
		db 0FFh
		db  1Eh
		db 0DCh
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  0Eh
		db    2
		db    2
		db 0FFh
		db  1Eh
		db 0DEh
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  14h
		db    2
		db    2
		db 0FFh
		db  1Eh
		db 0E0h
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  1Ah
		db    2
		db    1
		db 0FFh
		db  1Eh
		db 0E2h
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db 0FFh
		db  1Eh
		db 0E4h
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  20h
		db    2
		db    2
		db 0FFh
		db  1Eh
		db 0E6h
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  26h
		db    2
		db    1
		db 0FFh
		db  1Eh
		db 0E8h
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0EAh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0ECh
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0EEh
		db    2
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0F0h
		db    2
		db    1
		db    0
		db    0
		db    0
		db    0
		db    2
		db 0FFh
		db  1Eh
		db 0F2h
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  2Ch
		db    2
		db    1
		db 0FFh
		db  1Eh
		db 0F4h
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Eh
		db 0F6h
		db    2
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    2
		db 0FFh
		db  1Eh
		db 0F8h
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  32h
		db    3
		db    1
		db 0FFh
		db  1Eh
		db 0FAh
		db    4
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    2
		db 0FFh
		db  1Eh
		db 0FCh
		db    0
		db    0
		db 0FFh
		db  1Fh
		db  3Bh
		db    2
		db    1
		db 0FFh
		db  1Eh
		db 0FEh
		db    3
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db 0FFh
		db  1Fh
		db    0
		db    3
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    2
		db    3
		db    4
		db    5
		db    6
		db    7
		db    8
		db    9
		db  0Ah
		db  0Bh
		db  0Ch
		db  0Eh
		db  0Fh
		db  10h
		db  11h
		db  12h
		db  13h
		db  14h
		db  15h
		db  16h
		db    1
		db    2
		db    3
		db    4
		db    5
		db    6
		db    7
		db    8
		db    9
		db  0Ah
		db  0Bh
		db  0Ch
		db  0Dh
		db  0Eh
		db  0Fh
		db  10h
		db  11h
		db  12h
		db  13h
		db  14h
		db  15h
		db  16h
		db  17h
		db  18h
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db 0FFh
		db  1Eh
		db 0C4h
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h
		db 0FFh
		db  1Eh
		db 0BCh
		db 0FFh
		db  1Eh
		db 0C0h

; ======================================================


code_2084:				
		mov	DPTR, #29h
		movx	A, @DPTR
		anl	A, #7Bh
		jz	code_208E
		sjmp	code_20B2
; ---------------------------------------------------------------------------

code_208E:				
		mov	DPTR, #26h
		movx	A, @DPTR
		jnz	code_209A
		mov	DPTR, #5Eh
		movx	A, @DPTR
		jz	code_209C

code_209A:				
		sjmp	code_20B2
; ---------------------------------------------------------------------------

code_209C:				
		mov	DPTR, #13Ah
		movx	A, @DPTR
		xrl	A, #1
		jnz	code_20CE
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.3, code_20B5
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.3, code_20B5

code_20B2:				
		ljmp	code_C1AE
; ---------------------------------------------------------------------------

code_20B5:				
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.2, code_20FC
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.2, code_20FC
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_20F9
		lcall	code_B76C
		sjmp	code_20FC
; ---------------------------------------------------------------------------

code_20CE:				
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.3, code_20E5
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.3, code_20E5
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_20E5
		lcall	code_B76C

code_20E5:				
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.2, code_20FC
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.2, code_20FC
		mov	DPTR, #168h
		movx	A, @DPTR
		jnz	code_20FC

code_20F9:				
		lcall	code_C8BD

code_20FC:				
		lcall	code_14DD
		ret
;  code_2084

; ---------------------------------------------------------------------------
		db  0Fh
		db    9
		db  10h
		db    9
		db  14h
		db  2Bh
		db    5
		db    1
		db    0
		db    1
		db    1
		db    0
		db    3
		db 0FCh

; ======================================================


code_210E:				
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_211A
		mov	DPTR, #0B0h
		mov	A, R7
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_211A:				
		mov	DPTR, #96h
		movx	A, @DPTR
		jnz	code_2123
		ljmp	code_21BC
; ---------------------------------------------------------------------------

code_2123:				
		mov	A, R7
		lcall	switch_13AA
		ajmp	code_2146
; ---------------------------------------------------------------------------
		db    1
		db  21h
		db  51h
		db    2
		db  21h
		db  5Ch
		db    3				    
		db  21h
		db  6Ah
		db    4
		db  21h
		db  78h
		db    5
		db  21h
		db  86h
		db    6
		db  21h
		db  94h
		db    7
		db  21h
		db 0A5h
		db    8
		db  21h
		db 0ADh
		db    9
		db    0
		db    0
		db  22h
		db    0
; ---------------------------------------------------------------------------

code_2146:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		anl	A, #0FDh
		sjmp	code_2165
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		orl	A, #2
		sjmp	code_2165
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		orl	A, #2

code_2165:				
		movx	@DPTR, A
		anl	A, #0FBh
		sjmp	code_21A0
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		anl	A, #0FDh
		movx	@DPTR, A
		orl	A, #4
		sjmp	code_21A0
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		anl	A, #0FDh
		movx	@DPTR, A
		orl	A, #4
		sjmp	code_21A0
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		orl	A, #2
		movx	@DPTR, A
		orl	A, #4
		sjmp	code_21A0
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		orl	A, #2
		movx	@DPTR, A
		orl	A, #4

code_21A0:				
		movx	@DPTR, A
		anl	A, #0F7h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FEh
		sjmp	code_21B3
; ---------------------------------------------------------------------------
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1

code_21B3:				
		movx	@DPTR, A
		anl	A, #0FDh
		movx	@DPTR, A
		anl	A, #0FBh
		movx	@DPTR, A
		sjmp	code_21ED
; ---------------------------------------------------------------------------

code_21BC:				
		mov	A, R7
		add	A, #0FEh
		jz	code_21D9
		dec	A
		jz	code_21E1
		dec	A
		jz	code_21E9
		dec	A
		jz	code_21F1
		dec	A
		jz	code_21F9
		add	A, #5
		jnz	code_2200
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_21D9:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_21E1:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_21E9:				
		mov	DPTR, #0F2h
		movx	A, @DPTR

code_21ED:				
		orl	A, #8
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_21F1:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_21F9:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A

code_2200:				
		ret
;  code_210E


; ======================================================


code_2201:				
		clr	A
		mov	R6, A
		mov	R7, A
		ret
;  code_2201

; ---------------------------------------------------------------------------
		db  7Ah
		db  72h
		db  6Bh
		db    5
		db  6Eh
		db 0BFh
		db 0A6h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B6F1

code_220C:				
		mov	DPTR, #169h
		movx	A, @DPTR
		dec	A
		add	A, #0F7h
		jc	code_2218
		ljmp	code_22A3
; ---------------------------------------------------------------------------

code_2218:				
		jnz	code_221D
		ljmp	code_22DF
; ---------------------------------------------------------------------------

code_221D:				
		dec	A
		jnz	code_2223
		ljmp	code_22FF
; ---------------------------------------------------------------------------

code_2223:				
		add	A, #0Bh
		jz	code_222A
		ljmp	code_2428
; ---------------------------------------------------------------------------

code_222A:				
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_2232
		inc	DPTR
		movx	A, @DPTR

code_2232:				
		mov	DPTR, #167h
		jnz	code_226F
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		lcall	code_CA9F
		mov	A, R7
		orl	A, #80h
		mov	DPTR, #361h
		movx	@DPTR, A
		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R7, RAM_5
		lcall	code_CA9F
		mov	A, R7
		orl	A, #80h
		mov	DPTR, #362h
		movx	@DPTR, A
		ljmp	code_242F
; ---------------------------------------------------------------------------

code_226F:				
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		lcall	code_CA9F
		mov	DPTR, #361h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R7, RAM_5
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A
		ljmp	code_242F
; ---------------------------------------------------------------------------

code_22A3:				
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_22AB
		inc	DPTR
		movx	A, @DPTR

code_22AB:				
		mov	DPTR, #361h
		jnz	code_22C4
		mov	A, #0B8h
		movx	@DPTR, A
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F
		mov	A, R7
		orl	A, #80h
		mov	DPTR, #362h
		movx	@DPTR, A
		sjmp	code_22D4
; ---------------------------------------------------------------------------

code_22C4:				
		mov	A, #38h
		movx	@DPTR, A
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A

code_22D4:				
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_B794
		ljmp	code_2432
; ---------------------------------------------------------------------------

code_22DF:				
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_22E7
		inc	DPTR
		movx	A, @DPTR

code_22E7:				
		mov	DPTR, #361h
		jnz	code_22F5
		mov	A, #0F1h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0B8h
		movx	@DPTR, A
		sjmp	code_22FC
; ---------------------------------------------------------------------------

code_22F5:				
		mov	A, #71h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #38h
		movx	@DPTR, A

code_22FC:				
		ljmp	code_242F
; ---------------------------------------------------------------------------

code_22FF:				
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_2307
		inc	DPTR
		movx	A, @DPTR

code_2307:				
		jz	code_230C
		ljmp	code_239F
; ---------------------------------------------------------------------------

code_230C:				
		mov	DPTR, #1A1h
		movx	A, @DPTR
		cjne	A, #1, code_2352
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_2332
		dec	A
		jz	code_233A
		dec	A
		jz	code_2342
		dec	A
		jz	code_234A
		dec	A
		jz	code_232A
		add	A, #5
		jnz	code_2372

code_232A:				
		mov	DPTR, #361h
		mov	A, #0F1h
		movx	@DPTR, A
		sjmp	code_2372
; ---------------------------------------------------------------------------

code_2332:				
		mov	DPTR, #361h
		mov	A, #0D8h
		movx	@DPTR, A
		sjmp	code_2372
; ---------------------------------------------------------------------------

code_233A:				
		mov	DPTR, #361h
		mov	A, #88h
		movx	@DPTR, A
		sjmp	code_2372
; ---------------------------------------------------------------------------

code_2342:				
		mov	DPTR, #361h
		mov	A, #80h
		movx	@DPTR, A
		sjmp	code_2372
; ---------------------------------------------------------------------------

code_234A:				
		mov	DPTR, #361h
		mov	A, #0A1h
		movx	@DPTR, A
		sjmp	code_2372
; ---------------------------------------------------------------------------

code_2352:				
		mov	DPTR, #361h
		mov	A, #0F1h
		movx	@DPTR, A
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_237B
		dec	A
		jz	code_2384
		dec	A
		jz	code_238D
		dec	A
		jz	code_2396
		dec	A
		jz	code_2372
		add	A, #5
		jz	code_2372
		ljmp	code_2426
; ---------------------------------------------------------------------------

code_2372:				
		mov	DPTR, #362h
		mov	A, #0B8h
		movx	@DPTR, A
		ljmp	code_2426
; ---------------------------------------------------------------------------

code_237B:				
		mov	DPTR, #362h
		mov	A, #90h
		movx	@DPTR, A
		ljmp	code_2426
; ---------------------------------------------------------------------------

code_2384:				
		mov	DPTR, #362h
		mov	A, #80h
		movx	@DPTR, A
		ljmp	code_2426
; ---------------------------------------------------------------------------

code_238D:				
		mov	DPTR, #362h
		mov	A, #81h
		movx	@DPTR, A
		ljmp	code_2426
; ---------------------------------------------------------------------------

code_2396:				
		mov	DPTR, #362h
		mov	A, #0E0h
		movx	@DPTR, A
		ljmp	code_2426
; ---------------------------------------------------------------------------

code_239F:				
		mov	DPTR, #1A1h
		movx	A, @DPTR
		cjne	A, #1, code_23E4
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_23C5
		dec	A
		jz	code_23CD
		dec	A
		jz	code_23D5
		dec	A
		jz	code_23DC
		dec	A
		jz	code_23BD
		add	A, #5
		jnz	code_2401

code_23BD:				
		mov	DPTR, #361h
		mov	A, #71h
		movx	@DPTR, A
		sjmp	code_2401
; ---------------------------------------------------------------------------

code_23C5:				
		mov	DPTR, #361h
		mov	A, #58h
		movx	@DPTR, A
		sjmp	code_2401
; ---------------------------------------------------------------------------

code_23CD:				
		mov	DPTR, #361h
		mov	A, #8
		movx	@DPTR, A
		sjmp	code_2401
; ---------------------------------------------------------------------------

code_23D5:				
		clr	A
		mov	DPTR, #361h
		movx	@DPTR, A
		sjmp	code_2401
; ---------------------------------------------------------------------------

code_23DC:				
		mov	DPTR, #361h
		mov	A, #21h
		movx	@DPTR, A
		sjmp	code_2401
; ---------------------------------------------------------------------------

code_23E4:				
		mov	DPTR, #361h
		mov	A, #71h
		movx	@DPTR, A
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_2409
		dec	A
		jz	code_2411
		dec	A
		jz	code_2418
		dec	A
		jz	code_2420
		dec	A
		jz	code_2401
		add	A, #5
		jnz	code_2426

code_2401:				
		mov	DPTR, #362h
		mov	A, #38h
		movx	@DPTR, A
		sjmp	code_2426
; ---------------------------------------------------------------------------

code_2409:				
		mov	DPTR, #362h
		mov	A, #10h
		movx	@DPTR, A
		sjmp	code_2426
; ---------------------------------------------------------------------------

code_2411:				
		clr	A
		mov	DPTR, #362h
		movx	@DPTR, A
		sjmp	code_2426
; ---------------------------------------------------------------------------

code_2418:				
		mov	DPTR, #362h
		mov	A, #1
		movx	@DPTR, A
		sjmp	code_2426
; ---------------------------------------------------------------------------

code_2420:				
		mov	DPTR, #362h
		mov	A, #60h
		movx	@DPTR, A

code_2426:				
		sjmp	code_242F
; ---------------------------------------------------------------------------

code_2428:				
		clr	A
		mov	DPTR, #361h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_242F:				
		lcall	code_9A0E

code_2432:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_243F
		mov	DPTR, #36Dh
		mov	A, #1
		sjmp	code_2443
; ---------------------------------------------------------------------------

code_243F:				
		clr	A
		mov	DPTR, #36Dh

code_2443:				
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  CHUNK	FOR code_B6F1

; ======================================================


code_2447:				
		mov	DPTR, #34Eh
		movx	A, @DPTR
		setb	C
		subb	A, #4
		jnc	code_2453
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2453:				
		mov	DPTR, #31Ch
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CD7A
		mov	A, R7
		jnz	code_2460
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_2460:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #1Ch
		mov	DPTR, #34Eh
		movx	A, @DPTR
		mov	R5, A
		lcall	code_B0C7
		mov	A, R7
		jnz	code_2473
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_2473:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C65A
		mov	A, R7
		jnz	code_2489
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #1
		movx	@DPTR, A
		mov	R3, A
		sjmp	code_24F0
; ---------------------------------------------------------------------------

code_2489:				
		mov	DPTR, #31Eh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		push	RAM_6
		push	RAM_7
		mov	DPTR, #31Dh
		movx	A, @DPTR
		cjne	A, #6, code_24A4
		mov	R4, #0
		mov	R5, #1
		sjmp	code_24AE
; ---------------------------------------------------------------------------

code_24A4:				
		mov	DPTR, #320h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R4, RAM_6

code_24AE:				
		pop	RAM_7
		pop	RAM_6
		lcall	code_BDAD
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		jz	code_24CF
		mov	DPTR, #31Dh
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	DPTR, #31Eh
		movx	@DPTR, A
		mov	R3, #1
		sjmp	code_24F0
; ---------------------------------------------------------------------------

code_24CF:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		xrl	A, #3
		jz	code_2509
		lcall	code_7B3C
		mov	DPTR, #270h
		mov	A, R7
		movx	@DPTR, A
		xrl	A, #1
		jz	code_2509
		mov	DPTR, #31Dh
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #4
		movx	@DPTR, A
		mov	R3, #1

code_24F0:				
		mov	R2, #3
		mov	R1, #1Ch
		mov	R5, #3
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #31Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #312h
		mov	A, #5
		ljmp	code_2670
; ---------------------------------------------------------------------------

code_2509:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		xrl	A, #3
		jz	code_2514
		ljmp	code_25AF
; ---------------------------------------------------------------------------

code_2514:				
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		mov	DPTR, #272h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #320h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		mov	DPTR, #274h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_253B:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		mov	R6, #0
		setb	C
		mov	DPTR, #275h
		movx	A, @DPTR
		subb	A, R7
		mov	DPTR, #274h
		movx	A, @DPTR
		subb	A, R6
		jc	code_257A
		mov	DPTR, #273h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		mov	DPTR, #272h
		movx	A, @DPTR
		addc	A, R6
		mov	R6, A
		lcall	code_2201
		mov	DPTR, #271h
		movx	A, @DPTR
		add	A, ACC
		add	A, #1Fh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_253B
; ---------------------------------------------------------------------------

code_257A:				
		mov	DPTR, #271h
		movx	A, @DPTR
		add	A, ACC
		mov	DPTR, #31Eh
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #1Ch
		movx	A, @DPTR
		add	A, #3
		mov	R5, A
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #31Eh
		movx	A, @DPTR
		add	A, #1Fh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #31Eh
		movx	A, @DPTR
		add	A, #5
		mov	DPTR, #312h
		ljmp	code_2670
; ---------------------------------------------------------------------------

code_25AF:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		xrl	A, #6
		jnz	code_25E3
		lcall	nullsub_8
		mov	DPTR, #31Eh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		push	RAM_6
		push	RAM_7
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R6
		mov	R4, A
		mov	A, R5
		pop	RAM_7
		pop	RAM_6
		lcall	code_CE68
		lcall	nullsub_9
		mov	DPTR, #312h
		mov	A, #8
		ljmp	code_2670
; ---------------------------------------------------------------------------

code_25E3:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		xrl	A, #10h
		jz	code_25EE
		ljmp	code_2674
; ---------------------------------------------------------------------------

code_25EE:				
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		mov	DPTR, #272h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	nullsub_8
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_2606:				
		mov	DPTR, #322h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R5, A
		clr	C
		subb	A, R7
		jnc	code_2655
		movx	A, @DPTR
		mov	R4, A
		clr	C
		rrc	A
		mov	R7, A
		mov	DPTR, #273h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		mov	DPTR, #272h
		movx	A, @DPTR
		addc	A, #0
		mov	R6, A
		push	RAM_6
		push	RAM_7
		mov	A, #23h
		add	A, R4
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		mov	A, #24h
		add	A, R5
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R5, A
		mov	A, R6
		mov	R4, A
		mov	A, R5
		pop	RAM_7
		pop	RAM_6
		lcall	code_CE68
		mov	DPTR, #271h
		movx	A, @DPTR
		add	A, #2
		movx	@DPTR, A
		sjmp	code_2606
; ---------------------------------------------------------------------------

code_2655:				
		lcall	nullsub_9
		mov	R3, #1
		mov	R2, #3
		mov	R1, #1Ch
		mov	R5, #6
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #322h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #312h
		mov	A, #8

code_2670:				
		movx	@DPTR, A
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_2674:				
		mov	R7, #0
		ret
;  code_2447


; ======================================================


code_2677:				
		mov	DPTR, #303h
		movx	A, @DPTR
		jnz	code_2690
		mov	DPTR, #361h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		mov	A, #79h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #50h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_2690:				
		mov	DPTR, #2EBh
		movx	A, @DPTR
		jnz	code_26CB
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_26A5
		mov	DPTR, #301h
		movx	A, @DPTR
		cpl	A
		jz	code_26CB

code_26A5:				
		mov	A, R7
		cjne	A, #0FFh, code_26AD
		mov	R7, #0
		sjmp	code_26B5
; ---------------------------------------------------------------------------

code_26AD:				
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F

code_26B5:				
		mov	DPTR, #361h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #301h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_26C6
		mov	R7, #0
		sjmp	code_2715
; ---------------------------------------------------------------------------

code_26C6:				
		lcall	code_CA9F
		sjmp	code_2715
; ---------------------------------------------------------------------------

code_26CB:				
		mov	DPTR, #303h
		movx	A, @DPTR
		cjne	A, #1, code_26E3
		mov	DPTR, #2ECh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_26DC
		sjmp	code_26F2
; ---------------------------------------------------------------------------

code_26DC:				
		mov	DPTR, #39Ch
		movx	A, @DPTR
		mov	R7, A
		sjmp	code_26F2
; ---------------------------------------------------------------------------

code_26E3:				
		mov	DPTR, #2F9h
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_26ED
		sjmp	code_26F2
; ---------------------------------------------------------------------------

code_26ED:				
		mov	DPTR, #39Fh
		movx	A, @DPTR
		mov	R7, A

code_26F2:				
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #361h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	R7, B
		lcall	code_CA9F

code_2715:				
		mov	A, R7
		orl	A, #80h
		mov	DPTR, #362h
		movx	@DPTR, A
		mov	DPTR, #2EBh
		movx	A, @DPTR
		mov	R7, A
		jnz	code_2727
		mov	R6, #1
		sjmp	code_2729
; ---------------------------------------------------------------------------

code_2727:				
		mov	R6, #0

code_2729:				
		mov	DPTR, #36Dh
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnz	code_2735
		mov	R7, #1
		sjmp	code_2737
; ---------------------------------------------------------------------------

code_2735:				
		mov	R7, #0

code_2737:				
		mov	DPTR, #36Eh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #2EBh
		movx	A, @DPTR
		xrl	A, #1
		jnz	code_2779
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_2753
		mov	DPTR, #301h
		movx	A, @DPTR
		cpl	A
		jz	code_2779

code_2753:				
		mov	A, R7
		cjne	A, #0FFh, code_275B
		mov	R7, #0
		sjmp	code_2763
; ---------------------------------------------------------------------------

code_275B:				
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F

code_2763:				
		mov	DPTR, #363h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #301h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_2774
		mov	R7, #0
		sjmp	code_27C3
; ---------------------------------------------------------------------------

code_2774:				
		lcall	code_CA9F
		sjmp	code_27C3
; ---------------------------------------------------------------------------

code_2779:				
		mov	DPTR, #303h
		movx	A, @DPTR
		cjne	A, #1, code_2791
		mov	DPTR, #2EDh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_278A
		sjmp	code_27A0
; ---------------------------------------------------------------------------

code_278A:				
		mov	DPTR, #39Dh
		movx	A, @DPTR
		mov	R7, A
		sjmp	code_27A0
; ---------------------------------------------------------------------------

code_2791:				
		mov	DPTR, #2FAh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_279B
		sjmp	code_27A0
; ---------------------------------------------------------------------------

code_279B:				
		mov	DPTR, #3A0h
		movx	A, @DPTR
		mov	R7, A

code_27A0:				
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #363h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	R7, B
		lcall	code_CA9F

code_27C3:				
		mov	A, R7
		orl	A, #80h
		mov	DPTR, #364h
		movx	@DPTR, A
		mov	DPTR, #2EBh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #1, code_27D6
		mov	R6, #1
		sjmp	code_27D8
; ---------------------------------------------------------------------------

code_27D6:				
		mov	R6, #0

code_27D8:				
		mov	DPTR, #36Fh
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		cjne	A, #1, code_27E5
		mov	R7, #1
		sjmp	code_27E7
; ---------------------------------------------------------------------------

code_27E5:				
		mov	R7, #0

code_27E7:				
		mov	DPTR, #370h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #2EBh
		movx	A, @DPTR
		xrl	A, #2
		jnz	code_2830
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_2803
		mov	DPTR, #301h
		movx	A, @DPTR
		cpl	A
		jz	code_2830

code_2803:				
		mov	A, R7
		cjne	A, #0FFh, code_280B
		mov	R7, #0
		sjmp	code_2813
; ---------------------------------------------------------------------------

code_280B:				
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F

code_2813:				
		mov	DPTR, #365h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #301h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_2824
		mov	R7, #0
		sjmp	code_2827
; ---------------------------------------------------------------------------

code_2824:				
		lcall	code_CA9F

code_2827:				
		mov	A, R7
		orl	A, #80h

code_282A:				
		mov	DPTR, #366h
		movx	@DPTR, A
		sjmp	code_287F
; ---------------------------------------------------------------------------

code_2830:				
		mov	DPTR, #303h
		movx	A, @DPTR
		cjne	A, #1, code_2848
		mov	DPTR, #2EEh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_2841
		sjmp	code_2857
; ---------------------------------------------------------------------------

code_2841:				
		mov	DPTR, #39Eh
		movx	A, @DPTR
		mov	R7, A
		sjmp	code_2857
; ---------------------------------------------------------------------------

code_2848:				
		mov	DPTR, #2FBh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_2852
		sjmp	code_2857
; ---------------------------------------------------------------------------

code_2852:				
		mov	DPTR, #3A1h
		movx	A, @DPTR
		mov	R7, A

code_2857:				
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #365h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	R7, B
		lcall	code_CA9F
		mov	DPTR, #366h
		mov	A, R7
		movx	@DPTR, A

code_287F:				
		mov	DPTR, #2EBh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #2, code_288B
		mov	R6, #1
		sjmp	code_288D
; ---------------------------------------------------------------------------

code_288B:				
		mov	R6, #0

code_288D:				
		mov	DPTR, #371h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		cjne	A, #2, code_289A
		mov	R7, #1
		sjmp	code_289C
; ---------------------------------------------------------------------------

code_289A:				
		mov	R7, #0

code_289C:				
		mov	DPTR, #372h
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_2677


; ======================================================


code_28A2:				
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #10h
		jz	code_28AF
		mov	A, R7
		cjne	A, #11h, code_28B3

code_28AF:				
		mov	R7, #1
		sjmp	code_28B5
; ---------------------------------------------------------------------------

code_28B3:				
		mov	R7, #0

code_28B5:				
		mov	DPTR, #8Dh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #0Ah
		jz	code_28CC
		mov	A, R7
		xrl	A, #0Bh
		jz	code_28CC
		mov	A, R7
		cjne	A, #0Ch, code_28D0

code_28CC:				
		mov	R7, #1
		sjmp	code_28D2
; ---------------------------------------------------------------------------

code_28D0:				
		mov	R7, #0

code_28D2:				
		mov	DPTR, #8Fh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #12h
		jz	code_28E9
		mov	A, R7
		xrl	A, #13h
		jz	code_28E9
		mov	A, R7
		cjne	A, #14h, code_28ED

code_28E9:				
		mov	R7, #1
		sjmp	code_28EF
; ---------------------------------------------------------------------------

code_28ED:				
		mov	R7, #0

code_28EF:				
		mov	DPTR, #92h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1
		jz	code_2915
		mov	A, R7
		xrl	A, #2
		jz	code_2915
		mov	A, R7
		xrl	A, #3
		jz	code_2915
		mov	A, R7
		xrl	A, #4
		jz	code_2915
		mov	A, R7
		xrl	A, #5
		jz	code_2915
		mov	A, R7
		cjne	A, #6, code_2919

code_2915:				
		mov	R7, #1
		sjmp	code_291B
; ---------------------------------------------------------------------------

code_2919:				
		mov	R7, #0

code_291B:				
		mov	DPTR, #93h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #7
		jz	code_2950
		mov	A, R7
		xrl	A, #8
		jz	code_2950
		mov	A, R7
		xrl	A, #9
		jz	code_2950
		mov	A, R7
		xrl	A, #15h
		jz	code_2950
		mov	A, R7
		xrl	A, #16h
		jz	code_2950
		mov	A, R7
		xrl	A, #17h
		jz	code_2950
		mov	A, R7
		xrl	A, #18h
		jz	code_2950
		mov	A, R7
		xrl	A, #19h
		jz	code_2950
		mov	A, R7
		cjne	A, #1Ah, code_2954

code_2950:				
		mov	R7, #1
		sjmp	code_2956
; ---------------------------------------------------------------------------

code_2954:				
		mov	R7, #0

code_2956:				
		mov	DPTR, #94h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #0Dh
		jz	code_297C
		mov	A, R7
		xrl	A, #0Eh
		jz	code_297C
		mov	A, R7
		xrl	A, #0Fh
		jz	code_297C
		mov	A, R7
		xrl	A, #1Bh
		jz	code_297C
		mov	A, R7
		xrl	A, #1Ch
		jz	code_297C
		mov	A, R7
		cjne	A, #1Dh, code_2980

code_297C:				
		mov	R7, #1
		sjmp	code_2982
; ---------------------------------------------------------------------------

code_2980:				
		mov	R7, #0

code_2982:				
		mov	DPTR, #96h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #4
		jz	code_29D5
		mov	A, R7
		xrl	A, #5
		jz	code_29D5
		mov	A, R7
		xrl	A, #6
		jz	code_29D5
		mov	A, R7
		xrl	A, #12h
		jz	code_29D5
		mov	A, R7
		xrl	A, #13h
		jz	code_29D5
		mov	A, R7
		xrl	A, #14h
		jz	code_29D5
		mov	A, R7
		xrl	A, #15h
		jz	code_29D5
		mov	A, R7
		xrl	A, #16h
		jz	code_29D5
		mov	A, R7
		xrl	A, #17h
		jz	code_29D5
		mov	A, R7
		xrl	A, #18h
		jz	code_29D5
		mov	A, R7
		xrl	A, #19h
		jz	code_29D5
		mov	A, R7
		xrl	A, #1Ah
		jz	code_29D5
		mov	A, R7
		xrl	A, #1Bh
		jz	code_29D5
		mov	A, R7
		xrl	A, #1Ch
		jz	code_29D5
		mov	A, R7
		cjne	A, #1Dh, code_29D9

code_29D5:				
		mov	R7, #1
		sjmp	code_29DB
; ---------------------------------------------------------------------------

code_29D9:				
		mov	R7, #0

code_29DB:				
		mov	DPTR, #104h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_2A10
		mov	A, R7
		xrl	A, #6
		jz	code_2A10
		mov	A, R7
		xrl	A, #9
		jz	code_2A10
		mov	A, R7
		xrl	A, #0Ch
		jz	code_2A10
		mov	A, R7
		xrl	A, #0Fh
		jz	code_2A10
		mov	A, R7
		xrl	A, #11h
		jz	code_2A10
		mov	A, R7
		xrl	A, #17h
		jz	code_2A10
		mov	A, R7
		xrl	A, #1Ah
		jz	code_2A10
		mov	A, R7
		cjne	A, #1Dh, code_2A14

code_2A10:				
		mov	R7, #1
		sjmp	code_2A16
; ---------------------------------------------------------------------------

code_2A14:				
		mov	R7, #0

code_2A16:				
		mov	DPTR, #0A2h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #2
		jz	code_2A4B
		mov	A, R7
		xrl	A, #5
		jz	code_2A4B
		mov	A, R7
		xrl	A, #8
		jz	code_2A4B
		mov	A, R7
		xrl	A, #16h
		jz	code_2A4B
		mov	A, R7
		xrl	A, #0Bh
		jz	code_2A4B
		mov	A, R7
		xrl	A, #0Eh
		jz	code_2A4B
		mov	A, R7
		xrl	A, #13h
		jz	code_2A4B
		mov	A, R7
		xrl	A, #19h
		jz	code_2A4B
		mov	A, R7
		cjne	A, #1Ch, code_2A4F

code_2A4B:				
		mov	R7, #1
		sjmp	code_2A51
; ---------------------------------------------------------------------------

code_2A4F:				
		mov	R7, #0

code_2A51:				
		mov	DPTR, #8Eh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #15h
		jz	code_2A68
		mov	A, R7
		xrl	A, #16h
		jz	code_2A68
		mov	A, R7
		cjne	A, #17h, code_2A6C

code_2A68:				
		mov	R7, #1
		sjmp	code_2A6E
; ---------------------------------------------------------------------------

code_2A6C:				
		mov	R7, #0

code_2A6E:				
		mov	DPTR, #125h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #12h
		jz	code_2A85
		mov	A, R7
		xrl	A, #13h
		jz	code_2A85
		mov	A, R7
		cjne	A, #14h, code_2A89

code_2A85:				
		mov	R7, #1
		sjmp	code_2A8B
; ---------------------------------------------------------------------------

code_2A89:				
		mov	R7, #0

code_2A8B:				
		mov	DPTR, #163h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #18h
		jz	delay_2AA2
		mov	A, R7
		xrl	A, #19h
		jz	delay_2AA2
		mov	A, R7
		cjne	A, #1Ah, delay_2AA6

delay_2AA2:				
		mov	R7, #1
		sjmp	delay_2AA8
; ---------------------------------------------------------------------------

delay_2AA6:				
		mov	R7, #0

delay_2AA8:				
		mov	DPTR, #124h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1Bh
		jz	code_2ABF
		mov	A, R7
		xrl	A, #1Ch
		jz	code_2ABF
		mov	A, R7
		cjne	A, #1Dh, code_2AC3

code_2ABF:				
		mov	R7, #1
		sjmp	code_2AC5
; ---------------------------------------------------------------------------

code_2AC3:				
		mov	R7, #0

code_2AC5:				
		mov	DPTR, #0FBh
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_28A2


; ======================================================


code_2ACB:				
		lcall	code_CDC4
		mov	A, R7
		jnz	code_2AD4
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_2AD4:				
		lcall	UserInput_ToR6R7_C489
		mov	DPTR, #275h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	RAM_1E,#1
		mov	RAM_1F,#2
		mov	RAM_20,#6Fh
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		lcall	code_C3F9
		mov	DPTR, #30Fh
		movx	A, @DPTR
		lcall	switch_13AA
		add	A, R3
		rl	A
		nop
		add	A, R3
		orl	A, R0
		ajmp	code_282A+1
;  code_2ACB

; ---------------------------------------------------------------------------
		db  6Fh

; ======================================================


code_2B00:
		ljmp	code_2B95
; ---------------------------------------------------------------------------
		db    3
		db  2Bh
		db 0B9h
		db    4
		db  2Bh
		db 0DDh
		db    5
		db  2Ch
		db  0Ch
		db    6
		db  2Ch
		db  33h
		db    7
		db  2Ch
		db  53h
		db    8
		db  2Ch
		db  73h
		db    9
		db  2Ch
		db  93h
		db  0Ah
		db  2Ch
		db 0B3h
		db  0Bh
		db  2Ch
		db 0CEh
		db  0Ch
		db    0
		db    0
		db  2Ch
		db 0D9h
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		subb	A, #0
		jc	code_2B3A
		setb	C
		mov	A, R7
		subb	A, #63h
		mov	A, R6
		subb	A, #0
		jc	code_2B3D

code_2B3A:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2B3D:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #26Fh
		ljmp	code_2BFF
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		mov	A, R6
		subb	A, #0
		jc	code_2B61
		setb	C
		mov	A, R7
		subb	A, #0Ch
		mov	A, R6
		subb	A, #0
		jc	code_2B64

code_2B61:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2B64:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #270h
		ljmp	code_2BFF
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		mov	A, R6
		subb	A, #0
		jc	code_2B88
		setb	C
		mov	A, R7
		subb	A, #1Fh
		mov	A, R6
		subb	A, #0
		jc	code_2B8B

code_2B88:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2B8B:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #271h
		sjmp	code_2BFF
; ---------------------------------------------------------------------------

code_2B95:				
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		subb	A, #0
		jc	code_2BAC
		setb	C
		mov	A, R7
		subb	A, #17h
		mov	A, R6
		subb	A, #0
		jc	code_2BAF

code_2BAC:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2BAF:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #272h
		sjmp	code_2BFF
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		subb	A, #0
		jc	code_2BD0
		setb	C
		mov	A, R7
		subb	A, #3Bh
		mov	A, R6
		subb	A, #0
		jc	code_2BD3

code_2BD0:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2BD3:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #273h
		sjmp	code_2BFF
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		subb	A, #0
		jc	code_2BF4
		setb	C
		mov	A, R7
		subb	A, #3Bh
		mov	A, R6
		subb	A, #0
		jc	code_2BF7

code_2BF4:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2BF7:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #274h

code_2BFF:				
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Fh
		lcall	code_AB0F
		mov	R7, #1
		ret
;  code_2B00

; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		mov	A, R6
		subb	A, #0
		jc	code_2C24
		mov	A, R7
		subb	A, #1
		mov	A, R6
		subb	A, #0
		jnc	code_2C27

code_2C24:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2C27:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BC37
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1
		orl	A, R6
		jz	code_2C47
		mov	A, R7
		orl	A, R6
		jz	code_2C47
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2C47:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BF87
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1
		orl	A, R6
		jz	code_2C67
		mov	A, R7
		orl	A, R6
		jz	code_2C67
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2C67:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BFA5
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1
		orl	A, R6
		jz	code_2C87
		mov	A, R7
		orl	A, R6
		jz	code_2C87
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2C87:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BFC3
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1
		orl	A, R6
		jz	code_2CA7
		mov	A, R7
		orl	A, R6
		jz	code_2CA7
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2CA7:				
		mov	DPTR, #275h
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BFE1
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		subb	A, #2
		mov	A, R4
		subb	A, #0
		jc	code_2CC6
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2CC6:				
		mov	R7, RAM_5
		lcall	code_C15C
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ljmp	code_C1E4
; ---------------------------------------------------------------------------
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_2CDC:				
		mov	DPTR, #313h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C193
		mov	A, R7
		jnz	code_2CE9
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_2CE9:				
		lcall	code_C9C7
		mov	A, R7
		jnz	code_2CF1
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_2CF1:				
		lcall	code_C607
		mov	DPTR, #270h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #314h
		movx	A, @DPTR
		mov	R7, A
		anl	A, #1
		mov	R6, A
		mov	DPTR, #271h
		movx	@DPTR, A
		mov	A, R7
		anl	A, #0Fh
		clr	C
		rrc	A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #314h
		movx	A, @DPTR
		mov	R7, A
		swap	A
		anl	A, #0Fh
		mov	DPTR, #273h
		movx	@DPTR, A
		mov	A, R6
		jz	code_2D1F
		ljmp	code_2E13
; ---------------------------------------------------------------------------

code_2D1F:				
		mov	DPTR, #272h
		movx	A, @DPTR
		dec	A
		jnz	code_2D29
		ljmp	code_2DAB
; ---------------------------------------------------------------------------

code_2D29:				
		dec	A
		jnz	code_2D2F
		ljmp	code_2DAE
; ---------------------------------------------------------------------------

code_2D2F:				
		dec	A
		jnz	code_2D35
		ljmp	code_2DF5
; ---------------------------------------------------------------------------

code_2D35:				
		add	A, #3
		jz	code_2D3C
		ljmp	code_2E10
; ---------------------------------------------------------------------------

code_2D3C:				
		mov	DPTR, #273h
		movx	A, @DPTR
		lcall	switch_13AA
; ---------------------------------------------------------------------------
		dw code_2D71
		db    0
		dw code_2D77
		db    1
		dw code_2D7D
		db    2
		dw code_2D83
		db    3
		dw code_2D88
		db    4
		dw code_2D88
		db    5
		dw code_2D88
		db    6
		dw code_2D88
		db    7
		dw code_2D88
		db    8
		dw code_2D88
		db    9
		dw code_2D94
		db  0Ah
		dw code_2D99
		db  0Bh
		dw code_2D9E
		db  0Dh
		dw code_2DA3
		db  0Eh
		db 0
		db    0
		dw code_2DA8
; ---------------------------------------------------------------------------

code_2D71:				
		lcall	code_B61C
		ljmp	code_2E05
; ---------------------------------------------------------------------------

code_2D77:				
		lcall	code_B71B
		ljmp	code_2E05
; ---------------------------------------------------------------------------

code_2D7D:				
		lcall	code_C4CF
		ljmp	code_2E05
; ---------------------------------------------------------------------------

code_2D83:				
		lcall	code_9559
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2D88:				
		mov	DPTR, #273h
		movx	A, @DPTR
		add	A, #0FDh
		mov	R7, A
		lcall	code_BF69
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2D94:				
		lcall	code_C542
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2D99:				
		lcall	code_CDFA
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2D9E:				
		lcall	IE0_0000
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2DA3:				
		lcall	code_CE30
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2DA8:				
		ljmp	code_2EC9
; ---------------------------------------------------------------------------

code_2DAB:				
		ljmp	code_2EC9
; ---------------------------------------------------------------------------

code_2DAE:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		lcall	switch_13AA
; ---------------------------------------------------------------------------
		dw code_2DDE
		db    0
		dw code_2DE8
		db    1
		dw code_2DDE
		db    2
		dw code_2DE8
		db    3
		dw code_2DDE
		db    4
		dw code_2DE8
		db    5
		dw code_2DDE
		db    6
		dw code_2DE8
		db    7
		dw code_2DDE
		db    8
		dw code_2DE8
		db    9
		dw code_2DDE
		db  0Ah
		dw code_2DE8
		db  0Bh
		db 0
		db    0
		dw code_2ECE
; ---------------------------------------------------------------------------

code_2DDE:				
		mov	A, R7
		clr	C
		rrc	A
		inc	A
		mov	R7, A
		lcall	code_B569
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2DE8:				
		mov	DPTR, #273h
		movx	A, @DPTR
		clr	C
		rrc	A
		inc	A
		mov	R7, A
		lcall	code_C887
		sjmp	code_2E05
; ---------------------------------------------------------------------------

code_2DF5:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #10h
		jc	code_2E02
		ljmp	code_2EC9
; ---------------------------------------------------------------------------

code_2E02:				
		lcall	code_C124

code_2E05:				
		mov	DPTR, #315h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ljmp	code_2ECE
; ---------------------------------------------------------------------------

code_2E10:				
		ljmp	code_2EC9
; ---------------------------------------------------------------------------

code_2E13:				
		mov	DPTR, #272h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_2E52
		dec	A
		jnz	code_2E21
		ljmp	code_2EAB
; ---------------------------------------------------------------------------

code_2E21:				
		add	A, #3
		jz	code_2E28
		ljmp	code_2EC9
; ---------------------------------------------------------------------------

code_2E28:				
		mov	DPTR, #273h
		movx	A, @DPTR
		jnz	code_2E3C
		mov	DPTR, #315h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8CB2
		ljmp	code_2EC2
; ---------------------------------------------------------------------------

code_2E3C:				
		mov	DPTR, #273h
		movx	A, @DPTR
		cjne	A, #1, code_2E50
		mov	DPTR, #315h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_B69D
		sjmp	code_2EC2
; ---------------------------------------------------------------------------

code_2E50:				
		sjmp	code_2EC9
; ---------------------------------------------------------------------------

code_2E52:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		lcall	switch_13AA
; ---------------------------------------------------------------------------
		dw code_2E82
		db    0
		dw code_2E94
		db    1
		dw code_2E82
		db    2
		dw code_2E94
		db    3
		dw code_2E82
		db    4
		dw code_2E94
		db    5
		dw code_2E82
		db    6
		dw code_2E94
		db    7
		dw code_2E82
		db    8
		dw code_2E94
		db    9
		dw code_2E82
		db  0Ah
		dw code_2E94
		db  0Bh
		db    0
		db    0
		dw code_2EA9
; ---------------------------------------------------------------------------

code_2E82:				
		mov	A, R7
		clr	C
		rrc	A
		inc	A
		mov	R7, A
		mov	DPTR, #315h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		lcall	code_CA4F
		sjmp	code_2EC2
; ---------------------------------------------------------------------------

code_2E94:				
		mov	DPTR, #273h
		movx	A, @DPTR
		clr	C
		rrc	A
		inc	A
		mov	R7, A
		mov	DPTR, #315h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		lcall	code_CA5F
		sjmp	code_2EC2
; ---------------------------------------------------------------------------

code_2EA9:				
		sjmp	code_2EC9
; ---------------------------------------------------------------------------

code_2EAB:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #10h
		jc	code_2EB7
		sjmp	code_2EC9
; ---------------------------------------------------------------------------

code_2EB7:				
		mov	DPTR, #315h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		lcall	code_C4E6

code_2EC2:				
		mov	DPTR, #270h
		mov	A, R7
		movx	@DPTR, A
		sjmp	code_2ECE
; ---------------------------------------------------------------------------

code_2EC9:				
		clr	A
		mov	DPTR, #270h
		movx	@DPTR, A

code_2ECE:				
		mov	DPTR, #314h
		movx	A, @DPTR
		anl	A, #0FEh
		mov	R7, A
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, R7
		mov	DPTR, #314h
		movx	@DPTR, A
		lcall	code_C607
		lcall	code_CDF1
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    1
		db 0C0h
		db  80h
		db  41h
		db    0
		db 0C1h
		db  81h
		db  40h
		db    0
		db 0C0h
		db 0C1h
		db    1
		db 0C3h
		db    3
		db    2
		db 0C2h
		db 0C6h
		db    6
		db    7
		db 0C7h
		db    5
		db 0C5h
		db 0C4h
		db    4
		db 0CCh
		db  0Ch
		db  0Dh
		db 0CDh
		db  0Fh
		db 0CFh
		db 0CEh
		db  0Eh
		db  0Ah
		db 0CAh
		db 0CBh
		db  0Bh
		db 0C9h
		db    9
		db    8
		db 0C8h
		db 0D8h
		db  18h
		db  19h
		db 0D9h
		db  1Bh
		db 0DBh
		db 0DAh
		db  1Ah
		db  1Eh
		db 0DEh
		db 0DFh
		db  1Fh
		db 0DDh
		db  1Dh
		db  1Ch
		db 0DCh
		db  14h
		db 0D4h
		db 0D5h
		db  15h
		db 0D7h
		db  17h
		db  16h
		db 0D6h
		db 0D2h
		db  12h
		db  13h
		db 0D3h
		db  11h
		db 0D1h
		db 0D0h
		db  10h
		db 0F0h
		db  30h
		db  31h
		db 0F1h
		db  33h
		db 0F3h
		db 0F2h
		db  32h
		db  36h
		db 0F6h
		db 0F7h
		db  37h
		db 0F5h
		db  35h
		db  34h
		db 0F4h
		db  3Ch
		db 0FCh
		db 0FDh
		db  3Dh
		db 0FFh
		db  3Fh
		db  3Eh
		db 0FEh
		db 0FAh
		db  3Ah
		db  3Bh
		db 0FBh
		db  39h
		db 0F9h
		db 0F8h
		db  38h
		db  28h
		db 0E8h
		db 0E9h
		db  29h
		db 0EBh
		db  2Bh
		db  2Ah
		db 0EAh
		db 0EEh
		db  2Eh
		db  2Fh
		db 0EFh
		db  2Dh
		db 0EDh
		db 0ECh
		db  2Ch
		db 0E4h
		db  24h
		db  25h
		db 0E5h
		db  27h
		db 0E7h
		db 0E6h
		db  26h
		db  22h
		db 0E2h
		db 0E3h
		db  23h
		db 0E1h
		db  21h
		db  20h
		db 0E0h
		db 0A0h
		db  60h
		db  61h
		db 0A1h
		db  63h
		db 0A3h
		db 0A2h
		db  62h
		db  66h
		db 0A6h
		db 0A7h
		db  67h
		db 0A5h
		db  65h
		db  64h
		db 0A4h
		db  6Ch
		db 0ACh
		db 0ADh
		db  6Dh
		db 0AFh
		db  6Fh
		db  6Eh
		db 0AEh
		db 0AAh
		db  6Ah
		db  6Bh
		db 0ABh
		db  69h
		db 0A9h
		db 0A8h
		db  68h
		db  78h
		db 0B8h
		db 0B9h
		db  79h
		db 0BBh
		db  7Bh
		db  7Ah
		db 0BAh
		db 0BEh
		db  7Eh
		db  7Fh
		db 0BFh
		db  7Dh
		db 0BDh
		db 0BCh
		db  7Ch
		db 0B4h
		db  74h
		db  75h
		db 0B5h
		db  77h
		db 0B7h
		db 0B6h
		db  76h
		db  72h
		db 0B2h
		db 0B3h
		db  73h
		db 0B1h
		db  71h
		db  70h
		db 0B0h
		db  50h
		db  90h
		db  91h
		db  51h
		db  93h
		db  53h
		db  52h
		db  92h
		db  96h
		db  56h
		db  57h
		db  97h
		db  55h
		db  95h
		db  94h
		db  54h
		db  9Ch
		db  5Ch
		db  5Dh
		db  9Dh
		db  5Fh
		db  9Fh
		db  9Eh
		db  5Eh
		db  5Ah
		db  9Ah
		db  9Bh
		db  5Bh
		db  99h
		db  59h
		db  58h
		db  98h
		db  88h
		db  48h
		db  49h
		db  89h
		db  4Bh
		db  8Bh
		db  8Ah
		db  4Ah
		db  4Eh
		db  8Eh
		db  8Fh
		db  4Fh
		db  8Dh
		db  4Dh
		db  4Ch
		db  8Ch
		db  44h
		db  84h
		db  85h
		db  45h
		db  87h
		db  47h
		db  46h
		db  86h
		db  82h
		db  42h
		db  43h
		db  83h
		db  41h
		db  81h
		db  80h
		db  40h

; ======================================================


code_30E8:				
		mov	DPTR, #399h
		movx	A, @DPTR
		mov	R1, A
		jnz	code_30F3
		inc	DPTR
		ljmp	code_3289
; ---------------------------------------------------------------------------

code_30F3:				
		mov	DPTR, #39Ah
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R5, A
		mov	A, R6
		subb	A, R4
		mov	R4, A
		mov	DPTR, #26Fh
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		mov	A, R1
		mov	R3, A
		rlc	A
		subb	A, ACC
		mov	R2, A
		clr	C
		clr	A
		subb	A, R3
		mov	R3, A
		clr	A
		subb	A, R2
		mov	R2, A
		setb	C
		mov	A, R5
		subb	A, R3
		mov	A, R2
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_3140
		mov	DPTR, #399h
		movx	A, @DPTR
		mov	R5, A
		rlc	A
		subb	A, ACC
		mov	R4, A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		clr	C
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, R2
		xrl	A, #80h
		subb	A, R0
		jc	code_314E

code_3140:				
		mov	DPTR, #39Ah
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #391h
		ljmp	code_31DC
; ---------------------------------------------------------------------------

code_314E:				
		mov	DPTR, #397h
		mov	A, R2
		mov	B, R3
		lcall	code_1187
		mov	DPTR, #394h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R5, A
		clr	C
		subb	A, #5
		jnc	code_3167
		ljmp	code_3296
; ---------------------------------------------------------------------------

code_3167:				
		mov	DPTR, #397h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_318B
		mov	A, R5
		rrc	A
		mov	R3, A
		mov	R2, #0
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R2
		addc	A, R6
		xch	A, R7
		add	A, #1
		xch	A, R7
		addc	A, #0
		sjmp	code_31A6
; ---------------------------------------------------------------------------

code_318B:				
		mov	DPTR, #394h
		movx	A, @DPTR
		mov	R5, A
		clr	C
		rrc	A
		mov	R7, A
		clr	C
		mov	DPTR, #398h
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #397h
		movx	A, @DPTR
		subb	A, #0
		xch	A, R7
		add	A, #0FFh
		xch	A, R7
		addc	A, #0FFh

code_31A6:				
		mov	R6, A
		mov	R4, #0
		lcall	code_1151
		mov	DPTR, #271h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #39Ah
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #271h
		mov	A, R6
		mov	B, R7
		lcall	code_1187
		mov	DPTR, #391h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #271h
		movx	A, @DPTR
		cjne	A, RAM_6, code_31E7
		inc	DPTR
		movx	A, @DPTR
		cjne	A, RAM_7, code_31E7
		mov	DPTR, #39Ah

code_31DC:				
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_CD20
		ljmp	code_CD2C
; ---------------------------------------------------------------------------

code_31E7:				
		lcall	code_CD20
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #391h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #39Ah
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	R7, A
		mov	A, R6
		subb	A, R4
		mov	DPTR, #395h
		mov	B, R7
		lcall	code_1187
		mov	DPTR, #393h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R5, A
		clr	C
		subb	A, #3
		jc	code_3296
		mov	DPTR, #395h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_3241
		mov	A, R5
		rrc	A
		mov	R3, A
		mov	R2, #0
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R2
		addc	A, R6
		xch	A, R7
		add	A, #1
		xch	A, R7
		addc	A, #0
		sjmp	code_325C
; ---------------------------------------------------------------------------

code_3241:				
		mov	DPTR, #393h
		movx	A, @DPTR
		mov	R5, A
		clr	C
		rrc	A
		mov	R7, A
		clr	C
		mov	DPTR, #396h
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #395h
		movx	A, @DPTR
		subb	A, #0
		xch	A, R7
		add	A, #0FFh
		xch	A, R7
		addc	A, #0FFh

code_325C:				
		mov	R6, A
		mov	R4, #0
		lcall	code_1151
		mov	DPTR, #271h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #39Ah
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #271h
		mov	A, R6
		mov	B, R7
		lcall	code_1187
		lcall	code_CD2C
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #39Ah

code_3289:				
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #391h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

code_3296:				
		ret
;  code_30E8


; ======================================================


code_3297:				
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0DBh
		mov	R5, #8
		lcall	code_AC05
		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R7
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882

		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R5
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882

		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #136h
		movx	A, @DPTR
		jz	code_3327
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0E4h
		mov	R5, #8
		lcall	code_AC05
		mov	DPTR, #0B4h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R7
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882

		mov	DPTR, #0B4h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R5
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882

code_3327:				
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0EDh
		mov	R5, #0Ah
		lcall	code_AC05
		mov	R3, #1
		mov	R2, #1
		mov	R1, #9Bh
		lcall	code_8877
		mov	A, R7
		jnz	code_3341
		ljmp	code_33E8
; ---------------------------------------------------------------------------

code_3341:				
		mov	R7, #32h
		lcall	WhileSendR7_C882
		mov	R7, #30h
		lcall	WhileSendR7_C882
		mov	DPTR, #19Bh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		lcall	code_C875
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	DPTR, #19Ch
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #19Ch
		lcall	code_C878
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	DPTR, #19Dh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #19Dh
		lcall	code_C878
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #19Eh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		jz	code_33A2
		add	A, #30h
		mov	R7, A
		sjmp	code_33A4
; ---------------------------------------------------------------------------

code_33A2:				
		mov	R7, #20h

code_33A4:				
		lcall	WhileSendR7_C882
		mov	DPTR, #19Eh
		lcall	code_C878
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	DPTR, #19Fh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #19Fh
		lcall	code_C878
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	DPTR, #1A0h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #1A0h
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	A, B
		add	A, #30h
		mov	R7, A
		sjmp	code_3435
; ---------------------------------------------------------------------------

code_33E8:				
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh

code_3435:				
		lcall	WhileSendR7_C882
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R7, #0Ah
		ljmp	WhileSendR7_C882
;  code_3297


; ======================================================
;
;
;
code_3442:				
		mov	A, PCON
		jnb	ACC.5, code_344C
		
		anl	PCON, #0DFh
		sjmp	code_3442
; ---------------------------------------------------------------------------

code_344C:				
		mov	S1RELH,#70h
		anl	RESERVED00B1, #0F7h
		anl	RESERVED00B2, #0F7h
		orl	RESERVED00B2, #8
		anl	RESERVED0091, #0DFh
		anl	DPSEL, #0DFh
		orl	DPSEL, #20h
		anl	RESERVED0091, #0FEh
		anl	DPSEL, #0FEh
		orl	DPSEL, #1
		anl	RESERVED00B3, #0FBh
		anl	RESERVED00B4, #0FBh
		orl	RESERVED00B4, #4
		anl	RESERVED0093, #0FEh
		anl	RESERVED0094, #0FEh
		orl	RESERVED0094, #1
		anl	RESERVED0093, #0FDh
		anl	RESERVED0094, #0FDh
		orl	RESERVED0094, #2
		anl	RESERVED00B3, #0FEh
		anl	RESERVED00B4, #0FEh
		orl	RESERVED00B4, #1
		anl	RESERVED00B1, #7Fh
		anl	RESERVED00B2, #7Fh
		orl	RESERVED00B2, #80h
		anl	RESERVED00B1, #0BFh
		anl	RESERVED00B2, #0BFh
		orl	RESERVED00B2, #40h
		anl	RESERVED00B1, #0DFh
		anl	RESERVED00B2, #0DFh
		orl	RESERVED00B2, #20h
		anl	RESERVED0093, #0DFh
		orl	RESERVED0093, #20h
		anl	RESERVED0094, #0DFh
		anl	RESERVED0093, #0EFh
		orl	RESERVED0093, #10h
		anl	RESERVED0094, #0EFh
		anl	RESERVED0093, #0F7h
		orl	RESERVED0093, #8
		anl	RESERVED0094, #0F7h
		anl	RESERVED0093, #0FBh
		orl	RESERVED0093, #4
		anl	RESERVED0094, #0FBh
		anl	RESERVED0095, #0FEh
		anl	RESERVED0096, #0FEh
		orl	RESERVED0096, #1
		anl	RESERVED0095, #0FDh
		anl	RESERVED0096, #0FDh
		orl	RESERVED0096, #2
		anl	RESERVED0095, #0FBh
		anl	RESERVED0096, #0FBh
		orl	RESERVED0096, #4
		anl	RESERVED0095, #0F7h
		anl	RESERVED0096, #0F7h
		orl	RESERVED0096, #8
		anl	RESERVED0095, #0EFh
		anl	RESERVED0096, #0EFh
		orl	RESERVED0096, #10h
		anl	RESERVED0095, #0DFh
		anl	RESERVED0096, #0DFh
		orl	RESERVED0096, #20h
		anl	RESERVED0095, #0BFh
		anl	RESERVED0096, #0BFh
		orl	RESERVED0096, #40h
		anl	RESERVED0095, #7Fh
		anl	RESERVED0096, #7Fh
		orl	RESERVED0096, #80h
		anl	RESERVED0093, #0BFh
		anl	RESERVED0094, #0BFh
		orl	RESERVED0094, #40h
		anl	RESERVED0093, #7Fh
		anl	RESERVED0094, #7Fh
		orl	RESERVED0094, #80h
		anl	RESERVED00B3, #0BFh
		anl	RESERVED00B4, #0BFh
		orl	RESERVED00B4, #40h
		anl	RESERVED00B3, #0FDh
		anl	RESERVED00B4, #0FDh
		orl	RESERVED00B4, #2
		anl	RESERVED00B3, #0DFh
		anl	RESERVED00B4, #0DFh
		orl	RESERVED00B4, #20h
		anl	RESERVED00B3, #0EFh
		anl	RESERVED00B4, #0EFh
		orl	RESERVED00B4, #10h
		mov	TMOD, #1
		mov	TH0, #0FFh
		mov	TL0, #0FFh
		setb	TCON.4

		orl	IE, #2

		clr	A
		mov	R7, A
		lcall	REN_CC00

		clr	A
		mov	R7, A
		lcall	USART_P30P31_P10P11_CB1A

		mov	R7, #2
		lcall	BaudRate_B964

		mov	R7, #8
		lcall	SM1_SM0_C459

		clr	A
		mov	R7, A
		lcall	IE4_CB29

		clr	A
		mov	R7, A
		lcall	SM2_CC0D

		clr	A
		mov	R7, A
		lcall	code_B5C4

		clr	A
		mov	DPTR, #35Ch
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

		lcall	code_CF2F

		setb	P0.5
		setb	P0.4
		setb	P0.3
		setb	P0.2
		clr	A
		mov	R7, A
		lcall	code_B50B
		lcall	IO_Init_CA8F
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_359B:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_35D8
		
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	A, #67h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0FFh
		movx	@DPTR, A
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #373h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #269h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_359B
; ---------------------------------------------------------------------------

code_35D8:				
		mov	DPTR, #EEPROM_DONE_35E
		mov	A, #1
		movx	@DPTR, A
		
		lcall	code_98C0
		
		lcall	IAP_IDLE_CF3B
		setb	EA
		ret
 
; ---------------------------------------------------------------------------

code_35E7:				
		mov	RAM_E, R6
		mov	RAM_F, R7
		mov	RAM_10,R3
		mov	RAM_11,R2
		mov	RAM_12,R1
		mov	DPTR, #2D0h
		movx	A, @DPTR
		lcall	switch_13AA
; ---------------------------------------------------------------------------
		dw code_3714
		db    1
		dw code_373B
		db    2
		dw code_3644
		db    5
		dw code_3651
		db  14h
		dw code_365E
		db  15h
		dw code_366B
		db  16h
		dw code_3678
		db  17h
		dw code_3685
		db  1Eh
		dw code_3692
		db  1Fh
		dw code_369F
		db  22h
		dw code_36AC
		db  23h
		dw code_36B9
		db  24h
		dw code_36D3
		db  25h
		dw code_36C6
		db  28h
		dw code_3707
		db  32h
		dw code_36E0
		db  33h
		dw code_36ED
		db  34h
		dw code_36FA
		db  35h
		dw code_3721
		db  37h
		dw code_372E
		db  38h
		dw code_3748
		db  46h
		dw code_3755
		db  47h
		dw code_3762
		db  48h
		dw code_376F
		db  49h
		db    0
		db    0
		dw code_377C
; ---------------------------------------------------------------------------

code_3644:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_1B58
; ---------------------------------------------------------------------------

code_3651:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_72C0
; ---------------------------------------------------------------------------

code_365E:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_8DE6
; ---------------------------------------------------------------------------

code_366B:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_8E4B
; ---------------------------------------------------------------------------

code_3678:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_85C3
; ---------------------------------------------------------------------------

code_3685:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_6088
; ---------------------------------------------------------------------------

code_3692:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_9CDE
; ---------------------------------------------------------------------------

code_369F:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_9D2C
; ---------------------------------------------------------------------------

code_36AC:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_78EA
; ---------------------------------------------------------------------------

code_36B9:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_9E5F
; ---------------------------------------------------------------------------

code_36C6:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_AF16
; ---------------------------------------------------------------------------

code_36D3:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_562E
; ---------------------------------------------------------------------------

code_36E0:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_A55A
; ---------------------------------------------------------------------------

code_36ED:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_C805
; ---------------------------------------------------------------------------

code_36FA:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_A6E2
; ---------------------------------------------------------------------------

code_3707:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_8EB0
; ---------------------------------------------------------------------------

code_3714:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_C6BE
; ---------------------------------------------------------------------------

code_3721:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_A48E
; ---------------------------------------------------------------------------

code_372E:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_B12F
; ---------------------------------------------------------------------------

code_373B:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_B2C4
; ---------------------------------------------------------------------------

code_3748:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_96BD
; ---------------------------------------------------------------------------

code_3755:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_AD58
; ---------------------------------------------------------------------------

code_3762:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_B38A
; ---------------------------------------------------------------------------

code_376F:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	R7, RAM_F
		mov	R6, RAM_E
		lcall	code_C818

code_377C:				
		ret

; ======================================================


code_377D:				
		lcall	code_AD1F
		mov	DPTR, #26Bh
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	DPTR, #272h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	@DPTR, A

code_3794:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #271h
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jnc	code_37F3
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	DPTR, #272h
		mov	A, B
		mov	B, R5
		lcall	code_1187
		mov	A, R7
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #274h
		mov	A, R6
		mov	B, R7
		lcall	code_1187
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_3794
; ---------------------------------------------------------------------------

code_37F3:				
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #26h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0CFh
		mov	R5, #4
		lcall	code_AC05
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #2Eh
		lcall	WhileSendR7_C882
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ch
		mov	RAM_10,	#5
		lcall	code_546D
		lcall	code_ABFD
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ch
		mov	RAM_10,	#5
		lcall	code_546D
		lcall	code_ABFD
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #26h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0D4h
		mov	R5, #6
		lcall	code_AC05
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #2Eh
		lcall	WhileSendR7_C882
		mov	DPTR, #272h
		movx	A, @DPTR
		jnz	code_38A2
		inc	DPTR
		movx	A, @DPTR

code_38A2:				
		jnz	code_38B3
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ch
		mov	RAM_10,	#5
		mov	R5, #2
		mov	R7, A
		mov	R6, A
		sjmp	code_38FD
; ---------------------------------------------------------------------------

code_38B3:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #275h
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		push	RAM_6
		push	RAM_7
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		pop	RAM_7
		pop	RAM_6
		lcall	code_A4D3
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ch
		mov	RAM_10,	#5
		mov	R5, #2

code_38FD:				
		lcall	code_546D
		lcall	code_ABFD
		mov	R7, #0Dh
		ljmp	WhileSendR7_C882
;  code_377D


; ======================================================


code_3908:				
		mov	RAM_9, R7
		mov	DPTR, #1C2h
		movx	A, @DPTR
		jnz	code_3914
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #1

code_3914:				
		jz	code_3919
		ljmp	code_3A88
; ---------------------------------------------------------------------------

code_3919:				
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_3942
		mov	DPTR, #273h
		mov	A, #1
		movx	@DPTR, A
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		inc	DPTR
		sjmp	code_395C
; ---------------------------------------------------------------------------

code_3942:				
		clr	A
		mov	DPTR, #273h
		movx	@DPTR, A
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #274h
		xch	A, R7

code_395C:				
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	C
		mov	A, R4
		xrl	A, #80h
		subb	A, #80h
		jnc	code_397B
		mov	DPTR, #276h
		mov	A, #1
		movx	@DPTR, A
		clr	C
		clr	A
		subb	A, R5
		mov	R6, A
		clr	A
		subb	A, R4
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		xch	A, R6
		movx	@DPTR, A
		sjmp	code_3986
; ---------------------------------------------------------------------------

code_397B:				
		clr	A
		mov	DPTR, #276h
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A

code_3986:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #273h
		movx	A, @DPTR
		cjne	A, RAM_1, code_39B2
		mov	DPTR, #275h
		movx	A, @DPTR
		add	A, ACC
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		rlc	A
		mov	R6, A
		setb	C
		mov	DPTR, #278h
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #277h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jc	code_39C4

code_39B2:				
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R4
		mov	B, R5
		sjmp	code_39EE
; ---------------------------------------------------------------------------

code_39C4:				
		mov	A, R1
		jz	code_39D0
		mov	A, R5
		add	A, #0FFh
		mov	R7, A
		mov	A, R4
		addc	A, #0FFh
		sjmp	code_39D6
; ---------------------------------------------------------------------------

code_39D0:				
		mov	A, R5
		add	A, #1
		mov	R7, A
		clr	A
		addc	A, R4

code_39D6:				
		mov	R6, A
		mov	R4, #0
		mov	R5, #2
		lcall	code_1151
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		mov	B, R7

code_39EE:				
		lcall	code_1187
		mov	A, RAM_9
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_3A60
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_3A60
		mov	A, R7
		add	A, #0FFh
		mov	R7, A
		mov	A, R6
		addc	A, #0FFh
		mov	R6, A
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

code_3A60:				
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_3A88
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_3A88:				
		ret
;  code_3908


; ======================================================


code_3A89:				
		mov	DPTR, #2D5h
		lcall	code_1303
		mov	DPTR, #2D9h
		mov	A, RAM_1D
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0DBh
		mov	RAM_2E,	A
		mov	R5, #4
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0DFh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #4
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0E3h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #4
		lcall	code_C21A
		clr	A
		mov	DPTR, #2E7h
		movx	@DPTR, A
		mov	DPTR, #2D5h
		lcall	code_12EB
		mov	RAM_21,	R7
		mov	RAM_20,	R6
		mov	RAM_1F,	R5
		mov	RAM_1E,	R4
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	R6, RAM_2
		mov	R7, RAM_3
		mov	R5, RAM_7
		mov	R4, RAM_6
		push	RAM_4
		push	RAM_5
		mov	RAM_27,	#4
		mov	DPTR, #2D9h
		movx	A, @DPTR
		mov	RAM_28,	A
		clr	A
		mov	R7, #10h
		mov	R6, #27h
		mov	R5, A
		mov	R4, A
		mov	R3, RAM_21
		mov	R2, RAM_20
		mov	R1, RAM_1F
		mov	R0, RAM_1E
		setb	C
		lcall	code_12C4
		jc	code_3B0C
		mov	R7, #1
		sjmp	code_3B0E
; ---------------------------------------------------------------------------

code_3B0C:				
		mov	R7, #0

code_3B0E:				
		mov	RAM_29,	R7
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0DBh
		pop	RAM_5
		pop	RAM_4
		lcall	code_4161
		mov	DPTR, #2DAh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, RAM_21
		mov	R6, RAM_20
		mov	R5, RAM_1F
		mov	R4, RAM_1E
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	RAM_21,	R7
		mov	RAM_20,	R6
		mov	RAM_1F,	R5
		mov	RAM_1E,	R4
		mov	A, R4
		orl	A, R5
		orl	A, R6
		orl	A, R7
		jz	code_3BA8
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	R6, RAM_2
		mov	R7, RAM_3
		mov	R5, RAM_7
		mov	R4, RAM_6
		push	RAM_4
		push	RAM_5
		mov	RAM_27,	#4
		clr	A
		mov	RAM_28,	A
		mov	R7, #10h
		mov	R6, #27h
		mov	R5, A
		mov	R4, A
		mov	R3, RAM_21
		mov	R2, RAM_20
		mov	R1, RAM_1F
		mov	R0, RAM_1E
		setb	C
		lcall	code_12C4
		jc	code_3B77
		mov	R7, #1
		sjmp	code_3B79
; ---------------------------------------------------------------------------

code_3B77:				
		mov	R7, #0

code_3B79:				
		mov	RAM_29,	R7
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0DFh
		pop	RAM_5
		pop	RAM_4
		lcall	code_4161
		mov	DPTR, #2DAh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, RAM_21
		mov	R6, RAM_20
		mov	R5, RAM_1F
		mov	R4, RAM_1E
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	RAM_21,	R7
		mov	RAM_20,	R6
		mov	RAM_1F,	R5
		mov	RAM_1E,	R4

code_3BA8:				
		mov	R7, RAM_21
		mov	R6, RAM_20
		mov	R5, RAM_1F
		mov	R4, RAM_1E
		mov	A, R4
		orl	A, R5
		orl	A, R6
		orl	A, R7
		jz	code_3BF9
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	R6, RAM_2
		mov	R7, RAM_3
		mov	R5, RAM_7
		mov	R4, RAM_6
		mov	RAM_27,	#4
		clr	A
		mov	RAM_28,	A
		mov	RAM_29,	A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0E3h
		lcall	code_4161
		mov	DPTR, #2DAh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, RAM_21
		mov	R6, RAM_20
		mov	R5, RAM_1F
		mov	R4, RAM_1E
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_A4D3
		mov	RAM_21,	R7
		mov	RAM_20,	R6
		mov	RAM_1F,	R5
		mov	RAM_1E,	R4

code_3BF9:				
		ret
;  code_3A89


; ======================================================


code_3BFA:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #2, code_3C0F
		clr	A
		mov	DPTR, #12Dh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1DAh
		ljmp	code_3D5F
; ---------------------------------------------------------------------------

code_3C0F:				
		mov	A, R7
		xrl	A, #3
		jz	code_3C17
		ljmp	code_3D1B
; ---------------------------------------------------------------------------

code_3C17:				
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #1
		jz	code_3C4B
		mov	A, R7
		xrl	A, #2
		jz	code_3C4B
		mov	A, R7
		xrl	A, #3
		jz	code_3C4B
		mov	A, R7
		xrl	A, #4
		jz	code_3C4B
		mov	A, R7
		xrl	A, #5
		jz	code_3C4B
		mov	A, R7
		xrl	A, #6
		jz	code_3C4B
		mov	A, R7
		xrl	A, #7
		jz	code_3C4B
		mov	A, R7
		xrl	A, #8
		jz	code_3C4B
		mov	A, R7
		xrl	A, #9
		jz	code_3C4B
		ljmp	code_3CCC
; ---------------------------------------------------------------------------

code_3C4B:				
		mov	DPTR, #8Dh
		movx	A, @DPTR
		jz	code_3C5A
		mov	DPTR, #357h
		movx	A, @DPTR
		jnb	ACC.0, code_3CCC
		sjmp	code_3CC0
; ---------------------------------------------------------------------------

code_3C5A:				
		mov	DPTR, #8Fh
		movx	A, @DPTR
		jz	code_3C6A
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #3
		jz	code_3CCC
		sjmp	code_3CC0
; ---------------------------------------------------------------------------

code_3C6A:				
		mov	DPTR, #92h
		movx	A, @DPTR
		jz	code_3C7A
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #7
		jz	code_3CCC
		sjmp	code_3CC0
; ---------------------------------------------------------------------------

code_3C7A:				
		mov	DPTR, #93h
		movx	A, @DPTR
		jz	code_3C8A
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #0Fh
		jz	code_3CCC
		sjmp	code_3CC0
; ---------------------------------------------------------------------------

code_3C8A:				
		mov	DPTR, #94h
		movx	A, @DPTR
		jz	code_3CB2
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_3CA8
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #0C0h
		mov	R7, A
		xrl	A, #40h
		jz	code_3CA6
		mov	A, R7
		xrl	A, #80h
		jnz	code_3CCC

code_3CA6:				
		sjmp	code_3CC0
; ---------------------------------------------------------------------------

code_3CA8:				
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #0CFh
		jz	code_3CCC
		sjmp	code_3CC0
; ---------------------------------------------------------------------------

code_3CB2:				
		mov	DPTR, #96h
		movx	A, @DPTR
		jz	code_3CCC
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #0CFh
		jz	code_3CCC

code_3CC0:				
		lcall	code_C6AA
		mov	DPTR, #12Dh
		clr	A
		mov	B, R7
		lcall	code_1187

code_3CCC:				
		mov	DPTR, #169h
		movx	A, @DPTR
		xrl	A, #0Bh
		jz	code_3CD7
		ljmp	code_3D62
; ---------------------------------------------------------------------------

code_3CD7:				
		mov	DPTR, #124h
		movx	A, @DPTR
		mov	R7, A
		jnz	code_3CE4
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jz	code_3CEB

code_3CE4:				
		mov	DPTR, #357h
		movx	A, @DPTR
		jb	ACC.4, code_3CFC

code_3CEB:				
		mov	A, R7
		jnz	code_3D0D
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_3D0D
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #30h
		jz	code_3D0D

code_3CFC:				
		lcall	code_C6AA
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		movx	@DPTR, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, #0
		movx	@DPTR, A

code_3D0D:				
		clr	C
		mov	DPTR, #12Dh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jnc	code_3D62
		clr	A
		sjmp	code_3D5F
; ---------------------------------------------------------------------------

code_3D1B:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #4
		jnz	code_3D62
		mov	DPTR, #0FBh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #124h
		movx	A, @DPTR
		orl	A, R7
		mov	R7, A
		jz	code_3D37
		mov	DPTR, #357h
		movx	A, @DPTR
		jb	ACC.4, code_3D42

code_3D37:				
		mov	A, R7
		jnz	code_3D53
		mov	DPTR, #357h
		movx	A, @DPTR
		anl	A, #30h
		jz	code_3D53

code_3D42:				
		lcall	code_C6AA
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		movx	@DPTR, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, #0
		movx	@DPTR, A

code_3D53:				
		clr	C
		mov	DPTR, #12Dh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jnc	code_3D62
		clr	A

code_3D5F:				
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_3D62:				
		ret
;  code_3BFA

; ---------------------------------------------------------------------------

code_3D63:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A
		mov	DPTR, #2FEh
		movx	A, @DPTR
		cjne	A, #0FFh, code_3D7F
		mov	DPTR, #301h
		movx	A, @DPTR
		cjne	A, #0FFh, code_3D7F
		mov	DPTR, #26Fh
		mov	A, #1
		movx	@DPTR, A
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3D7F:				
		mov	DPTR, #2EBh
		movx	A, @DPTR
		dec	A
		jz	code_3DE7
		dec	A
		jnz	code_3D8C
		ljmp	code_3E2A
; ---------------------------------------------------------------------------

code_3D8C:				
		add	A, #2
		jz	code_3D93
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3D93:				
		mov	DPTR, #303h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_3DC4
		inc	A
		jz	code_3DA1
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DA1:				
		lcall	code_B7C2
		mov	A, R7
		clr	C
		subb	A, #0
		jnc	code_3DAD
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DAD:				
		lcall	code_B7C2
		mov	A, R7
		setb	C
		subb	A, #63h
		jc	code_3DB9
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DB9:				
		lcall	code_B7BC
		mov	DPTR, #2ECh
		mov	A, R7
		movx	@DPTR, A
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DC4:				
		lcall	code_B7C2
		mov	A, R7
		clr	C
		subb	A, #0
		jnc	code_3DD0
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DD0:				
		lcall	code_B7C2
		mov	A, R7
		setb	C
		subb	A, #17h
		jc	code_3DDC
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DDC:				
		lcall	code_B7BC
		mov	DPTR, #2F9h
		mov	A, R7
		movx	@DPTR, A
		ljmp	code_3E6B
; ---------------------------------------------------------------------------

code_3DE7:				
		mov	DPTR, #303h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_3E0E
		inc	A
		jnz	code_3E6B
		lcall	code_B7C2
		mov	A, R7
		clr	C
		subb	A, #1
		jc	code_3E6B
		lcall	code_B7C2
		mov	A, R7
		setb	C
		subb	A, #0Ch
		jnc	code_3E6B
		lcall	code_B7BC
		mov	DPTR, #2EDh
		mov	A, R7
		movx	@DPTR, A
		sjmp	code_3E6B
; ---------------------------------------------------------------------------

code_3E0E:				
		lcall	code_B7C2
		mov	A, R7
		clr	C
		subb	A, #0
		jc	code_3E6B
		lcall	code_B7C2
		mov	A, R7
		setb	C
		subb	A, #3Bh
		jnc	code_3E6B
		lcall	code_B7BC
		mov	DPTR, #2FAh
		mov	A, R7
		movx	@DPTR, A
		sjmp	code_3E6B
; ---------------------------------------------------------------------------

code_3E2A:				
		mov	DPTR, #303h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_3E51
		inc	A
		jnz	code_3E6B
		lcall	code_B7C2
		mov	A, R7
		clr	C
		subb	A, #1
		jc	code_3E6B
		lcall	code_B7C2
		mov	A, R7
		setb	C
		subb	A, #1Fh
		jnc	code_3E6B
		lcall	code_B7BC
		mov	DPTR, #2EEh
		mov	A, R7
		movx	@DPTR, A
		sjmp	code_3E6B
; ---------------------------------------------------------------------------

code_3E51:				
		lcall	code_B7C2
		mov	A, R7
		clr	C
		subb	A, #0
		jc	code_3E6B
		lcall	code_B7C2
		mov	A, R7
		setb	C
		subb	A, #3Bh
		jnc	code_3E6B
		lcall	code_B7BC
		mov	DPTR, #2FBh
		mov	A, R7
		movx	@DPTR, A

code_3E6B:				
		mov	DPTR, #2FEh
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #301h
		movx	@DPTR, A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		jnz	code_3E7D
		sjmp	code_3EBC
; ---------------------------------------------------------------------------

code_3E7D:				
		mov	DPTR, #2EBh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		setb	C
		subb	A, #2
		jc	code_3EB2
		mov	DPTR, #303h
		movx	A, @DPTR
		cjne	A, #1, code_3EA1
		lcall	code_915C
		mov	A, R7
		jnz	code_3E98
		sjmp	code_3EA7
; ---------------------------------------------------------------------------

code_3E98:				
		mov	DPTR, #303h
		mov	A, #2
		movx	@DPTR, A
		clr	A
		sjmp	code_3EA7
; ---------------------------------------------------------------------------

code_3EA1:				
		lcall	code_91BC
		mov	A, R7
		jnz	code_3EAD

code_3EA7:				
		mov	DPTR, #2EBh
		movx	@DPTR, A
		sjmp	code_3EB2
; ---------------------------------------------------------------------------

code_3EAD:				
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_3EB2:				
		clr	A
		mov	DPTR, #374h
		movx	@DPTR, A
		mov	DPTR, #373h
		inc	A
		movx	@DPTR, A

code_3EBC:				
		lcall	code_2677
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C351

code_3EC0:				
		lcall	code_AD1F
		mov	DPTR, #270h
		mov	A, R7
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_3ED5:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jnc	code_3F34
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	DPTR, #271h
		mov	A, B
		mov	B, R5
		lcall	code_1187
		mov	A, R7
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #273h
		mov	A, R6
		mov	B, R7
		lcall	code_1187
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_3ED5
; ---------------------------------------------------------------------------

code_3F34:				
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0F8h
		mov	R5, #8
		lcall	code_AC05
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #52h
		mov	R5, #8
		lcall	code_AC05
		mov	DPTR, #271h
		lcall	code_5458
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	R5, #5
		lcall	code_AC05
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #5Bh
		mov	R5, #8
		lcall	code_AC05
		mov	DPTR, #273h
		lcall	code_5458
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	R5, #5
		lcall	code_AC05
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #64h
		mov	R5, #8
		lcall	code_AC05
		mov	DPTR, #271h
		movx	A, @DPTR
		jnz	code_3FA8
		inc	DPTR
		movx	A, @DPTR

code_3FA8:				
		jnz	code_3FB9
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	RAM_10,	#5
		mov	R5, #2
		mov	R7, A
		mov	R6, A
		sjmp	code_4003
; ---------------------------------------------------------------------------

code_3FB9:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #274h
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #273h
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		push	RAM_6
		push	RAM_7
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		pop	RAM_7
		pop	RAM_6
		lcall	code_A4D3
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	RAM_10,	#5
		mov	R5, #2

code_4003:				
		lcall	code_546D
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	R5, #5
		ljmp	code_AC05
; ======================================================


code_4011:				
		mov	DPTR, #2EFh				;
		movx	A, @DPTR				;
		mov	R6, A					; 随机数
		inc	DPTR					;
		movx	A, @DPTR				;
		mov	R7, A					;
		lcall	caculate_BF2C			;

		mov	DPTR, #26Fh				;
		mov	A, R6				     	;
		movx	@DPTR, A		   		; 26F,270=随机数CRC
		inc	DPTR					;
		mov	A, R7					;
		movx	@DPTR, A				;




		lcall	UserInput_ToR6R7_C489
	; 	lcall	test_00				; 配置 8888 配置 随机数 输入完 数据后来这里
job1:


		mov	DPTR, #271h
		mov	A, R6
		movx	@DPTR, A			   	; 271,272=用户输入
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

		mov	DPTR, #89h
		movx	A, @DPTR
		cjne	A, RAM_6, code_403D 		
		inc	DPTR
		movx	A, @DPTR
		cjne	A, RAM_7, code_403D   		; if(input==0X2202)
							   	; {
		sjmp	code_4071
								; }
; ---------------------------------------------------------------------------

code_403D:				
	;	mov	DPTR, #26Fh
	;	movx	A, @DPTR
	;	xrl	A, #3
	;	mov	R6, A
	;	inc	DPTR			     		; (随机数CRC)^0x38B
	;	movx	A, @DPTR
	;	xrl	A, #8Bh
	;	mov	R7, A

		mov	DPTR, #26Fh
		movx	A, @DPTR
		xrl	A, #0X129>>8
		mov	R6, A
		inc	DPTR			     		; (随机数CRC)^0x38B
		movx	A, @DPTR
		xrl	A, #0X129&0xff
		mov	R7, A


	;	mov	DPTR, #sram_13B			;
	;	movx	A, @DPTR				;
	;	xrl	A, R6			 		;
	;	mov	R6, A
	;	inc	DPTR
	;	movx	A, @DPTR
	;	xrl	A, R7
	;	mov	R7, A

		mov	DPTR, #sram_13B			;
		clr	a					;
		xrl	A, R6			 		;
		mov	R6, A					; 改版
		inc	DPTR					;
		clr	a					;
		xrl	A, R7					;
		mov	R7, A					;

		mov	R4, #27h				;
		mov	R5, #10h				;
		lcall	DIV_10FC				;
		mov	DPTR, #273h				;
		mov	A, R4		  			; (CRC^0x38B)/10000
		movx	@DPTR, A				;
		inc	DPTR				  	; 273,274=(随机数CRC)^0x38B
		mov	A, R5					;
		movx	@DPTR, A				;

		mov	DPTR, #271h				;
		movx	A, @DPTR				;
		mov	R2, A					;
		inc	DPTR					;
		movx	A, @DPTR				;
		mov	R3, A					;
		cjne	A, RAM_5, code_4079		;
		mov	A, R2					;
		cjne	A, RAM_4, code_4079		; if(用户输入==)
						   		; {
code_4071:				
		mov	DPTR, #2FCh
		mov	A, #1
		movx	@DPTR, A		   		;	实现功能1
		mov	R7, A
		ret				    		; }

code_4079:				
	;	mov	DPTR, #26Fh
	;	movx	A, @DPTR
	;	xrl	A, #1
	;	mov	R6, A
	;	inc	DPTR
	;	movx	A, @DPTR		 		; CRC^0X139
	;	xrl	A, #39h
	;	mov	R7, A

		mov	DPTR, #26Fh
		movx	A, @DPTR
		xrl	A, #0X24A>>8
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR		 		; CRC^0X139
		xrl	A, #0X24A&0xff
		mov	R7, A

	;	mov	DPTR, #sram_13B
	;	movx	A, @DPTR
	;	xrl	A, R6
	;	mov	R6, A
	;	inc	DPTR
	;	movx	A, @DPTR
	;	xrl	A, R7
	;	mov	R7, A

		mov	DPTR, #sram_13B			;
		clr	a					;
		xrl	A, R6				 	;
		mov	R6, A					; 改版
		inc	DPTR					;
		clr	a					;
		xrl	A, R7					;
		mov	R7, A					;

		mov	R4, #27h				;
		mov	R5, #10h				;
		lcall	DIV_10FC				;
		mov	DPTR, #273h				;
		mov	A, R4					;
		movx	@DPTR, A		 		; 273,274=(随机数CRC)^0x139
		inc	DPTR					;
		mov	A, R5					;
		movx	@DPTR, A				;
		cjne	A, RAM_3, code_40AD	     	;
		mov	A, R2					;
		cjne	A, RAM_4, code_40AD  		; if(input==)
								; {
		clr	A
		mov	DPTR, #2FCh				;
		movx	@DPTR, A		    		;	实现功能2
		mov	R7, #1				;
		ret				 		; }

code_40AD:				
	;	mov	DPTR, #sram_13B		;
	;	movx	A, @DPTR			;
	;	mov	R6, A				;
	;	inc	DPTR				;
	;	movx	A, @DPTR			;
	;	mov	R7, A				;

		mov	DPTR, #sram_13B		;
		clr	a				;
		mov	R6, A				;
		inc	DPTR				;
		clr	a				;
		mov	R7, A				;

		mov	DPTR, #26Fh		   	;
		movx	A, @DPTR	 		; (随机数CRC)
		xrl	A, R6				;
		mov	R6, A				;
		inc	DPTR				;
		movx	A, @DPTR			;
		xrl	A, R7				;
		mov	R7, A				;

		mov	R4, #27h		  	;
		mov	R5, #10h			;
		lcall	DIV_10FC			; ((随机数CRC))%10000  
		inc	DPTR				;
		movx	A, @DPTR			;
		xrl	A, R4				;
		mov	R7, A				;
		inc	DPTR				;
		movx	A, @DPTR			; (((RamdonCRC))%10000)^用户输入
		xrl	A, R5				;
		inc	DPTR				;
		xch	A, R7				; 271 272=用户输入
		movx	@DPTR, A			;
		inc	DPTR				;
		mov	A, R7				;
		movx	@DPTR, A			; 273,274=(((随机数CRC))%10000)^用户输入;

		mov	DPTR, #273h		    	;
		movx	A, @DPTR			;
		mov	R6, A				;
		inc	DPTR				;
		movx	A, @DPTR			;
		mov	R7, A				;

		mov	R4, #0			;
		mov	R5, #64h			;
		lcall	DIV_10FC			;
		mov	R3, RAM_5			; R2R3=((((随机数CRC))%10000)^用户输入)%100
		mov	R2, RAM_4			; 


		clr	A				;
		mov	RAM_18,A			;
code_40E9:				 		; RAM_18=0;
		setb	C				;
		mov	A, R3				;
		subb	A, #0				;
		mov	A, R2				;
		subb	A, #0				;
		jc	code_4113  			; while(R2R3>0)
							; {
		mov	R4, #0			;
		mov	R5, #0Ah			;
		mov	R7, RAM_3			;
		mov	R6, RAM_2			;
		lcall	DIV_10FC			;	
		mov	A, R5				;
		add	A, RAM_18			;
		mov	RAM_18,A 			;	RAM_18+=R2R3%10;	
		
		mov	R4, #0
		mov	R5, #0Ah
		mov	R7, RAM_3
		mov	R6, RAM_2
		lcall	DIV_10FC	   		;	r2r3=i/10;
		mov	R2, RAM_6
		mov	R3, RAM_7
		sjmp	code_40E9			; }

code_4113:				
		mov	A, RAM_18
		jnz	code_4132 			;  
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R4, #0
		mov	R5, #64h
		lcall	DIV_10FC
		mov	A, R7
		xrl	A, #1
		orl	A, R6
		jnz	code_4132	    		; if(RAM_18==0 && ((((随机数CRC))%10000)^用户输入)/100)==1)
							; {
		mov	R7, #0Fh			;	9999
		mov	R6, #27h
		sjmp	code_415B		    	; }

code_4132:				
		mov	DPTR, #273h			;
		movx	A, @DPTR			;
		mov	R2, A				;
		inc	DPTR				;
		movx	A, @DPTR			;
		mov	R3, A				;

		mov	R4, #0			;
		mov	R5, #64h			;
		mov	R7, A				;
		mov	R6, RAM_2			;
		lcall	DIV_10FC		 	; 
		mov	R4, #0			;
		mov	A, R7				;
		cjne	A, RAM_18, ret_415E 	; if((((随机数CRC))%10000)^用户输入)/100==RAM_18)
		mov	A, R4				; {
		cjne	A, RAM_6, ret_415E    	; 


		mov	R5, #64h			;
		mov	R7, RAM_3			; 	R6R7=R2R3%100
		mov	R6, RAM_2	  		; 		
		lcall	DIV_10FC			;
		mov	R6, RAM_4	    		; 	R6R7 最后的次数	，次数最大99次
		mov	R7, RAM_5			;

code_415B:				
		lcall	code_903C

ret_415E:				
		mov	R7, #0
		ret
;  


; ======================================================


code_4161:				
		mov	RAM_22,	R3
		mov	RAM_23,	R2
		mov	RAM_24,	R1
		mov	RAM_25,	R4
		mov	RAM_26,	R5
		mov	R3, #1
		mov	R2, #2
		mov	R1, #74h
		clr	A
		mov	RAM_2E,	A
		mov	R5, RAM_27
		lcall	code_C21A
		setb	C
		mov	A, RAM_26
		subb	A, #0Fh
		mov	A, RAM_25
		xrl	A, #80h
		subb	A, #0A7h
		jc	code_418C
		mov	RAM_25,	#27h
		mov	RAM_26,	#0Fh

code_418C:				
		clr	C
		mov	A, RAM_26
		subb	A, #19h
		mov	A, RAM_25
		xrl	A, #80h
		subb	A, #7Ch
		jnc	code_419F
		mov	RAM_25,	#0FCh
		mov	RAM_26,	#19h

code_419F:				
		clr	A
		mov	DPTR, #27Bh
		movx	@DPTR, A
		clr	C
		mov	A, RAM_25
		xrl	A, #80h
		subb	A, #80h
		jnc	code_41BB
		clr	C
		clr	A
		subb	A, RAM_26
		mov	RAM_26,	A
		clr	A
		subb	A, RAM_25
		mov	RAM_25,	A
		mov	A, #1
		movx	@DPTR, A

code_41BB:				
		clr	A
		mov	DPTR, #27Ah
		movx	@DPTR, A

code_41C0:				
		mov	R6, RAM_25
		mov	R7, RAM_26
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_1151
		mov	A, #0AFh
		add	A, R5
		mov	DPL, A
		mov	A, #0CAh
		addc	A, R4
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R7, A
		mov	DPTR, #27Ah
		movx	A, @DPTR
		mov	R5, A
		mov	A, RAM_27
		mov	R3, A
		mov	R2, #0
		clr	C
		subb	A, R5
		mov	R5, A
		mov	A, R2
		subb	A, #0
		mov	R4, A
		mov	A, #73h
		add	A, R5
		mov	DPL, A
		mov	A, #2
		addc	A, R4
		mov	DPH, A
		mov	A, R7
		movx	@DPTR, A
		mov	R6, RAM_25
		mov	R7, RAM_26
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_1151
		mov	RAM_25,	R6
		mov	RAM_26,	R7
		mov	DPTR, #27Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	A, RAM_27
		dec	A
		mov	R7, A
		movx	A, @DPTR
		mov	R6, A
		setb	C
		subb	A, R7
		jnc	code_421F
		mov	A, RAM_26
		orl	A, RAM_25
		jnz	code_41C0
		mov	A, R6
		subb	A, RAM_28
		jc	code_41C0

code_421F:				
		mov	A, RAM_28
		jz	code_423A
		mov	R7, A
		clr	C
		mov	A, R3
		subb	A, R7
		mov	R7, A
		mov	A, R2
		subb	A, #0
		mov	R6, A
		mov	A, #73h
		add	A, R7
		mov	DPL, A
		mov	A, #2
		addc	A, R6
		mov	DPH, A
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A

code_423A:				
		mov	A, RAM_29
		jz	code_4270

code_423E:				
		mov	A, RAM_27
		dec	A
		mov	R7, A
		mov	DPTR, #27Ah
		movx	A, @DPTR
		mov	R6, A
		setb	C
		subb	A, R7
		jnc	code_4270
		mov	DPTR, #0CAAFh
		clr	A
		movc	A, @A+DPTR
		mov	R7, A
		mov	A, R6
		mov	R5, A
		mov	A, RAM_27
		clr	C
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, #0
		mov	R4, A
		mov	A, #73h
		add	A, R5
		mov	DPL, A
		mov	A, #2
		addc	A, R4
		mov	DPH, A
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #27Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_423E
; ---------------------------------------------------------------------------

code_4270:				
		mov	DPTR, #27Bh
		movx	A, @DPTR
		jz	code_427C
		mov	DPTR, #274h
		mov	A, #40h
		movx	@DPTR, A

code_427C:				
		clr	A
		mov	DPTR, #27Ah
		movx	@DPTR, A

code_4281:				
		mov	DPTR, #27Ah
		movx	A, @DPTR
		clr	C
		subb	A, RAM_27
		jnc	code_42AC
		movx	A, @DPTR
		mov	R7, A
		add	A, #74h
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		movx	A, @DPTR
		mov	R3, RAM_22
		mov	R2, RAM_23
		mov	R1, RAM_24
		mov	DPL, R7
		mov	DPH, #0
		lcall	code_10C8
		mov	DPTR, #27Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_4281
; ---------------------------------------------------------------------------

code_42AC:				
		ret
;  code_4161

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C9A5

code_42AD:				
		lcall	code_AD1F
		mov	DPTR, #26Ah
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #1Bh
		lcall	WhileSendR7_C882
		mov	R7, #63h
		lcall	WhileSendR7_C882
		mov	DPTR, #34Fh
		movx	A, @DPTR
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #34Fh
		movx	A, @DPTR
		dec	A
		jnz	code_42D1
		ljmp	code_4367
; ---------------------------------------------------------------------------

code_42D1:				
		inc	A
		jz	code_42D7
		ljmp	code_43F7
; ---------------------------------------------------------------------------

code_42D7:				
		lcall	code_6154
		lcall	code_536D
		lcall	code_C178
		lcall	code_8F79
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #1
		jc	code_42F1
		mov	R7, #1
		lcall	code_5E16

code_42F1:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jc	code_42FF
		mov	R7, #2
		lcall	code_5E16

code_42FF:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #3
		jc	code_430D
		mov	R7, #3
		lcall	code_5E16

code_430D:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #4
		jc	code_431B
		mov	R7, #4
		lcall	code_5E16

code_431B:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_4329
		mov	R7, #5
		lcall	code_5E16

code_4329:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #6
		jc	code_4337
		mov	R7, #6
		lcall	code_5E16

code_4337:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #7
		jc	code_4345
		mov	R7, #7
		lcall	code_5E16

code_4345:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #8
		jc	code_4353
		mov	R7, #8
		lcall	code_5E16

code_4353:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #9
		jc	code_4361
		mov	R7, #9
		lcall	code_5E16

code_4361:				
		lcall	code_C178
		ljmp	code_377D
; ---------------------------------------------------------------------------

code_4367:				
		lcall	code_377D
		lcall	code_C178
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #9
		jc	code_437B
		mov	R7, #9
		lcall	code_5E16

code_437B:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #8
		jc	code_4389
		mov	R7, #8
		lcall	code_5E16

code_4389:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #7
		jc	code_4397
		mov	R7, #7
		lcall	code_5E16

code_4397:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #6
		jc	code_43A5
		mov	R7, #6
		lcall	code_5E16

code_43A5:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_43B3
		mov	R7, #5
		lcall	code_5E16

code_43B3:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #4
		jc	code_43C1
		mov	R7, #4
		lcall	code_5E16

code_43C1:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #3
		jc	code_43CF
		mov	R7, #3
		lcall	code_5E16

code_43CF:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jc	code_43DD
		mov	R7, #2
		lcall	code_5E16

code_43DD:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #1
		jc	code_43EB
		mov	R7, #1
		lcall	code_5E16

code_43EB:				
		lcall	code_8F79
		lcall	code_C178
		lcall	code_536D
		lcall	code_6154

code_43F7:				
		ret
;  CHUNK	FOR code_C9A5

; ======================================================


code_43F8:				
		mov	DPTR, #269h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		clr	C
		subb	A, #0Ah
		jc	code_440D
		clr	A
		movx	@DPTR, A
		mov	DPTR, #269h
		movx	@DPTR, A

code_440D:				
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A

code_4412:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jc	code_441F
		ljmp	code_453D
; ---------------------------------------------------------------------------

code_441F:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	R6, A
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	B, #2
		mov	A, R7
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		clr	C
		mov	A, B
		xrl	A, #80h
		subb	A, #80h
		jnc	code_4473
		mov	A, R6
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		clr	A
		mov	B, A
		lcall	code_121F
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_4473:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R6, A
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		orl	A, B
		jnz	code_44A0
		ljmp	code_4534
; ---------------------------------------------------------------------------

code_44A0:				
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	B, #2
		mov	A, R6
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	R4, B
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	B, #2
		mov	A, R6
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		setb	C
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, B
		xrl	A, #80h
		subb	A, R0
		jc	code_4534
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	R4, B
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	B, #2
		mov	A, R6
		mul	AB
		mov	DPL, A
		mov	DPH, B
		mov	A, R4
		mov	B, R5
		lcall	code_121F

code_4534:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_4412
; ---------------------------------------------------------------------------

code_453D:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_43F8


; ======================================================


code_4543:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		jnz	code_456C
		mov	DPTR, #361h
		mov	A, #73h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #71h
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		add	A, #1
		mov	RAM_1D,	A
		clr	A
		rlc	A
		mov	RAM_1C,	A
		lcall	code_B880
		ljmp	code_4686
; ---------------------------------------------------------------------------

code_456C:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_45C2
		mov	A, R7
		setb	C
		subb	A, #19h
		jnc	code_45C2
		mov	A, R7
		add	A, #0FFh
		mov	R3, A
		clr	A
		addc	A, #0FFh
		mov	R2, A
		mov	R4, #0
		mov	R5, #3
		mov	R7, RAM_3
		mov	R6, A
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_45C2
		mov	DPTR, #361h
		mov	A, #38h
		movx	@DPTR, A
		mov	R4, #0
		mov	R5, #3
		mov	R7, RAM_3
		mov	R6, RAM_2
		lcall	DIV_10FC
		mov	A, R7
		inc	A
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		lcall	code_A823
		ljmp	code_4686
; ---------------------------------------------------------------------------

code_45C2:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #2
		jc	code_461B
		mov	A, R7
		setb	C
		subb	A, #1Ah
		jnc	code_461B
		mov	A, R7
		mov	R3, A
		mov	R2, #0
		add	A, #0FEh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_461B
		mov	DPTR, #361h
		mov	A, #71h
		movx	@DPTR, A
		mov	A, R3
		add	A, #0FFh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R7
		inc	A
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		lcall	code_A823
		sjmp	code_4686
; ---------------------------------------------------------------------------

code_461B:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #3
		jc	code_4689
		mov	A, R7
		setb	C
		subb	A, #1Bh
		jnc	code_4689
		mov	A, R7
		mov	R3, A
		mov	R2, #0
		add	A, #0FDh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_4689
		mov	DPTR, #361h
		mov	A, #39h
		movx	@DPTR, A
		mov	A, R3
		add	A, #0FFh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R7
		inc	A
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #30Eh
		movx	A, @DPTR
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R7
		add	A, ACC
		add	A, #3Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_A84A

code_4686:				
		lcall	code_6D52

code_4689:				
		ret
;  code_4543


; ======================================================


code_468A:				
		mov	A, RAM_3B
		jnz	code_4691
		ljmp	code_47C4
; ---------------------------------------------------------------------------

code_4691:				
		mov	DPTR, #1EEh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1EDh
		movx	A, @DPTR
		cjne	A, RAM_7, code_46AC
		mov	DPTR, #22Ch
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #22Bh
		movx	A, @DPTR
		xrl	A, R7
		jnz	code_46AC
		ljmp	code_47C4
; ---------------------------------------------------------------------------

code_46AC:				
		mov	DPTR, #1EEh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1EDh
		movx	A, @DPTR
		mov	R3, A
		cjne	A, RAM_7, code_46BC
		setb	C
		sjmp	code_46BD
; ---------------------------------------------------------------------------

code_46BC:				
		clr	C

code_46BD:				
		jc	code_4735
		mov	DPTR, #1EDh
		movx	A, @DPTR
		mov	R7, A
		mov	B, #6
		mul	AB
		add	A, #0EFh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	DPTR, #269h
		movx	@DPTR, A
		mov	A, R7
		mov	B, #6
		mul	AB
		add	A, #0F0h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	DPTR, #26Ah
		movx	@DPTR, A
		mov	A, R3
		mov	B, #6
		mul	AB
		add	A, #0F1h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		lcall	code_12EB
		mov	DPTR, #26Bh
		lcall	code_1303
		mov	A, R3
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #1EDh
		mov	A, R5
		movx	@DPTR, A
		mov	A, #1
		jz	code_4735
		mov	DPTR, #26Bh
		lcall	code_12EB
		mov	RAM_D, R7
		mov	RAM_C, R6
		mov	RAM_B, R5
		mov	RAM_A, R4
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R5, A
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_7A16
		ljmp	code_46AC
; ---------------------------------------------------------------------------

code_4735:				
		mov	DPTR, #22Ch
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #22Bh
		movx	A, @DPTR
		mov	R3, A
		cjne	A, RAM_7, code_4745
		setb	C
		sjmp	code_4746
; ---------------------------------------------------------------------------

code_4745:				
		clr	C

code_4746:				
		jnc	code_474B
		ljmp	code_4691
; ---------------------------------------------------------------------------

code_474B:				
		mov	DPTR, #22Bh
		movx	A, @DPTR
		mov	R7, A
		mov	B, #6
		mul	AB
		add	A, #2Dh
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		movx	A, @DPTR
		mov	DPTR, #269h
		movx	@DPTR, A
		mov	A, R7
		mov	B, #6
		mul	AB
		add	A, #2Eh
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		movx	A, @DPTR
		mov	DPTR, #26Ah
		movx	@DPTR, A
		mov	A, R3
		mov	B, #6
		mul	AB
		add	A, #2Fh
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		lcall	code_12EB
		mov	DPTR, #26Bh
		lcall	code_1303
		mov	A, R3
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #22Bh
		mov	A, R5
		movx	@DPTR, A
		mov	A, #1
		jnz	code_47A6
		ljmp	code_4691
; ---------------------------------------------------------------------------

code_47A6:				
		mov	DPTR, #26Bh
		lcall	code_12EB
		mov	RAM_D, R7
		mov	RAM_C, R6
		mov	RAM_B, R5
		mov	RAM_A, R4
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R5, A
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_7A16
		ljmp	code_4735
; ---------------------------------------------------------------------------

code_47C4:				
		ret
;  code_468A


; ======================================================


code_47C5:				
		clr	A
		mov	DPTR, #36Dh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_47D4
		inc	DPTR
		movx	A, @DPTR

code_47D4:				
		jz	code_47D9
		ljmp	code_486C
; ---------------------------------------------------------------------------

code_47D9:				
		mov	DPTR, #1A1h
		movx	A, @DPTR
		cjne	A, #1, code_481F
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_47FF
		dec	A
		jz	code_4807
		dec	A
		jz	code_480F
		dec	A
		jz	code_4817
		dec	A
		jz	code_47F7
		add	A, #5
		jnz	code_483F

code_47F7:				
		mov	DPTR, #361h
		mov	A, #0F1h
		movx	@DPTR, A
		sjmp	code_483F
; ---------------------------------------------------------------------------

code_47FF:				
		mov	DPTR, #361h
		mov	A, #0D8h
		movx	@DPTR, A
		sjmp	code_483F
; ---------------------------------------------------------------------------

code_4807:				
		mov	DPTR, #361h
		mov	A, #88h
		movx	@DPTR, A
		sjmp	code_483F
; ---------------------------------------------------------------------------

code_480F:				
		mov	DPTR, #361h
		mov	A, #80h
		movx	@DPTR, A
		sjmp	code_483F
; ---------------------------------------------------------------------------

code_4817:				
		mov	DPTR, #361h
		mov	A, #0A1h
		movx	@DPTR, A
		sjmp	code_483F
; ---------------------------------------------------------------------------

code_481F:				
		mov	DPTR, #361h
		mov	A, #0F1h
		movx	@DPTR, A
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_4848
		dec	A
		jz	code_4851
		dec	A
		jz	code_485A
		dec	A
		jz	code_4863
		dec	A
		jz	code_483F
		add	A, #5
		jz	code_483F
		ljmp	code_48F3
; ---------------------------------------------------------------------------

code_483F:				
		mov	DPTR, #362h
		mov	A, #0B8h
		movx	@DPTR, A
		ljmp	code_48F3
; ---------------------------------------------------------------------------

code_4848:				
		mov	DPTR, #362h
		mov	A, #90h
		movx	@DPTR, A
		ljmp	code_48F3
; ---------------------------------------------------------------------------

code_4851:				
		mov	DPTR, #362h
		mov	A, #80h
		movx	@DPTR, A
		ljmp	code_48F3
; ---------------------------------------------------------------------------

code_485A:				
		mov	DPTR, #362h
		mov	A, #81h
		movx	@DPTR, A
		ljmp	code_48F3
; ---------------------------------------------------------------------------

code_4863:				
		mov	DPTR, #362h
		mov	A, #0E0h
		movx	@DPTR, A
		ljmp	code_48F3
; ---------------------------------------------------------------------------

code_486C:				
		mov	DPTR, #1A1h
		movx	A, @DPTR
		cjne	A, #1, code_48B1
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_4892
		dec	A
		jz	code_489A
		dec	A
		jz	code_48A2
		dec	A
		jz	code_48A9
		dec	A
		jz	code_488A
		add	A, #5
		jnz	code_48CE

code_488A:				
		mov	DPTR, #361h
		mov	A, #71h
		movx	@DPTR, A
		sjmp	code_48CE
; ---------------------------------------------------------------------------

code_4892:				
		mov	DPTR, #361h
		mov	A, #58h
		movx	@DPTR, A
		sjmp	code_48CE
; ---------------------------------------------------------------------------

code_489A:				
		mov	DPTR, #361h
		mov	A, #8
		movx	@DPTR, A
		sjmp	code_48CE
; ---------------------------------------------------------------------------

code_48A2:				
		clr	A
		mov	DPTR, #361h
		movx	@DPTR, A
		sjmp	code_48CE
; ---------------------------------------------------------------------------

code_48A9:				
		mov	DPTR, #361h
		mov	A, #21h
		movx	@DPTR, A
		sjmp	code_48CE
; ---------------------------------------------------------------------------

code_48B1:				
		mov	DPTR, #361h
		mov	A, #71h
		movx	@DPTR, A
		mov	DPTR, #2C5h
		movx	A, @DPTR
		dec	A
		jz	code_48D6
		dec	A
		jz	code_48DE
		dec	A
		jz	code_48E5
		dec	A
		jz	code_48ED
		dec	A
		jz	code_48CE
		add	A, #5
		jnz	code_48F3

code_48CE:				
		mov	DPTR, #362h
		mov	A, #38h
		movx	@DPTR, A
		sjmp	code_48F3
; ---------------------------------------------------------------------------

code_48D6:				
		mov	DPTR, #362h
		mov	A, #10h
		movx	@DPTR, A
		sjmp	code_48F3
; ---------------------------------------------------------------------------

code_48DE:				
		clr	A
		mov	DPTR, #362h
		movx	@DPTR, A
		sjmp	code_48F3
; ---------------------------------------------------------------------------

code_48E5:				
		mov	DPTR, #362h
		mov	A, #1
		movx	@DPTR, A
		sjmp	code_48F3
; ---------------------------------------------------------------------------

code_48ED:				
		mov	DPTR, #362h
		mov	A, #60h
		movx	@DPTR, A

code_48F3:				
		ljmp	code_9A0E
;  code_47C5


; ======================================================


code_48F6:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_48FF
		ljmp	code_4A10
; ---------------------------------------------------------------------------

code_48FF:				
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_490F
		lcall	code_AD91
		mov	A, R7
		jnz	code_492E

code_490F:				
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		cjne	R7, #1,	code_492B
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #0F7h
		mov	A, #0FFh
		movx	@DPTR, A
		lcall	code_AB87

code_492B:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_492E:				
		lcall	code_621F
		mov	A, R7
		jz	code_495C
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_493C
		inc	DPTR
		movx	A, @DPTR

code_493C:				
		jz	code_4954
		mov	DPTR, #41h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #1, code_494B
		clr	A
		mov	DPTR, #0F1h
		movx	@DPTR, A

code_494B:				
		mov	A, R7
		cjne	A, #2, code_4954
		clr	A
		mov	DPTR, #0A8h
		movx	@DPTR, A

code_4954:				
		mov	R7, #1
		lcall	code_B7E4
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_495C:				
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_4969
		inc	DPTR
		movx	A, @DPTR

code_4969:				
		jnz	code_49A8
		mov	DPTR, #41h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #1, code_4987
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.1, code_4987
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jnb	ACC.1, code_4987
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_4987:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_49DA
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_49DA
		mov	A, R7
		xrl	A, #2
		jnz	code_49DA
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.0, code_49DA
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jnb	ACC.0, code_49DA
		sjmp	code_49D4
; ---------------------------------------------------------------------------

code_49A8:				
		mov	DPTR, #41h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #1, code_49BD
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jb	ACC.1, code_49BD
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_49BD:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_49DA
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_49DA
		mov	A, R7
		cjne	A, #2, code_49DA
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jb	ACC.0, code_49DA

code_49D4:				
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_49DA:				
		mov	DPTR, #1ECh
		movx	A, @DPTR
		cjne	A, #1, code_49E7
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_49E7:				
		clr	A
		mov	DPTR, #1ECh
		movx	@DPTR, A
		mov	DPTR, #26Ah
		movx	A, @DPTR
		jz	code_4A19
		mov	DPTR, #1A2h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		setb	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jnc	code_4A10
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_4A10:				
		lcall	code_BC15
		lcall	code_CCB4
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_4A19:				
		mov	R7, #0
		ret
;  code_48F6


; ======================================================


code_4A1C:				
		mov	DPTR, #1B0h
		movx	A, @DPTR
		jnz	code_4A24
		inc	DPTR
		movx	A, @DPTR

code_4A24:				
		jz	code_4A2E
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jz	code_4A47

code_4A2E:				
		mov	DPTR, #95h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jc	code_4A3B
		ljmp	code_4B40
; ---------------------------------------------------------------------------

code_4A3B:				
		lcall	code_AD91
		mov	A, R7
		jnz	code_4A44
		ljmp	code_4B40
; ---------------------------------------------------------------------------

code_4A44:				
		ljmp	code_4B32
; ---------------------------------------------------------------------------

code_4A47:				
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	DPTR, #269h
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_C6AA
		mov	A, R7
		mov	B, #5
		mul	AB
		mov	R7, A
		setb	C
		mov	DPTR, #26Ah
		movx	A, @DPTR
		subb	A, R7
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jc	code_4A82
		ljmp	code_4B22
; ---------------------------------------------------------------------------

code_4A82:				
		lcall	code_C6AA
		mov	R6, #0
		mov	R4, #0FFh
		mov	R5, #0FBh
		lcall	code_10EA
		clr	C
		mov	DPTR, #26Ah
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jnc	code_4AA4
		ljmp	code_4B22
; ---------------------------------------------------------------------------

code_4AA4:				
		mov	DPTR, #95h
		movx	A, @DPTR
		mov	R7, A
		subb	A, #5
		jnc	code_4AB3
		lcall	code_AD91
		mov	A, R7
		jnz	code_4ACD

code_4AB3:				
		mov	R7, #0Ah
		mov	R6, #0
		lcall	code_8806
		mov	DPTR, #95h
		mov	A, R7
		movx	@DPTR, A
		cjne	R7, #0FFh, code_4AC6
		mov	R7, #1
		sjmp	code_4AC8
; ---------------------------------------------------------------------------

code_4AC6:				
		mov	R7, #0

code_4AC8:				
		mov	A, R7
		jz	code_4B40
		sjmp	code_4AB3
; ---------------------------------------------------------------------------

code_4ACD:				
		mov	DPTR, #95h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		mov	A, R7
		xrl	A, #1
		jnz	code_4B40
		mov	DPTR, #95h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #95h
		mov	A, #0FFh
		movx	@DPTR, A
		setb	C
		mov	DPTR, #26Ah
		movx	A, @DPTR
		subb	A, #0
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jc	code_4B05
		lcall	code_C6AA
		mov	DPTR, #1DAh
		clr	A
		mov	B, R7
		lcall	code_1187

code_4B05:				
		clr	C
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jnc	code_4B40
		lcall	code_C6AA
		clr	C
		mov	DPTR, #1DBh
		movx	A, @DPTR
		subb	A, R7
		movx	@DPTR, A
		mov	DPTR, #1DAh
		movx	A, @DPTR
		subb	A, #0
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_4B22:				
		mov	DPTR, #95h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_4B40
		lcall	code_AD91
		mov	A, R7
		jz	code_4B40

code_4B32:				
		mov	DPTR, #95h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #95h
		mov	A, #0FFh
		movx	@DPTR, A

code_4B40:				
		ret
;  code_4A1C


; ======================================================


code_4B41:				
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_74A5
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #0Ah
		mul	AB
		add	A, #42h
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		lcall	code_136E
		lcall	R3R2R1_GetACC_103D
		mov	DPTR, #361h
		movx	@DPTR, A
		mov	A, R7
		mov	B, #0Ah
		mul	AB
		add	A, #42h
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		lcall	code_136E
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	DPTR, #362h
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	B, #0Ah
		mul	AB
		add	A, #41h
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		xrl	A, #1
		jnz	code_4C0C
		mov	DPTR, #30Dh
		inc	A
		movx	@DPTR, A
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R6, A
		mov	B, #0Ah
		mul	AB
		add	A, #45h
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R5, A
		clr	C
		mov	A, #6
		subb	A, R5
		mov	R7, A
		clr	C
		mov	A, #6
		subb	A, R5
		mov	R3, A
		mov	DPTR, #271h
		movx	A, @DPTR
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R6
		mov	B, #0Ah
		mul	AB
		add	A, #46h
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R6, A
		cjne	A, #0FFh, code_4BFB
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R2, A
		mov	R6, A
		sjmp	code_4BFB
; ---------------------------------------------------------------------------

code_4BFB:				
		mov	RAM_1E,	R6
		mov	RAM_1C,	R4
		mov	RAM_1D,	R5
		clr	A
		mov	RAM_1F,	A
		mov	R5, #5
		lcall	code_B88B
		ljmp	code_6D52
; ---------------------------------------------------------------------------

code_4C0C:				
		mov	DPTR, #30Dh
		mov	A, #2
		movx	@DPTR, A
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #0Ah
		mul	AB
		add	A, #47h
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		lcall	code_136E
		mov	A, R7
		mov	B, #0Ah
		mul	AB
		add	A, #4Ah
		mov	DPL, A
		clr	A
		addc	A, #1Fh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R5, A
		mov	DPTR, #271h
		movx	A, @DPTR
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_1D,	A
		mov	RAM_1E,	#2
		mov	RAM_1F,	#4
		lcall	code_BCC9
		lcall	code_A449
		ret
;  code_4B41


; ======================================================


code_4C59:				
		lcall	code_AD1F
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A

code_4C61:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #3
		jc	code_4C89
		mov	A, R7
		setb	C
		subb	A, #1Bh
		jnc	code_4C89
		mov	A, R7
		add	A, #0FDh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_4C89
		ljmp	code_4D52
; ---------------------------------------------------------------------------

code_4C89:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #2
		jc	code_4CB4
		mov	A, R7
		setb	C
		subb	A, #1Ah
		jnc	code_4CB4
		mov	A, R7
		add	A, #0FEh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_4CB4
		mov	DPTR, #104h
		movx	A, @DPTR
		jnz	code_4CB4
		ljmp	code_4D52
; ---------------------------------------------------------------------------

code_4CB4:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #1
		jnc	code_4CCA
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #4
		jc	code_4CCA
		ljmp	code_4D4D
; ---------------------------------------------------------------------------

code_4CCA:				
		mov	A, R7
		setb	C
		subb	A, #2
		jnc	code_4CDB
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #7
		jc	code_4CDB
		sjmp	code_4D4D
; ---------------------------------------------------------------------------

code_4CDB:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		setb	C
		subb	A, #3
		jnc	code_4CEF
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #0Ah
		jc	code_4CEF
		sjmp	code_4D4D
; ---------------------------------------------------------------------------

code_4CEF:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #4
		jnc	code_4D04
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #0Dh
		jc	code_4D04
		sjmp	code_4D4D
; ---------------------------------------------------------------------------

code_4D04:				
		mov	A, R7
		setb	C
		subb	A, #5
		jnc	code_4D15
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #10h
		jc	code_4D15
		sjmp	code_4D4D
; ---------------------------------------------------------------------------

code_4D15:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		setb	C
		subb	A, #6
		jnc	code_4D29
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #13h
		jc	code_4D29
		sjmp	code_4D4D
; ---------------------------------------------------------------------------

code_4D29:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #7
		jnc	code_4D3E
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #16h
		jc	code_4D3E
		sjmp	code_4D4D
; ---------------------------------------------------------------------------

code_4D3E:				
		mov	A, R7
		setb	C
		subb	A, #8
		jnc	code_4D5E
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #19h
		jc	code_4D5E

code_4D4D:				
		mov	A, #1Ch
		movx	@DPTR, A
		sjmp	code_4D5E
; ---------------------------------------------------------------------------

code_4D52:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #1Ch
		jnc	code_4D5E
		ljmp	code_4C61
; ---------------------------------------------------------------------------

code_4D5E:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		clr	C
		subb	A, #1Ch
		jnc	code_4D6D
		lcall	code_4543
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_4D6D:				
		mov	R7, #0
		ret
;  code_4C59


; ======================================================


code_4D70:				
		lcall	code_AD1F
		mov	DPTR, #26Ah
		mov	A, R7
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #64h
		mov	R5, #8
		lcall	code_AC05
		clr	A
		mov	DPTR, #270h
		movx	@DPTR, A

code_4D88:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #270h
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jc	code_4D98
		ljmp	code_4E82
; ---------------------------------------------------------------------------

code_4D98:				
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		orl	A, B
		jnz	code_4DDA
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	RAM_10,	#5
		mov	R5, #2
		mov	R7, A
		mov	R6, A
		ljmp	code_4E6B
; ---------------------------------------------------------------------------

code_4DDA:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	A, R7
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R5
		mov	R7, A
		mov	A, R6
		subb	A, B
		mov	R6, A
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		mov	R3, #10h
		mov	R2, #27h
		mov	R1, A
		mov	R0, A
		lcall	code_1267
		push	RAM_6
		push	RAM_7
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R6, B
		mov	R3, A
		mov	R2, RAM_6
		mov	A, R2
		rlc	A
		subb	A, ACC
		mov	R1, A
		mov	R0, A
		pop	RAM_7
		pop	RAM_6
		lcall	code_A4D3
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	RAM_10,	#5
		mov	R5, #2

code_4E6B:				
		lcall	code_546D
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	R5, #5
		lcall	code_AC05
		mov	DPTR, #270h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_4D88
; ---------------------------------------------------------------------------

code_4E82:				
		ret
;  code_4D70


; ======================================================


code_4E83:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		jnz	code_4E9B

		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00
		mov	A, R7
		dec	A
		mov	R7, A
		lcall	code_B22E
		mov	A, R7
		jz	code_4E98
		ljmp	code_4F79
; ---------------------------------------------------------------------------

code_4E98:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_4E9B:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_4EE4
		mov	A, R7
		setb	C
		subb	A, #19h
		jnc	code_4EE4
		mov	A, R7
		add	A, #0FFh
		mov	R3, A
		clr	A
		addc	A, #0FFh
		mov	R2, A
		mov	R4, #0
		mov	R5, #3
		mov	R7, RAM_3
		mov	R6, A
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_4EE4
		mov	R4, A
		mov	R5, #3
		mov	R7, RAM_3
		mov	R6, RAM_2
		lcall	DIV_10FC
		mov	A, R7
		inc	A
		mov	R7, A
		push	RAM_7
		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00
		mov	R4, RAM_6
		mov	R5, RAM_7
		pop	RAM_7
		lcall	code_7AAA
		mov	A, R7
		jz	code_4EE1
		ljmp	code_4F79
; ---------------------------------------------------------------------------

code_4EE1:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_4EE4:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #2
		jc	code_4F31
		mov	A, R7
		setb	C
		subb	A, #1Ah
		jnc	code_4F31
		mov	A, R7
		mov	R3, A
		mov	R2, #0
		add	A, #0FEh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_4F31
		mov	A, R3
		add	A, #0FFh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R7
		inc	A
		mov	R7, A
		push	RAM_7
		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00
		mov	R4, RAM_6
		mov	R5, RAM_7
		pop	RAM_7
		lcall	code_7D70
		mov	A, R7
		jz	code_4F2E
		sjmp	code_4F79
; ---------------------------------------------------------------------------

code_4F2E:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_4F31:				
		mov	DPTR, #30Eh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #3
		jc	code_4F82
		mov	A, R7
		setb	C
		subb	A, #1Bh
		jnc	code_4F82
		mov	A, R7
		mov	R3, A
		mov	R2, #0
		add	A, #0FDh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R5
		jnz	code_4F82
		mov	A, R3
		add	A, #0FFh
		mov	R7, A
		mov	A, R2
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	A, R7
		inc	A
		mov	R7, A
		push	RAM_7
		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00
		mov	R4, RAM_6
		mov	R5, RAM_7
		pop	RAM_7
		lcall	code_7015
		mov	A, R7
		jz	code_4F7F

code_4F79:				
		lcall	code_CC34
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_4F7F:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_4F82:				
		mov	R7, #0
		ret
;  code_4E83


; ======================================================


code_4F85:				
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_4F94
		inc	DPTR
		movx	A, @DPTR

code_4F94:				
		jnz	code_4FE7
		mov	DPTR, #1ECh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #2, code_4FA3
		mov	DPTR, #26Ah
		sjmp	code_4FB6
; ---------------------------------------------------------------------------

code_4FA3:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_4FB9
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_4FB9
		mov	A, R7
		cjne	A, #3, code_4FB9
		mov	DPTR, #26Bh

code_4FB6:				
		mov	A, #1
		movx	@DPTR, A

code_4FB9:				
		mov	DPTR, #0A4h
		movx	A, @DPTR
		mov	R7, A
		jb	ACC.1, code_4FCE
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.1, code_4FCE
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_4FCE:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_500B
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_500B
		mov	A, R7
		jb	ACC.0, code_500B
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.0, code_500B
		sjmp	code_5005
; ---------------------------------------------------------------------------

code_4FE7:				
		mov	DPTR, #2Dh
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.1, code_4FF5
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_4FF5:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_500B
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_500B
		mov	A, R7
		jnb	ACC.0, code_500B

code_5005:				
		mov	DPTR, #26Bh
		mov	A, #1
		movx	@DPTR, A

code_500B:				
		clr	A
		mov	DPTR, #1ECh
		movx	@DPTR, A
		mov	DPTR, #26Ah
		movx	A, @DPTR
		jz	code_5020
		mov	DPTR, #0F1h
		movx	A, @DPTR
		jz	code_5020
		mov	R7, #1
		sjmp	code_5022
; ---------------------------------------------------------------------------

code_5020:				
		mov	R7, #0

code_5022:				
		mov	DPTR, #26Ah
		mov	A, R7
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		jz	code_5035
		mov	DPTR, #0A8h
		movx	A, @DPTR
		jz	code_5035
		mov	R7, #1
		sjmp	code_5037
; ---------------------------------------------------------------------------

code_5035:				
		mov	R7, #0

code_5037:				
		mov	DPTR, #26Bh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #26Ah
		movx	A, @DPTR
		jz	code_5059
		inc	DPTR
		movx	A, @DPTR
		jz	code_5059
		mov	DPTR, #97h
		movx	A, @DPTR
		cjne	A, #1, code_5054
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A
		sjmp	code_5059
; ---------------------------------------------------------------------------

code_5054:				
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_5059:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		jz	code_5063
		mov	R7, #1
		sjmp	code_506F
; ---------------------------------------------------------------------------

code_5063:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		jz	code_506D
		mov	R7, #2
		sjmp	code_506F
; ---------------------------------------------------------------------------

code_506D:				
		mov	R7, #0

code_506F:				
		mov	DPTR, #41h
		mov	A, R7
		movx	@DPTR, A
		jz	code_5082
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_507F
		lcall	code_B76C

code_507F:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_5082:				
		mov	R7, #0
		ret
;  code_4F85


; ======================================================


code_5085:				
		mov	RAM_19,	R3
		mov	RAM_1A,	R2
		mov	RAM_1B,	R1
		mov	RAM_1C,	R5
		clr	A
		mov	DPTR, #27Ah
		movx	@DPTR, A
		mov	DPTR, #277h
		movx	@DPTR, A
		mov	A, RAM_1C
		dec	A
		inc	DPTR
		movx	@DPTR, A

code_509B:				
		lcall	code_A7E3
		mov	A, R7
		cpl	A
		jnz	code_50D7
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	DPTR, #277h
		movx	A, @DPTR
		mov	R7, A
		rlc	A
		subb	A, ACC
		mov	DPL, R7
		mov	DPH, A
		lcall	R3R2R1_GetACC_1056
		cjne	A, #40h, code_50C0
		mov	DPTR, #27Ah
		mov	A, #1
		movx	@DPTR, A

code_50C0:				
		mov	DPTR, #277h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R5, A
		rlc	A
		subb	A, ACC
		mov	R4, A
		clr	C
		mov	A, R5
		subb	A, RAM_1C
		mov	A, #80h
		mov	R0, A
		xrl	A, R4
		subb	A, R0
		jc	code_509B

code_50D7:				
		mov	DPTR, #277h
		movx	A, @DPTR
		mov	R5, A
		rlc	A
		subb	A, ACC
		mov	R4, A
		clr	C
		mov	A, R5
		subb	A, RAM_1C
		mov	A, #80h
		mov	R0, A
		xrl	A, R4
		subb	A, R0
		jc	code_50EF
		clr	A
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_50EF:				
		lcall	code_A7E3
		cjne	R7, #0FFh, code_5103
		mov	DPTR, #278h
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		xrl	A, #80h
		subb	A, #80h
		jnc	code_50EF

code_5103:				
		clr	A
		mov	DPTR, #27Bh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #277h
		movx	A, @DPTR
		mov	DPTR, #279h
		movx	@DPTR, A

code_5112:				
		mov	DPTR, #278h
		movx	A, @DPTR
		mov	R7, A
		rlc	A
		subb	A, ACC
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		setb	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, #80h
		subb	A, R0
		jnc	code_5162
		mov	DPTR, #27Bh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_10EA
		mov	DPTR, #27Bh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	DPTR, #279h
		movx	A, @DPTR
		mov	DPL, A
		mov	DPH, #0
		lcall	code_A7F5
		mov	DPTR, #27Bh
		clr	A
		mov	B, R7
		lcall	code_1187
		mov	DPTR, #279h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_5112
; ---------------------------------------------------------------------------

code_5162:				
		mov	DPTR, #27Ah
		movx	A, @DPTR
		jz	code_517B
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		clr	A
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	DPTR, #27Bh
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

code_517B:				
		mov	DPTR, #27Bh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_5085


; ======================================================


code_5184:				
		mov	RAM_10,	R3
		mov	RAM_11,	R2
		mov	RAM_12,	R1
		lcall	code_C52B
		mov	A, R7
		jz	code_5193
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_5193:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #3
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		cpl	A
		jz	code_51C6
		mov	A, R1
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, R2
		mov	R2, A
		mov	B, #2
		mov	A, R7
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		clr	C
		mov	A, R5
		subb	A, R7
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jnc	code_51D8

code_51C6:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	DPTR, #3
		lcall	code_10C8

code_51D8:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #4
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		cpl	A
		jz	code_520B
		mov	A, R1
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, R2
		mov	R2, A
		mov	B, #2
		mov	A, R7
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		setb	C
		mov	A, R5
		subb	A, R7
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_521D

code_520B:				
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	DPTR, #4
		lcall	code_10C8

code_521D:				
		mov	R3, RAM_10
		mov	A, RAM_12
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_11
		mov	R2, A
		push	RAM_2
		push	RAM_1
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		pop	RAM_1
		pop	RAM_2
		mov	A, R4
		mov	B, R5
		lcall	code_121F
		mov	R3, RAM_10
		mov	R2, RAM_11
		mov	R1, RAM_12
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #2
		mov	A, R5
		lcall	code_10C8
		mov	DPTR, #5
		mov	A, #1
		lcall	code_1083
		mov	DPTR, #6
		mov	A, #1
		lcall	code_10C8
		mov	R7, #1
		ret
;  code_5184

; ---------------------------------------------------------------------------
		db  20h
		db 0BBh
		db 0B6h
		db 0D3h
		db 0ADh
		db 0CAh
		db 0B9h
		db 0D3h
		db 0C3h
		db  20h
		db    0
		db  58h
		db  4Bh
		db  33h
		db  31h
		db  31h
		db  30h
		db 0D2h
		db 0C7h
		db 0B1h
		db 0EDh
		db    0
		db  77h
		db  77h
		db  77h
		db  2Eh
		db  6Ch
		db  79h
		db  62h
		db  65h
		db  2Eh
		db  63h
		db  6Eh
		db    0
		db 0BBh
		db 0B6h
		db 0D3h
		db 0ADh
		db 0CAh
		db 0B9h
		db 0D3h
		db 0C3h
		db  58h
		db  4Bh
		db  2Dh
		db  33h
		db  31h
		db  31h
		db  30h
		db 0D2h
		db 0C7h
		db 0B1h
		db 0EDh
		db    0
		db 0C5h
		db 0FAh
		db 0B4h
		db 0CEh
		db    0
		db 0C5h
		db 0E4h
		db 0B7h
		db 0BDh
		db    0
		db 0CEh
		db 0EFh
		db 0C1h
		db 0CFh
		db    0
		db 0C5h
		db 0E4h
		db 0B7h
		db 0BDh
		db 0D6h
		db 0B5h
		db    0
		db 0CDh
		db 0EAh
		db 0B3h
		db 0C9h
		db 0D6h
		db 0B5h
		db    0
		db 0D7h
		db 0DCh
		db 0BCh
		db 0C6h
		db    0
		db 0CEh
		db 0F3h
		db 0B2h
		db 0EEh
		db 0C2h
		db 0CAh
		db    0
		db 0C5h
		db 0FAh
		db  20h
		db  20h
		db 0B4h
		db 0CEh
		db 0A3h
		db 0BAh
		db    0
		db 0C5h
		db 0E4h
		db  20h
		db  20h
		db 0B7h
		db 0BDh
		db 0A3h
		db 0BAh
		db    0
		db 0C9h
		db 0FAh
		db 0B2h
		db 0FAh
		db 0CAh
		db 0B1h
		db 0BCh
		db 0E4h
		db 0A3h
		db 0BAh
		db    0
		db 0BAh
		db 0CFh
		db  20h
		db  20h
		db 0BCh
		db 0C6h
		db 0A3h
		db 0BAh
		db    0
		db 0CEh
		db 0EFh
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db 0A3h
		db 0BAh
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  31h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  32h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  33h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  34h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  35h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  36h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  37h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  38h
		db  20h
		db  20h
		db    0
		db  20h
		db  20h
		db 0C1h
		db 0CFh
		db  39h
		db  20h
		db  20h
		db    0
		db 0C4h
		db 0BFh
		db 0B1h
		db 0EAh
		db 0D6h
		db 0B5h
		db 0A3h
		db 0BAh
		db    0
		db 0CDh
		db 0EAh
		db 0B3h
		db 0C9h
		db 0D6h
		db 0B5h
		db 0A3h
		db 0BAh
		db    0
		db 0CEh
		db 0F3h
		db 0B2h
		db 0EEh
		db 0C2h
		db 0CAh
		db 0A3h
		db 0BAh
		db    0

; ======================================================


code_536D:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #9Bh
		lcall	code_8877
		mov	A, R7
		jnz	code_53C4
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	R7, #2Dh
		ljmp	code_5450
; ---------------------------------------------------------------------------

code_53C4:				
		mov	DPTR, #19Bh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		lcall	code_C875
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	DPTR, #19Ch
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #19Ch
		lcall	code_C878
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	DPTR, #19Dh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #19Dh
		lcall	code_C878
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #19Eh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #0Ah
		jc	code_5425
		mov	A, R7
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		sjmp	code_5427
; ---------------------------------------------------------------------------

code_5425:				
		mov	R7, #20h

code_5427:				
		lcall	WhileSendR7_C882
		mov	DPTR, #19Eh
		lcall	code_C878
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	DPTR, #19Fh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #19Fh
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	A, B
		add	A, #30h
		mov	R7, A

code_5450:				
		lcall	WhileSendR7_C882
		mov	R7, #0Dh
		ljmp	WhileSendR7_C882
;  code_536D


; ======================================================


code_5458:				
		mov	R2, #2
		mov	R1, #6Ah
code_545C:				
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	RAM_10,	#5
;  code_545C


; ======================================================


code_546D:				
		mov	RAM_A, R6
		mov	RAM_B, R7
		mov	RAM_C, R5
		mov	RAM_D, R3
		mov	RAM_E, R2
		mov	RAM_F, R1
		clr	A
		mov	DPTR, #276h
		movx	@DPTR, A

code_547E:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, RAM_10
		jnc	code_54A0
		mov	R3, RAM_D
		mov	R2, RAM_E
		mov	R1, RAM_F
		mov	DPL, R7
		mov	DPH, #0
		mov	A, #20h
		lcall	code_10C8
		mov	DPTR, #276h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_547E
; ---------------------------------------------------------------------------

code_54A0:				
		clr	A
		mov	DPTR, #276h
		movx	@DPTR, A

code_54A5:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, RAM_C, code_54D2
		mov	A, RAM_C
		setb	C
		subb	A, #0
		jc	code_54D2
		mov	A, RAM_10
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, #0
		xch	A, R7
		add	A, #0FFh
		xch	A, R7
		addc	A, #0FFh
		mov	R3, RAM_D
		mov	R2, RAM_E
		mov	R1, RAM_F
		mov	DPL, R7
		mov	DPH, A
		mov	A, #2Eh
		lcall	code_10C8
		sjmp	code_5511
; ---------------------------------------------------------------------------

code_54D2:				
		mov	R6, RAM_A
		mov	R7, RAM_B
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_1151
		mov	A, R5
		add	A, #30h
		mov	R7, A
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R5, A
		mov	A, RAM_10
		clr	C
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, #0
		xch	A, R5
		add	A, #0FFh
		xch	A, R5
		addc	A, #0FFh
		mov	R3, RAM_D
		mov	R2, RAM_E
		mov	R1, RAM_F
		mov	DPL, R5
		mov	DPH, A
		mov	A, R7
		lcall	code_10C8
		mov	R6, RAM_A
		mov	R7, RAM_B
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_1151
		mov	RAM_A, R6
		mov	RAM_B, R7

code_5511:				
		mov	DPTR, #276h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, RAM_10
		jnc	code_5542
		mov	A, RAM_C
		add	A, #1
		mov	R5, A
		clr	A
		rlc	A
		mov	R4, A
		setb	C
		mov	A, R7
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, #80h
		subb	A, R0
		jnc	code_5539
		mov	A, RAM_C
		jz	code_5539
		ljmp	code_54A5
; ---------------------------------------------------------------------------

code_5539:				
		mov	A, RAM_B
		orl	A, RAM_A
		jz	code_5542
		ljmp	code_54A5
; ---------------------------------------------------------------------------

code_5542:				
		ret
;  code_546D


; ======================================================


code_5543:				
		mov	RAM_9, R7
		mov	DPTR, #1C2h
		movx	A, @DPTR
		jnz	code_554F
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #1

code_554F:				
		jz	code_5554
		ljmp	code_562D
; ---------------------------------------------------------------------------

code_5554:				
		mov	A, R3
		add	A, R5
		mov	R7, A
		mov	A, R2
		addc	A, R4
		mov	R6, A
		mov	R4, #0
		mov	R5, #2
		lcall	code_1151
		mov	R2, RAM_6
		mov	R3, RAM_7
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R4, #0
		mov	R5, #2
		lcall	code_1151
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R6
		addc	A, R2
		mov	R6, A
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	A, RAM_9
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_5605
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_5605
		mov	A, R7
		add	A, #0FFh
		mov	R7, A
		mov	A, R6
		addc	A, #0FFh
		mov	R6, A
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

code_5605:				
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_562D
		mov	A, RAM_9
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_562D:				
		ret
;  code_5543

; ---------------------------------------------------------------------------

code_562E:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		clr	A
		cjne	A, RAM_14, code_5657
		mov	A, RAM_13
		cjne	A, #2, code_5657
		lcall	R3R2R1_GetACC_103D
		jz	code_5649
		ljmp	code_5715
; ---------------------------------------------------------------------------

code_5649:				
		lcall	code_BBCF
		mov	A, R7
		jz	code_5652
		ljmp	code_5715
; ---------------------------------------------------------------------------

code_5652:				
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_5657:				
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_A01E
		mov	A, R7
		jnz	code_5664
		ljmp	code_5715
; ---------------------------------------------------------------------------

code_5664:				
		mov	DPTR, #2F6h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_5675
		mov	A, R7
		xrl	A, #4
		jz	code_5675
		ljmp	code_56FD
; ---------------------------------------------------------------------------

code_5675:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jnz	code_5681
		ljmp	code_5715
; ---------------------------------------------------------------------------

code_5681:				
		mov	A, R7
		xrl	A, #4
		jnz	code_5689
		ljmp	code_5715
; ---------------------------------------------------------------------------

code_5689:				
		mov	A, RAM_14
		jnz	code_5691
		mov	A, RAM_13
		xrl	A, #4

code_5691:				
		jz	code_569B
		mov	A, RAM_14
		xrl	A, #2
		orl	A, RAM_13
		jnz	code_5715

code_569B:				
		clr	A
		mov	DPTR, #374h
		movx	@DPTR, A
		mov	DPTR, #373h
		movx	@DPTR, A
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_5715
		clr	A
		cjne	A, RAM_14, code_56D6
		mov	A, RAM_13
		cjne	A, #4, code_56D6
		mov	DPTR, #311h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #2FDh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		mov	A, #5
		subb	A, R6
		mov	R6, A
		mov	A, #1
		mov	R0, RAM_6
		inc	R0
		sjmp	code_56D0
; ---------------------------------------------------------------------------

code_56CE:				
		clr	C
		rlc	A

code_56D0:				
		djnz	R0, code_56CE
		cpl	A
		anl	A, R7
		sjmp	code_56F1
; ---------------------------------------------------------------------------

code_56D6:				
		mov	DPTR, #311h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #2FDh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		mov	A, #5
		subb	A, R6
		mov	R6, A
		mov	A, #1
		mov	R0, RAM_6
		inc	R0
		sjmp	code_56EE
; ---------------------------------------------------------------------------

code_56EC:				
		clr	C
		rlc	A

code_56EE:				
		djnz	R0, code_56EC
		orl	A, R7

code_56F1:				
		mov	DPTR, #311h
		movx	@DPTR, A
		mov	DPTR, #311h
		movx	A, @DPTR
		mov	R7, A
		ljmp	code_75EB
; ---------------------------------------------------------------------------

code_56FD:				
		mov	DPTR, #2F6h
		movx	A, @DPTR
		cjne	A, #5, code_5715
		mov	A, RAM_14
		xrl	A, #2
		orl	A, RAM_13
		jnz	code_5715
		lcall	code_C7F2
		lcall	code_C994
		lcall	code_CCC0

code_5715:				
		ret

; ======================================================


code_5716:				
		lcall	code_9C90
		lcall	code_854E
		mov	A, R7
		jnz	code_5725
		lcall	code_C1C9
		lcall	code_8720

code_5725:				
		lcall	code_B1C9
		mov	A, R7
		jnz	code_5734
		mov	DPTR, #29h
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A
		sjmp	code_5737
; ---------------------------------------------------------------------------

code_5734:				
		lcall	code_28A2

code_5737:				
		lcall	code_A660
		mov	A, R7
		jnz	code_5743
		lcall	code_C1FF
		lcall	code_A378

code_5743:				
		lcall	returnR7_9714
		mov	A, R7
		jnz	code_5750
	;	sjmp	code_5750
			
		mov	DPTR, #29h
		movx	A, @DPTR
	;	orl	A, #10h
		nop
		nop
		movx	@DPTR, A

code_5750:				
		lcall	code_A6A1
		mov	A, R7
		jnz	code_575C
		lcall	code_B80B
		lcall	code_A95F

code_575C:				
		lcall	code_C3E1
		mov	A, R7
		jnz	code_5769
		mov	DPTR, #29h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A

code_5769:				
		lcall	code_AC37
		mov	A, R7
		jnz	code_5775
		
		lcall	code_7BCD
		
		lcall	IAP_program_A8A2

code_5775:				
		lcall	code_69B5
		lcall	code_AC71
		mov	A, R7
		jnz	code_5784
		lcall	code_B597
		lcall	code_A8E1

code_5784:				
		lcall	code_7EFC
		lcall	code_A61F
		mov	A, R7
		jnz	code_5793
		lcall	code_CECA
		lcall	code_A332

code_5793:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		clr	C
		rrc	A
		inc	A
		mov	R7, A
		lcall	code_7404
		mov	A, R7
		jnz	code_57A7
		lcall	code_ADC9
		lcall	code_6F66

code_57A7:				
		lcall	code_A723
		lcall	code_8AA0
		lcall	code_43F8
		lcall	code_ACAB
		mov	A, R7
		jnz	code_57BC
		lcall	code_ACE5
		lcall	code_A920

code_57BC:				
		lcall	code_63AC
		lcall	code_A0F7
		mov	DPTR, #139h
		movx	A, @DPTR
		jz	code_57D6
		lcall	code_9B53
		mov	A, R7
		jnz	code_57DC
		lcall	code_9B53
		mov	A, R7
		jnz	code_57DC
		sjmp	code_57D6
; ---------------------------------------------------------------------------

code_57D6:				
		lcall	code_CBBC
		lcall	code_9E13

code_57DC:				
		lcall	code_BB65
		mov	A, R7
		jz	code_57E8
		lcall	code_9664
		mov	A, R7
		jnz	code_57F8

code_57E8:				
		lcall	code_C83E
		mov	DPTR, #8Eh
		movx	A, @DPTR
		jnz	code_57F5
		mov	DPTR, #3A4h
		movx	@DPTR, A

code_57F5:				
		lcall	code_BD8B

code_57F8:				
		mov	RAM_3B,	#1
		ret
;  code_5716


; ======================================================


code_57FC:				
		mov	RAM_1E,	R3
		mov	RAM_1F,	R2
		mov	RAM_20,	R1
		lcall	code_CB83
		mov	A, R7
		jz	code_580B
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_580B:				
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #3
		lcall	R3R2R1_GetACC_1056
		cjne	A, RAM_7, code_5829
		mov	DPTR, #3
		mov	A, #0FFh
		lcall	code_10C8

code_5829:				
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #4
		lcall	R3R2R1_GetACC_1056
		cjne	A, RAM_7, code_5847
		mov	DPTR, #4
		mov	A, #0FFh
		lcall	code_10C8

code_5847:				
		mov	A, RAM_23
		orl	A, RAM_22
		jz	code_5884
		mov	R3, RAM_1E
		mov	A, RAM_20
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_1F
		mov	R2, A
		push	RAM_2
		push	RAM_1
		mov	R2, RAM_1F
		mov	R1, RAM_20
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		pop	RAM_1
		pop	RAM_2
		lcall	code_11C8
		mov	R7, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		mov	A, B
		mov	B, R7
		lcall	code_1200

code_5884:				
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #1
		mov	A, R5
		lcall	code_10C8
		mov	DPTR, #5
		mov	A, #0FFh
		lcall	code_1083
		mov	DPTR, #3
		lcall	R3R2R1_GetACC_1056
		cjne	A, #0FFh, code_58BE
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		lcall	code_5B86

code_58BE:				
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		mov	DPTR, #4
		lcall	R3R2R1_GetACC_1056
		cjne	A, #0FFh, code_58D0
		lcall	code_5C62

code_58D0:				
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		mov	DPTR, #6
		mov	A, #1
		lcall	code_10C8
		mov	R7, #1
		ret
;  code_57FC


; ======================================================


TF0_0:					
		push	ACC
		push	B
		push	DPH
		push	DPL
		push	PSW
		mov	PSW, #0
		push	RAM_0
		push	RAM_1
		push	RAM_2
		push	RAM_3
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	TL0, #0CEh
		mov	TH0, #0F8h
		lcall	IO_Init_CA8F
		mov	DPTR, #356h
		movx	A, @DPTR
		mov	R7, A
		add	A, #0FAh
		jnc	code_5914
		jz	code_596C
		sjmp	code_5972
; ---------------------------------------------------------------------------

code_5914:				
		mov	DPTR, #EEPROM_DONE_35E
		movx	A, @DPTR
		jnz	code_591F
		mov	P2, #0FFh
		sjmp	code_5962
; ---------------------------------------------------------------------------

code_591F:				
		mov	DPTR, #373h
		movx	A, @DPTR
		jz	code_5951
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		jz	code_5951
		mov	DPTR, #356h
		movx	A, @DPTR
		mov	R7, A
		add	A, #67h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		cpl	A
		mov	R6, A
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		anl	A, R6
		sjmp	code_595F
; ---------------------------------------------------------------------------

code_5951:				
		mov	DPTR, #356h
		movx	A, @DPTR
		add	A, #61h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR

code_595F:				
		cpl	A
		mov	P2, A

code_5962:				
		mov	DPTR, #356h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_927B
		sjmp	code_5972
; ---------------------------------------------------------------------------

code_596C:				
		lcall	code_6CA0
		lcall	code_AFF0

code_5972:				
		lcall	code_921C
		lcall	code_CACF
		mov	DPTR, #374h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #0FAh
		jc	code_5997
		clr	A
		movx	@DPTR, A
		mov	DPTR, #373h
		movx	A, @DPTR
		jnz	code_5990
		mov	R7, #1
		sjmp	code_5992
; ---------------------------------------------------------------------------

code_5990:				
		mov	R7, #0

code_5992:				
		mov	DPTR, #373h
		mov	A, R7
		movx	@DPTR, A

code_5997:				
		mov	DPTR, #356h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #7
		lcall	DIV_10FC
		mov	A, R5
		movx	@DPTR, A
		pop	RAM_7
		pop	RAM_6
		pop	RAM_5
		pop	RAM_4
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		pop	PSW
		pop	DPL
		pop	DPH
		pop	B
		pop	ACC
		reti
;  TF0_0


; ======================================================


code_59C5:				
		clr	A
		mov	DPTR, #2BEh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		inc	A
		movx	@DPTR, A

code_59CF:				
		mov	DPTR, #2C0h
		movx	A, @DPTR
		mov	R5, A
		setb	C
		subb	A, #4
		jc	code_59DC
		ljmp	code_5A9E
; ---------------------------------------------------------------------------

code_59DC:				
		mov	DPTR, #2BFh
		movx	A, @DPTR
		swap	A
		mov	R0, A
		anl	A, #0Fh
		xch	A, R0
		xrl	A, R0
		movx	@DPTR, A
		mov	DPTR, #2BEh
		movx	A, @DPTR
		swap	A
		anl	A, #0F0h
		orl	A, R0
		movx	@DPTR, A
		mov	A, R5
		cjne	A, #1, code_59F7
		clr	C
		sjmp	code_59F8
; ---------------------------------------------------------------------------

code_59F7:				
		setb	C

code_59F8:				
		mov	P0.6, C
		mov	DPTR, #2C0h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #2, code_5A05
		clr	C
		sjmp	code_5A06
; ---------------------------------------------------------------------------

code_5A05:				
		setb	C

code_5A06:				
		mov	P0.7, C
		mov	A, R7
		cjne	A, #3, code_5A0F
		clr	C
		sjmp	code_5A10
; ---------------------------------------------------------------------------

code_5A0F:				
		setb	C

code_5A10:				
		mov	P4.6, C
		mov	DPTR, #2C0h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #4, code_5A1D
		clr	C
		sjmp	code_5A1E
; ---------------------------------------------------------------------------

code_5A1D:				
		setb	C

code_5A1E:				
		mov	P4.1, C
		mov	A, R7
		cjne	A, #5, code_5A27
		clr	C
		sjmp	code_5A28
; ---------------------------------------------------------------------------

code_5A27:				
		setb	C

code_5A28:				
		mov	P4.5, C
		mov	DPTR, #2C0h
		movx	A, @DPTR
		cjne	A, #6, code_5A34
		clr	C
		sjmp	code_5A35
; ---------------------------------------------------------------------------

code_5A34:				
		setb	C

code_5A35:				
		mov	P4.4, C
		clr	A
		mov	DPTR, #2C1h
		movx	@DPTR, A

code_5A3C:				
		mov	DPTR, #2C1h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #64h, code_5A3C
		clr	A
		mov	DPTR, #2BDh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jnb	P0.5, code_5A54
		mov	R6, #1
		sjmp	code_5A56
; ---------------------------------------------------------------------------

code_5A54:				
		mov	R6, #0

code_5A56:				
		mov	A, R7
		orl	A, R6
		mov	DPTR, #2BDh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jnb	P0.4, code_5A65
		mov	R6, #2
		sjmp	code_5A67
; ---------------------------------------------------------------------------

code_5A65:				
		mov	R6, #0

code_5A67:				
		mov	A, R7
		orl	A, R6
		mov	DPTR, #2BDh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jnb	P0.3, code_5A76
		mov	R6, #4
		sjmp	code_5A78
; ---------------------------------------------------------------------------

code_5A76:				
		mov	R6, #0

code_5A78:				
		mov	A, R7
		orl	A, R6
		mov	DPTR, #2BDh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jnb	P0.2, code_5A87
		mov	R6, #8
		sjmp	code_5A89
; ---------------------------------------------------------------------------

code_5A87:				
		mov	R6, #0

code_5A89:				
		mov	A, R7
		orl	A, R6
		mov	R7, A
		mov	DPTR, #2BDh
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		orl	A, R7
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_59CF
; ---------------------------------------------------------------------------

code_5A9E:				
		mov	DPTR, #2BEh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_59C5


; ======================================================


code_5AA7:				
		mov	RAM_18,	R6
		mov	RAM_19,	R7
		mov	DPTR, #6EB5h
		mov	B, #6
		mov	A, R7
		lcall	code_1340
		mov	A, R6
		mov	B, #6
		mul	AB
		add	A, DPH
		mov	DPH, A
		setb	C
		mov	A, #1
		movc	A, @A+DPTR
		subb	A, R5
		clr	A
		movc	A, @A+DPTR
		subb	A, R4
		jnc	code_5AE5
		mov	DPTR, #6EB7h
		mov	B, #6
		mov	A, R7
		lcall	code_1340
		mov	A, R6
		mov	B, #6
		mul	AB
		add	A, DPH
		mov	DPH, A
		clr	C
		mov	A, #1
		movc	A, @A+DPTR
		subb	A, R5
		clr	A
		movc	A, @A+DPTR
		subb	A, R4
		jnc	code_5AE8

code_5AE5:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_5AE8:				
		mov	A, RAM_19
		add	A, ACC
		mov	R3, A
		mov	A, RAM_18
		rlc	A
		mov	R2, A
		mov	A, #0A2h
		add	A, R3
		mov	DPL, A
		mov	A, #1
		addc	A, R2
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		cjne	A, RAM_5, code_5B09
		mov	A, R6
		cjne	A, RAM_4, code_5B09
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_5B09:				
		mov	A, #0A2h
		add	A, R3
		mov	DPL, A
		mov	A, #1
		addc	A, R2
		mov	DPH, A
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		mov	A, RAM_19
		xrl	A, #5
		orl	A, RAM_18
		jnz	code_5B25
		lcall	nullsub_5
		sjmp	code_5B64
; ---------------------------------------------------------------------------

code_5B25:				
		mov	A, RAM_19
		xrl	A, #11h
		orl	A, RAM_18
		jnz	code_5B32
		lcall	code_CA7F
		sjmp	code_5B64
; ---------------------------------------------------------------------------

code_5B32:				
		mov	A, RAM_19
		xrl	A, #0Ah
		orl	A, RAM_18
		jnz	code_5B3F
		lcall	code_CA0B
		sjmp	code_5B64
; ---------------------------------------------------------------------------

code_5B3F:				
		mov	A, RAM_19
		xrl	A, #0Bh
		orl	A, RAM_18
		jnz	code_5B4C
		lcall	code_CA1C
		sjmp	code_5B64
; ---------------------------------------------------------------------------

code_5B4C:				
		mov	A, RAM_19
		xrl	A, #12h
		orl	A, RAM_18
		jnz	code_5B59
		lcall	code_70C4
		sjmp	code_5B64
; ---------------------------------------------------------------------------

code_5B59:				
		mov	A, RAM_19
		xrl	A, #16h
		orl	A, RAM_18
		jnz	code_5B64
		lcall	code_CDAC

code_5B64:				
		mov	DPTR, #0F4h
		movx	A, @DPTR
		jnz	code_5B7E
		
		lcall	ClearState_CE40
		lcall	IAP_program_A8A2
		
		mov	DPTR, #274h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_5B7E:				
		mov	DPTR, #0B2h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_5AA7


; ======================================================


code_5B86:				
		mov	RAM_24,	R3
		mov	RAM_25,	R2
		mov	RAM_26,	R1
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		jnz	code_5B9C
		mov	DPTR, #3
		mov	A, #0FFh
		ljmp	code_5C5E
; ---------------------------------------------------------------------------

code_5B9C:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	DPTR, #275h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #1
		movx	@DPTR, A

code_5BB0:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jc	code_5BC9
		ljmp	code_5C51
; ---------------------------------------------------------------------------

code_5BC9:				
		mov	A, R1
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, R2
		mov	R2, A
		push	RAM_2
		push	RAM_1
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		mov	A, R6
		add	A, R5
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	B, #2
		mov	A, R5
		mul	AB
		mov	DPL, A
		mov	DPH, B
		pop	RAM_1
		pop	RAM_2
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, RAM_26
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_25
		mov	R2, A
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	A, R6
		xrl	A, #80h
		subb	A, R0
		jnc	code_5C48
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #276h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #275h
		mov	A, R5
		movx	@DPTR, A

code_5C48:				
		mov	DPTR, #276h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_5BB0
; ---------------------------------------------------------------------------

code_5C51:				
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #3

code_5C5E:				
		lcall	code_10C8
		ret
;  code_5B86


; ======================================================


code_5C62:				
		mov	RAM_24,	R3
		mov	RAM_25,	R2
		mov	RAM_26,	R1
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		jnz	code_5C78
		mov	DPTR, #4
		mov	A, #0FFh
		ljmp	code_5D3A
; ---------------------------------------------------------------------------

code_5C78:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	DPTR, #275h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #1
		movx	@DPTR, A

code_5C8C:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jc	code_5CA5
		ljmp	code_5D2D
; ---------------------------------------------------------------------------

code_5CA5:				
		mov	A, R1
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, R2
		mov	R2, A
		push	RAM_2
		push	RAM_1
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		mov	A, R6
		add	A, R5
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	B, #2
		mov	A, R5
		mul	AB
		mov	DPL, A
		mov	DPH, B
		pop	RAM_1
		pop	RAM_2
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	A, RAM_26
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, RAM_25
		mov	R2, A
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		setb	C
		mov	A, R7
		subb	A, R5
		mov	A, B
		xrl	A, #80h
		mov	R0, A
		mov	A, R6
		xrl	A, #80h
		subb	A, R0
		jc	code_5D24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #276h
		movx	A, @DPTR
		add	A, R7
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	DPTR, #275h
		mov	A, R5
		movx	@DPTR, A

code_5D24:				
		mov	DPTR, #276h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_5C8C
; ---------------------------------------------------------------------------

code_5D2D:				
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #4

code_5D3A:				
		lcall	code_10C8
		ret
;  code_5C62

; ---------------------------------------------------------------------------

code_5D3E:				
		mov	RAM_E, R4
		mov	RAM_F, R5
		mov	A, R7
		jz	code_5D8A
		mov	DPTR, #26h
		movx	A, @DPTR
		jnz	code_5D60
		mov	DPTR, #164h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_5DD1
		clr	A
		movx	@DPTR, A
		mov	DPTR, #26h
		inc	A
		movx	@DPTR, A
		sjmp	code_5DD1
; ---------------------------------------------------------------------------

code_5D60:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		lcall	code_CB83
		mov	A, R7
		jnz	code_5D7D
		mov	RAM_21,	A
		mov	RAM_22,	A
		mov	RAM_23,	A
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		lcall	code_57FC
		sjmp	code_5D60
; ---------------------------------------------------------------------------

code_5D7D:				
		clr	A
		mov	DPTR, #12Ah
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #5Eh
		movx	@DPTR, A
		sjmp	code_5DD1
; ---------------------------------------------------------------------------

code_5D8A:				
		clr	A
		mov	DPTR, #26h
		movx	@DPTR, A
		mov	DPTR, #164h
		movx	@DPTR, A

code_5D93:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		lcall	code_C52B
		mov	A, R7
		jz	code_5DB3
		mov	RAM_21,	#0
		mov	RAM_22,	#0
		mov	RAM_23,	#0
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		lcall	code_57FC
		sjmp	code_5D93
; ---------------------------------------------------------------------------

code_5DB3:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		mov	R5, RAM_F
		mov	R4, RAM_E
		lcall	code_5184
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		lcall	code_1836
		mov	DPTR, #12Ah
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

code_5DD1:				
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_5DDB
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #1

code_5DDB:				
		jz	code_5DF6
		clr	A
		mov	DPTR, #26h
		movx	@DPTR, A
		mov	DPTR, #5Eh
		movx	@DPTR, A
		mov	DPTR, #29h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.0, code_5DF1
		anl	A, #0FEh
		movx	@DPTR, A

code_5DF1:				
		lcall	code_3BFA
		sjmp	code_5E0C
; ---------------------------------------------------------------------------

code_5DF6:				
		mov	DPTR, #26h
		movx	A, @DPTR
		mov	DPTR, #29h
		jz	code_5E05
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		sjmp	code_5E09
; ---------------------------------------------------------------------------

code_5E05:				
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A

code_5E09:				
		lcall	code_86AD

code_5E0C:				
		lcall	code_9FD5
		mov	DPTR, #12Ch
		mov	A, #1
		movx	@DPTR, A
		ret

; ======================================================


code_5E16:				
		mov	RAM_9, R7
		mov	A, R7
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		orl	A, B
		jnz	code_5E49
		ljmp	code_5EE7
; ---------------------------------------------------------------------------

code_5E49:				
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	A, RAM_9
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	A, RAM_9
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	RAM_10,	#5
		lcall	code_546D
		mov	R2, #2
		mov	R1, #6Bh
		lcall	code_AC01
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	A, RAM_9
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	RAM_10,	#5
		lcall	code_546D
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	R5, #5
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882

code_5EE7:				
		ret
;  code_5E16


; ======================================================


code_5EE8:				
		lcall	code_AD1F
		mov	DPTR, #26Ah
		mov	A, R7
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #1
		mov	R5, #8
		lcall	code_AC05
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #1
		jc	code_5F0F
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #0Ah
		mov	R5, #7
		lcall	code_AC05

code_5F0F:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jc	code_5F23
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #12h
		mov	R5, #7
		lcall	code_AC05

code_5F23:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #3
		jc	code_5F37
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #1Ah
		mov	R5, #7
		lcall	code_AC05

code_5F37:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #4
		jc	code_5F4B
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #22h
		mov	R5, #7
		lcall	code_AC05

code_5F4B:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_5F5F
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #2Ah
		mov	R5, #7
		lcall	code_AC05

code_5F5F:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #6
		jc	code_5F73
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #32h
		mov	R5, #7
		lcall	code_AC05

code_5F73:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #7
		jc	code_5F87
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #3Ah
		mov	R5, #7
		lcall	code_AC05

code_5F87:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #8
		jc	code_5F9B
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #42h
		mov	R5, #7
		lcall	code_AC05

code_5F9B:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		clr	C
		subb	A, #9
		jc	code_5FAF
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #4Ah
		mov	R5, #7
		lcall	code_AC05

code_5FAF:				
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R7, #0Ah
		ljmp	WhileSendR7_C882
;  code_5EE8


; ======================================================


code_5FB9:				
		mov	RAM_18,	R6
		mov	RAM_19,	R7
		mov	RAM_1A,	R3
		mov	RAM_1B,	R2
		mov	RAM_1C,	R1
		lcall	code_CDC4
		mov	A, R7
		jnz	code_5FCC
		ljmp	code_6087
; ---------------------------------------------------------------------------

code_5FCC:				
		clr	A
		mov	DPTR, #374h
		movx	@DPTR, A
		mov	DPTR, #373h
		movx	@DPTR, A
		mov	R3, RAM_1A
		mov	R2, RAM_1B
		mov	R1, RAM_1C
		lcall	R3R2R1_GetACC_103D
		jnz	code_602E
		mov	R7, RAM_19
		mov	R6, RAM_18
		lcall	code_A01E
		mov	A, R7
		jnz	code_5FED
		ljmp	code_6087
; ---------------------------------------------------------------------------

code_5FED:				
		mov	R7, RAM_19
		mov	R6, RAM_18
		lcall	code_9968
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	code_CA9F
		mov	DPTR, #308h
		movx	A, @DPTR
		mov	R6, A
		add	A, #61h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #30Bh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #0
		jc	code_6087
		mov	DPTR, #307h
		movx	A, @DPTR
		subb	A, R7
		xrl	A, R6
		jnz	code_6087
		inc	DPTR
		movx	A, @DPTR
		add	A, #61h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_602E:				
		mov	A, RAM_19
		jnz	code_6036
		mov	A, RAM_18
		xrl	A, #4

code_6036:				
		jnz	code_6087

code_6038:
		mov	R3, RAM_1A
		mov	R2, RAM_1B
		mov	R1, RAM_1C
		lcall	R3R2R1_GetACC_103D
		xrl	A, #14h
		jnz	code_6087
		mov	DPTR, #306h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #308h
		movx	A, @DPTR
		mov	R6, A
		cjne	A, RAM_7, code_6087
		mov	DPTR, #30Ch
		movx	A, @DPTR
		jz	code_6087
		mov	A, #61h
		add	A, R6
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		cjne	A, #3Fh, code_6075
		mov	A, #61h
		add	A, R6
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #40h
		movx	@DPTR, A
		sjmp	code_6082
; ---------------------------------------------------------------------------

code_6075:				
		mov	A, #61h
		add	A, R6
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #3Fh
		movx	@DPTR, A

code_6082:				
		mov	A, #1
		lcall	WriteACC_ToR3R2R1_10B6

code_6087:				
		ret
;  code_5FB9

; ---------------------------------------------------------------------------

code_6088:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		lcall	code_5FB9
		mov	A, RAM_14
		jnz	code_609D
		mov	A, RAM_13
		xrl	A, #2

code_609D:				
		jz	code_60A2
		ljmp	code_6153
; ---------------------------------------------------------------------------

code_60A2:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jz	code_60B0
		ljmp	code_6153
; ---------------------------------------------------------------------------

code_60B0:				
		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00 			; 输入 配置4000
		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	B, R6
		lcall	nextFour_13D0


		ajmp	code_6327
; ---------------------------------------------------------------------------
		db    1
		db  39h
		db  61h
		db    1
		db    3
		db  8Bh
		db  61h
		db  1Fh
		db    4
		db  57h
		db  60h
		db 0F4h
		db    4
		db 0D2h
		db  61h
		db  2Ah
		db    6
		db  50h
		db  60h
		db 0FAh
		db    6
		db 0B5h
		db  61h
		db    8
		db    6
		db 0B6h
		db  61h
		db  15h
		db    7
		db  1Ah
		db  61h
		db  23h
		db    8
		db 0AEh
		db  61h
		db  40h
		db  0Fh
		db 0A0h
		db  61h
		db  3Ch
		db  22h
		db 0B8h
		db  61h
		db  2Eh
		db  23h
		db  28h
		db    0
		db    0
		db  61h
		db  4Eh
		db 0E4h
		db  90h
		db    3
		db  10h
		db  80h
		db  20h
; ---------------------------------------------------------------------------
		mov	DPTR, #310h
		mov	A, #1
		sjmp	code_611A
; ---------------------------------------------------------------------------
		mov	DPTR, #310h
		mov	A, #2
		sjmp	code_611A
; ---------------------------------------------------------------------------
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_6138
		mov	DPTR, #310h
		mov	A, #3
		sjmp	code_611A
; ---------------------------------------------------------------------------
		mov	DPTR, #310h
		mov	A, #4

code_611A:				
		movx	@DPTR, A
		mov	R7, #1Fh
		sjmp	code_6150
; ---------------------------------------------------------------------------
		mov	R7, #24h
		sjmp	code_6150
; ---------------------------------------------------------------------------
		mov	R7, #25h
		sjmp	code_6150
; ---------------------------------------------------------------------------
		ljmp	code_AEDF
; ---------------------------------------------------------------------------
		mov	R7, #22h
		sjmp	code_6150
; ---------------------------------------------------------------------------
		mov	DPTR, #139h
		movx	A, @DPTR
		jz	code_6138
		mov	R7, #37h
		sjmp	code_6150
; ---------------------------------------------------------------------------

code_6138:				
		mov	R7, #5
		sjmp	code_6150
; ---------------------------------------------------------------------------
		mov	R7, #23h
		sjmp	code_6150
; ---------------------------------------------------------------------------
		mov	DPTR, #8Eh
		movx	A, @DPTR
		jz	code_614A
		mov	R7, #46h
		sjmp	code_6150
; ---------------------------------------------------------------------------

code_614A:				
		mov	R7, #5
		sjmp	code_6150
; ---------------------------------------------------------------------------
		mov	R7, #5

code_6150:				
		lcall	code_BBAC

code_6153:				
		ret

; ======================================================


code_6154:				
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #26h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0B2h
		mov	R5, #4
		lcall	code_AC05
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #2Eh
		lcall	WhileSendR7_C882
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R7
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R5
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #26h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0B7h
		mov	R5, #4
		lcall	code_AC05
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #2Eh
		lcall	WhileSendR7_C882
		mov	R7, #3Ah
		lcall	WhileSendR7_C882
		mov	DPTR, #0B4h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R7
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #0B4h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	A, R5
		add	A, #30h
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	R7, #0Dh
		ljmp	WhileSendR7_C882
;  code_6154


; ======================================================


code_621F:				
		mov	DPTR, #1A1h
		movx	A, @DPTR
		mov	R5, A
		mov	DPTR, #0F2h
		cjne	A, #1, code_6230
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A
		sjmp	code_6234
; ---------------------------------------------------------------------------

code_6230:				
		movx	A, @DPTR
		anl	A, #0EFh
		movx	@DPTR, A

code_6234:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_6251
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_6251
		mov	A, R5
		mov	DPTR, #0F2h
		cjne	A, #2, code_624D
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A
		sjmp	code_6251
; ---------------------------------------------------------------------------

code_624D:				
		movx	A, @DPTR
		anl	A, #0DFh
		movx	@DPTR, A

code_6251:				
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		clr	C
		mov	DPTR, #1A3h
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #1A2h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jnc	code_629A
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_6297
		lcall	code_AD91
		mov	A, R7
		jz	code_6297
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #106h
		mov	A, #0FFh
		movx	@DPTR, A

code_6297:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_629A:				
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_62AA
		lcall	code_AD91
		mov	A, R7
		jnz	code_62C7

code_62AA:				
		mov	DPTR, #1A6h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #106h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_62C2
		mov	R7, #1
		sjmp	code_62C4
; ---------------------------------------------------------------------------

code_62C2:				
		mov	R7, #0

code_62C4:				
		mov	A, R7
		jnz	code_62AA

code_62C7:				
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		cjne	R7, #1,	code_62E3
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #106h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_62E3:				
		mov	R7, #0
		ret
;  code_621F


; ======================================================


code_62E6:				
		mov	RAM_18,	R6
		mov	RAM_19,	R7
		setb	C
		mov	A, RAM_19
		subb	A, #0
		mov	A, RAM_18
		xrl	A, #80h
		subb	A, #80h
		jnc	code_62FA
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_62FA:				
		mov	DPTR, #1E3h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1E7h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		setb	C
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jnc	code_6319
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_6319:				
		mov	DPTR, #1E3h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R5
		subb	A, R7
		mov	R5, A
		mov	A, R4
		subb	A, R6

code_6327:				
		mov	R4, A
		lcall	code_F83
		mov	R3, #0
		mov	R2, #40h
		mov	R1, #1Ch
		mov	R0, #46h
		lcall	code_D6B
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #1E5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #1EAh
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #1E9h
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		lcall	code_F83
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		pop	RAM_7
		pop	RAM_6
		pop	RAM_5
		pop	RAM_4
		lcall	code_E74
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	R4, RAM_18
		mov	R5, RAM_19
		mov	A, R4
		lcall	code_F83
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_E74
		mov	DPTR, #1DDh
		lcall	code_1303
		mov	DPTR, #0FAh
		movx	A, @DPTR
		jnz	code_63A4
		lcall	ClearState_CE40
		lcall	code_A8E1
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_63A4:				
		mov	DPTR, #0F3h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_62E6


; ======================================================


code_63AC:				
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_63B1:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jc	code_63BE
		ljmp	code_646F
; ---------------------------------------------------------------------------

code_63BE:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	B, #2
		mov	A, R7
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	DPTR, #269h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_6435
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		add	A, ACC
		add	A, #3Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		clr	C
		mov	A, R5
		subb	A, R3
		mov	A, R2
		xrl	A, #80h
		mov	R0, A
		mov	A, R4
		xrl	A, #80h
		subb	A, R0
		jc	code_6435
		mov	A, R3
		add	A, #0FFh
		mov	R5, A
		mov	A, R2
		addc	A, #0FFh
		mov	R4, A
		mov	A, R7
		add	A, ACC
		add	A, #3Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A

code_6435:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R7, A
		add	A, ACC
		add	A, #3Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, #0D4h
		mov	A, R4
		xrl	A, #80h
		subb	A, #7Eh
		jnc	code_6466
		mov	A, R7
		add	A, ACC
		add	A, #3Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, #0FEh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0D4h
		movx	@DPTR, A

code_6466:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_63B1
; ---------------------------------------------------------------------------

code_646F:				
		mov	R7, #1
		ret
;  code_63AC


; ======================================================


code_6472:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_6499
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_6496
		lcall	code_AD91
		mov	A, R7
		jz	code_6496
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #54h
		mov	A, #0FFh
		movx	@DPTR, A

code_6496:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_6499:				
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_64A9
		lcall	code_AD91
		mov	A, R7
		jnz	code_64C6

code_64A9:				
		mov	DPTR, #1A8h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #54h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_64C1
		mov	R7, #1
		sjmp	code_64C3
; ---------------------------------------------------------------------------

code_64C1:				
		mov	R7, #0

code_64C3:				
		mov	A, R7
		jnz	code_64A9

code_64C6:				
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		mov	A, R7
		xrl	A, #1
		jnz	code_6531
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #54h
		mov	A, #0FFh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A
		mov	DPTR, #1CAh
		movx	A, @DPTR
		jnz	code_64EE
		inc	DPTR
		movx	A, @DPTR

code_64EE:				
		jz	code_651A
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		clr	C
		mov	DPTR, #1CBh
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #1CAh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jc	code_6525
		sjmp	code_651A
; ---------------------------------------------------------------------------

code_651A:				
		mov	R7, #1
		lcall	code_B7E4
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_6525:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		jnz	code_652E
		lcall	code_C1AE

code_652E:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_6531:				
		mov	R7, #0
		ret
;  code_6472

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B9AE

code_6534:				
		mov	DPTR, #361h
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #6
		movx	@DPTR, A
		mov	DPTR, #357h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.0, code_654A
		mov	R6, #6
		sjmp	code_654C
; ---------------------------------------------------------------------------

code_654A:				
		mov	R6, #3Fh

code_654C:				
		mov	DPTR, #363h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnb	ACC.1, code_6559
		mov	R7, #6
		sjmp	code_655B
; ---------------------------------------------------------------------------

code_6559:				
		mov	R7, #3Fh

code_655B:				
		mov	DPTR, #364h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #357h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.2, code_656C
		mov	R6, #6
		sjmp	code_656E
; ---------------------------------------------------------------------------

code_656C:				
		mov	R6, #3Fh

code_656E:				
		mov	DPTR, #365h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnb	ACC.3, code_657B
		mov	R7, #6
		sjmp	code_657D
; ---------------------------------------------------------------------------

code_657B:				
		mov	R7, #3Fh

code_657D:				
		mov	DPTR, #366h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_658F
		mov	A, R7
		cjne	A, #4, code_65B6

code_658F:				
		lcall	code_75E5
		mov	DPTR, #272h
		mov	A, #2
		movx	@DPTR, A

code_6598:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_65F4
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_6598
; ---------------------------------------------------------------------------

code_65B6:				
		mov	DPTR, #311h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_75EB
		mov	DPTR, #272h
		mov	A, #2
		movx	@DPTR, A

code_65C4:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_65F4
		mov	DPTR, #2FDh
		movx	A, @DPTR
		mov	R6, A
		mov	A, R7
		cjne	A, RAM_6, code_65DB
		mov	R7, #1
		sjmp	code_65DD
; ---------------------------------------------------------------------------

code_65DB:				
		mov	R7, #0

code_65DD:				
		mov	DPTR, #272h
		movx	A, @DPTR
		add	A, #6Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_65C4
; ---------------------------------------------------------------------------

code_65F4:				
		ret
;  CHUNK	FOR code_B9AE

; ======================================================


code_65F5:				
		mov	DPTR, #361h
		mov	A, #71h
		movx	@DPTR, A
		mov	DPTR, #30Fh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #30Fh
		movx	A, @DPTR
		mov	R7, A
		lcall	switch_13AA
;  code_65F5

; ---------------------------------------------------------------------------
		dw code_663B
		db    0
		dw code_6640
		db    1
		dw code_6645
		db    2
		dw code_664A
		db    3
		dw code_664F
		db    4
		dw code_6654
		db    5
		dw code_6659
		db    6
		dw code_665E
		db    7
		dw code_6663
		db    8
		dw code_6668
		db    9
		dw code_666D
		db  0Ah
		dw code_6672
		db  0Bh
		dw code_667D
		db  0Ch
		db 0
		db    0
		dw code_668C
; ---------------------------------------------------------------------------

code_663B:				
		mov	DPTR, #12Fh
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6640:				
		mov	DPTR, #130h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6645:				
		mov	DPTR, #131h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_664A:				
		mov	DPTR, #132h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_664F:				
		mov	DPTR, #133h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6654:				
		mov	DPTR, #134h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6659:				
		mov	DPTR, #135h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_665E:				
		mov	DPTR, #136h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6663:				
		mov	DPTR, #137h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6668:				
		mov	DPTR, #138h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_666D:				
		mov	DPTR, #139h
		sjmp	code_6675
; ---------------------------------------------------------------------------

code_6672:				
		mov	DPTR, #13Ah

code_6675:				
		movx	A, @DPTR
		mov	R5, A
		mov	DPTR, #271h
		clr	A
		sjmp	code_6688
; ---------------------------------------------------------------------------

code_667D:				
		mov	DPTR, #sram_13B
		movx	A, @DPTR
		mov	R5, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #271h
		xch	A, R5

code_6688:				
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A

code_668C:				
		mov	A, R7
		cjne	A, #0Ch, code_669F
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R5, A
		lcall	code_A851
		sjmp	code_66B3
; ---------------------------------------------------------------------------

code_669F:				
		clr	A
		mov	DPTR, #363h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	RAM_1C,	A
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_1D,	A
		lcall	code_B880

code_66B3:				
		ljmp	code_6D52

; ======================================================


code_66B6:				
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_66D4
		lcall	code_AD91
		mov	A, R7
		jz	code_66D4
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #54h
		mov	A, #0FFh
		movx	@DPTR, A

code_66D4:				
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_66F2
		lcall	code_AD91
		mov	A, R7
		jz	code_66F2
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A

code_66F2:				
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_6710
		lcall	code_AD91
		mov	A, R7
		jz	code_6710
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #0F7h
		mov	A, #0FFh
		movx	@DPTR, A

code_6710:				
		mov	DPTR, #104h
		movx	A, @DPTR
		jz	code_671C
		lcall	code_AFBA
		lcall	code_B8CD

code_671C:				
		lcall	code_AD1F
		mov	A, R7
		dec	A
		jz	code_675A
		dec	A
		jz	code_6755
		add	A, #0FEh
		jz	code_674B
		add	A, #0FEh
		jz	code_6741
		add	A, #0FDh
		jnz	code_675F
		mov	R7, #9
		lcall	code_90FC
		mov	R7, #8
		lcall	code_90FC
		mov	R7, #7
		lcall	code_90FC

code_6741:				
		mov	R7, #6
		lcall	code_90FC
		mov	R7, #5
		lcall	code_90FC

code_674B:				
		mov	R7, #4
		lcall	code_90FC
		mov	R7, #3
		lcall	code_90FC

code_6755:				
		mov	R7, #2
		lcall	code_90FC

code_675A:				
		mov	R7, #1
		lcall	code_90FC

code_675F:				
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #10h
		jz	code_676C
		mov	A, R7
		cjne	A, #11h, code_6773

code_676C:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A

code_6773:				
		ljmp	code_A99E
;  code_66B6

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B9AE

code_6776:				
		mov	DPTR, #361h
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		dec	A
		movx	@DPTR, A
		mov	DPTR, #357h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.4, code_678B
		mov	R6, #6
		sjmp	code_678D
; ---------------------------------------------------------------------------

code_678B:				
		mov	R6, #3Fh

code_678D:				
		mov	DPTR, #363h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnb	ACC.5, code_679A
		mov	R7, #6
		sjmp	code_679C
; ---------------------------------------------------------------------------

code_679A:				
		mov	R7, #3Fh

code_679C:				
		mov	DPTR, #364h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #357h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.6, code_67AD
		mov	R6, #6
		sjmp	code_67AF
; ---------------------------------------------------------------------------

code_67AD:				
		mov	R6, #3Fh

code_67AF:				
		mov	DPTR, #365h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnb	ACC.7, code_67BC
		mov	R7, #6
		sjmp	code_67BE
; ---------------------------------------------------------------------------

code_67BC:				
		mov	R7, #3Fh

code_67BE:				
		mov	DPTR, #366h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_67D0
		mov	A, R7
		cjne	A, #4, code_67F7

code_67D0:				
		lcall	code_75E5
		mov	DPTR, #272h
		mov	A, #2
		movx	@DPTR, A

code_67D9:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_6835
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_67D9
; ---------------------------------------------------------------------------

code_67F7:				
		mov	DPTR, #311h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_75EB
		mov	DPTR, #272h
		mov	A, #2
		movx	@DPTR, A

code_6805:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_6835
		mov	DPTR, #2FDh
		movx	A, @DPTR
		mov	R6, A
		mov	A, R7
		cjne	A, RAM_6, code_681C
		mov	R7, #1
		sjmp	code_681E
; ---------------------------------------------------------------------------

code_681C:				
		mov	R7, #0

code_681E:				
		mov	DPTR, #272h
		movx	A, @DPTR
		add	A, #6Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_6805
; ---------------------------------------------------------------------------

code_6835:				
		ret
;  CHUNK	FOR code_B9AE

; ======================================================


code_6836:				
		mov	DPTR, #302h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #19h
		jc	code_6846
		ljmp	code_68E4
; ---------------------------------------------------------------------------

code_6846:				
		mov	DPTR, #310h
		movx	A, @DPTR
		jnz	code_6855
		lcall	code_B9D3
		mov	A, R7
		jz	code_68A3
		ljmp	code_68E4
; ---------------------------------------------------------------------------

code_6855:				
		mov	DPTR, #310h
		movx	A, @DPTR
		cjne	A, #1, code_6869
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_B9F8
		mov	A, R7
		jz	code_68A3
		sjmp	code_68E4
; ---------------------------------------------------------------------------

code_6869:				
		mov	DPTR, #310h
		movx	A, @DPTR
		cjne	A, #3, code_687D
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BA42
		mov	A, R7
		jz	code_68A3
		sjmp	code_68E4
; ---------------------------------------------------------------------------

code_687D:				
		mov	DPTR, #310h
		movx	A, @DPTR
		cjne	A, #2, code_6891
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BA1D
		mov	A, R7
		jz	code_68A3
		sjmp	code_68E4
; ---------------------------------------------------------------------------

code_6891:				
		mov	DPTR, #310h
		movx	A, @DPTR
		cjne	A, #4, code_68A3
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_BA67
		mov	A, R7
		jnz	code_68E4

code_68A3:				
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #9, code_68B5
		mov	DPTR, #1B2h
		movx	A, @DPTR
		jnz	code_68B3
		inc	DPTR
		movx	A, @DPTR

code_68B3:				
		jz	code_68D8

code_68B5:				
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jnz	code_68C9
		mov	A, R7
		xrl	A, #0Ah
		jz	code_68D8
		mov	DPTR, #302h
		movx	A, @DPTR
		cjne	A, #0Bh, code_68D8
		sjmp	code_68D8
; ---------------------------------------------------------------------------

code_68C9:				
		mov	DPTR, #302h
		movx	A, @DPTR
		cjne	A, #0Bh, code_68D8
		mov	DPTR, #1B6h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A

code_68D8:				
		mov	DPTR, #302h
		movx	A, @DPTR
		clr	C
		subb	A, #19h
		jnc	code_68E4
		ljmp	code_6836
; ---------------------------------------------------------------------------

code_68E4:				
		mov	DPTR, #302h
		movx	A, @DPTR
		clr	C
		subb	A, #19h
		jnc	code_68F3
		lcall	code_4B41
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_68F3:				
		mov	R7, #0
		ret
;  code_6836


; ======================================================


code_68F6:				
		mov	RAM_19,	R3
		mov	RAM_1A,	R2
		mov	RAM_1B,	R1
		mov	DPTR, #26h
		movx	A, @DPTR
		jz	code_6905
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_6905:				
		mov	DPTR, #1E3h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Bh
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #12Ah
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		lcall	code_F83
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #1E3h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #1E8h
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #1E7h
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		lcall	code_F83
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		pop	RAM_7
		pop	RAM_6
		pop	RAM_5
		pop	RAM_4
		lcall	code_E74
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #1E5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #1EAh
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #1E9h
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		lcall	code_F83
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_D6B
		clr	A
		mov	R3, A
		mov	R2, A
		mov	R1, A
		mov	R0, #3Fh
		lcall	code_C7A
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #1E5h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R4
		lcall	code_F83
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		lcall	code_C7A
		lcall	code_FBC
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	A, R6
		mov	B, R7
		lcall	code_1200
		mov	R7, #1
		ret
;  code_68F6


; ======================================================


code_69B5:				
		mov	R7, #1
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_69BC:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R6, A
		mov	B, #6
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #6Eh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R4, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R5, A
		mov	A, R6
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, R2
		xrl	A, #80h
		subb	A, R0
		jnc	code_6A04
		clr	A
		mov	R7, A
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	B, #6
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #6Eh
		sjmp	code_6A4A
; ---------------------------------------------------------------------------

code_6A04:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R6, A
		mov	B, #6
		mul	AB
		add	A, #0B7h
		mov	DPL, A
		clr	A
		addc	A, #6Eh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R4, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R5, A
		mov	A, R6
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		setb	C
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, R2
		xrl	A, #80h
		subb	A, R0
		jc	code_6A64
		clr	A
		mov	R7, A
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	B, #6
		mul	AB
		add	A, #0B7h
		mov	DPL, A
		clr	A
		addc	A, #6Eh

code_6A4A:				
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R4, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R5, A
		mov	A, R6
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A

code_6A64:				
		mov	DPTR, #269h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		xrl	A, #1Ch
		jz	code_6A72
		ljmp	code_69BC
; ---------------------------------------------------------------------------

code_6A72:				
		ret
;  code_69B5


; ======================================================


code_6A73:				
		mov	DPTR, #5Fh
		clr	A
		mov	B, #1
		lcall	code_1187
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_6A82:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R7, A
		add	A, ACC
		add	A, ACC
		add	A, #61h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		push	DPH
		push	DPL
		lcall	code_12F7
		mov	A, R7
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		lcall	code_124C
		pop	DPL
		pop	DPH
		lcall	code_1303
		mov	DPTR, #26Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #9, code_6A82
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A
		clr	C
		mov	DPTR, #60h
		movx	A, @DPTR
		subb	A, #30h
		mov	DPTR, #5Fh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #0F5h
		jc	code_6AE2
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_6AE2:				
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_6AE7:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jnc	code_6B1E
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #61h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_12EB
		mov	R3, #0
		mov	R2, #94h
		mov	R1, #35h
		mov	R0, #77h
		setb	C
		lcall	code_12C4
		jnc	code_6B16
		mov	DPTR, #26Ah
		mov	A, #1
		movx	@DPTR, A

code_6B16:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_6AE7
; ---------------------------------------------------------------------------

code_6B1E:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		jz	code_6B27
		lcall	code_CBBC

code_6B27:				
		lcall	ClearState_CE40
		lcall	code_9E13
		ljmp	FLAG_SETB_CE7D
 

; ======================================================


code_6B30:				
		lcall	code_AD1F
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #2CFh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #1
		jnc	code_6B54
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jc	code_6B54
		ljmp	code_6BD7
; ---------------------------------------------------------------------------

code_6B54:				
		mov	A, R7
		setb	C
		subb	A, #2
		jnc	code_6B65
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #3
		jc	code_6B65
		sjmp	code_6BD7
; ---------------------------------------------------------------------------

code_6B65:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		setb	C
		subb	A, #3
		jnc	code_6B79
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #4
		jc	code_6B79
		sjmp	code_6BD7
; ---------------------------------------------------------------------------

code_6B79:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #4
		jnc	code_6B8E
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_6B8E
		sjmp	code_6BD7
; ---------------------------------------------------------------------------

code_6B8E:				
		mov	A, R7
		setb	C
		subb	A, #5
		jnc	code_6B9F
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #6
		jc	code_6B9F
		sjmp	code_6BD7
; ---------------------------------------------------------------------------

code_6B9F:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		setb	C
		subb	A, #6
		jnc	code_6BB3
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #7
		jc	code_6BB3
		sjmp	code_6BD7
; ---------------------------------------------------------------------------

code_6BB3:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #7
		jnc	code_6BC8
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #8
		jc	code_6BC8
		sjmp	code_6BD7
; ---------------------------------------------------------------------------

code_6BC8:				
		mov	A, R7
		setb	C
		subb	A, #8
		jnc	code_6BDA
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #9
		jc	code_6BDA

code_6BD7:				
		mov	A, #0Ah
		movx	@DPTR, A

code_6BDA:				
		mov	DPTR, #2CFh
		movx	A, @DPTR
		clr	C
		subb	A, #0Ah
		jnc	code_6BE9
		lcall	code_8955
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_6BE9:				
		mov	R7, #0
		ret
;  code_6B30


; ======================================================


code_6BEC:				
		mov	DPTR, #166h
		movx	A, @DPTR
		jnz	code_6C15
		inc	A
		movx	@DPTR, A
		mov	R7, A
		lcall	code_BBAC

code_6BF8:				
		mov	R7, #0Ah
		mov	R6, #0
		lcall	code_8806
		mov	DPTR, #1EBh
		mov	A, R7
		movx	@DPTR, A
		cjne	R7, #0FFh, code_6C0B
		mov	R7, #1
		sjmp	code_6C0D
; ---------------------------------------------------------------------------

code_6C0B:				
		mov	R7, #0

code_6C0D:				
		mov	A, R7
		jnz	code_6C13
		ljmp	code_6C9F
; ---------------------------------------------------------------------------

code_6C13:				
		sjmp	code_6BF8
; ---------------------------------------------------------------------------

code_6C15:				
		mov	DPTR, #0AFh
		movx	A, @DPTR
		jnz	code_6C2D
		mov	DPTR, #1EBh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		mov	A, R7
		xrl	A, #1
		jnz	code_6C9F
		mov	DPTR, #0AFh
		sjmp	code_6C6A
; ---------------------------------------------------------------------------

code_6C2D:				
		mov	DPTR, #165h
		movx	A, @DPTR
		jnz	code_6C54
		inc	A
		movx	@DPTR, A
		mov	R7, #2
		lcall	code_BBAC

code_6C3A:				
		mov	R7, #0Ah
		mov	R6, #0
		lcall	code_8806
		mov	DPTR, #1EBh
		mov	A, R7
		movx	@DPTR, A
		cjne	R7, #0FFh, code_6C4D
		mov	R7, #1
		sjmp	code_6C4F
; ---------------------------------------------------------------------------

code_6C4D:				
		mov	R7, #0

code_6C4F:				
		mov	A, R7
		jz	code_6C9F
		sjmp	code_6C3A
; ---------------------------------------------------------------------------

code_6C54:				
		mov	DPTR, #0AEh
		movx	A, @DPTR
		jnz	code_6C7B
		mov	DPTR, #1EBh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		mov	A, R7
		xrl	A, #1
		jnz	code_6C9F
		mov	DPTR, #0AEh

code_6C6A:				
		inc	A
		movx	@DPTR, A
		mov	DPTR, #1EBh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #1EBh
		mov	A, #0FFh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_6C7B:				
		mov	DPTR, #137h
		movx	A, @DPTR
		jz	code_6C92
		lcall	code_9DC7
		mov	A, R7
		jz	code_6C92
		mov	DPTR, #98h
		mov	A, #3
		movx	@DPTR, A
		lcall	code_C8BD
		sjmp	code_6C9A
; ---------------------------------------------------------------------------

code_6C92:				
		lcall	code_AB4B
		mov	R7, #2
		lcall	code_9D7A

code_6C9A:				
		mov	R7, #5
		lcall	code_BBAC

code_6C9F:				
		ret
;  code_6BEC


; ======================================================


code_6CA0:				
		lcall	code_59C5
		mov	DPTR, #2BBh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #37Ah
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		xrl	A, R7
		jnz	code_6CB8
		mov	A, R4
		xrl	A, R6

code_6CB8:				
		jz	code_6CCD
		mov	DPTR, #2BBh
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #37Ah
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_6CCD:				
		mov	DPTR, #37Ch
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		jnc	code_6CD9
		sjmp	code_6D34
; ---------------------------------------------------------------------------

code_6CD9:				
		mov	A, R7
		clr	C
		subb	A, #1
		jc	code_6D51
		mov	DPTR, #358h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		xrl	A, R5
		jnz	code_6CEC
		mov	A, R6
		xrl	A, R4

code_6CEC:				
		jz	code_6D21
		mov	A, R7
		orl	A, R6
		jz	code_6CFF
		mov	DPTR, #37Ah
		movx	A, @DPTR
		jnz	code_6CFA
		inc	DPTR
		movx	A, @DPTR

code_6CFA:				
		jnz	code_6CFF
		lcall	code_CAFC

code_6CFF:				
		mov	DPTR, #37Ah
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #358h
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #358h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		orl	A, R6
		jz	code_6D21
		lcall	code_CAED

code_6D21:				
		mov	DPTR, #358h
		movx	A, @DPTR
		jnz	code_6D29
		inc	DPTR
		movx	A, @DPTR

code_6D29:				
		jz	code_6D51
		mov	DPTR, #35Ah
		movx	A, @DPTR
		clr	C
		subb	A, #14h
		jnc	code_6D38

code_6D34:				
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_6D38:				
		mov	DPTR, #35Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jc	code_6D51
		clr	A
		movx	@DPTR, A
		mov	DPTR, #358h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CAED

code_6D51:				
		ret
;  code_6CA0


; ======================================================


code_6D52:				
		mov	DPTR, #305h
		mov	A, #1
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		inc	A
		mov	R7, A
		mov	DPTR, #273h
		movx	@DPTR, A
		mov	DPTR, #30Bh
		movx	A, @DPTR
		mov	R6, A
		add	A, #1
		mov	R5, A
		clr	A
		rlc	A
		mov	R4, A
		mov	A, R7
		clr	C
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, #80h
		subb	A, R0
		jnc	code_6D82
		mov	A, R6
		inc	A
		mov	DPTR, #273h
		movx	@DPTR, A

code_6D82:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #307h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		inc	A
		mov	R7, A
		mov	DPTR, #273h
		movx	@DPTR, A
		add	A, #61h
		mov	R1, A
		clr	A
		addc	A, #3
		mov	R2, A
		mov	R3, #1
		mov	DPTR, #309h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R6
		subb	A, R7
		inc	A
		mov	RAM_27,	A
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_28,	A
		mov	RAM_29,	#1
		lcall	code_4161
		mov	DPTR, #306h
		movx	A, @DPTR
		mov	DPTR, #273h
		movx	@DPTR, A

code_6DBD:				
		mov	DPTR, #307h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R6, A
		setb	C
		subb	A, R7
		jnc	code_6E03
		mov	A, #67h
		add	A, R6
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #7Fh
		movx	@DPTR, A
		mov	DPTR, #308h
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		cjne	A, RAM_7, code_6DEF
		add	A, #6Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #1
		movx	@DPTR, A
		sjmp	code_6DFB
; ---------------------------------------------------------------------------

code_6DEF:				
		mov	A, #6Dh
		add	A, R6
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A

code_6DFB:				
		mov	DPTR, #273h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_6DBD
; ---------------------------------------------------------------------------

code_6E03:				
		ret
;  code_6D52


; ======================================================
;
;
;
code_6E04:				
		mov	RAM_8, #0
		mov	RAM_9, #0
		mov	RAM_A, #0F1h
		clr	A
		mov	R7, A
code_6E0F:				
		mov	A, R7
		mov	B, #6
		div	AB
		mov	R6, B
		mov	A, R6
		jz	code_6E20
		xrl	A, #1
		jz	code_6E20
		cjne	R6, #3,code_6E3D
code_6E20:				
		mov	R3, RAM_8
		mov	R2, RAM_9
		mov	R1, RAM_A
		mov	DPL, R7
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		xrl	A, #7Ah
		mov	R6, A
		mov	A, #99h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A

code_6E3D:				
		mov	A, R7
		mov	B, #6
		div	AB
		mov	R6, B
		cjne	R6, #2,	code_6E64
		mov	R3, RAM_8
		mov	R2, RAM_9
		mov	R1, RAM_A
		mov	DPL, R7
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		xrl	A, #6Ah
		mov	R6, A
		mov	A, #99h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A

code_6E64:				
		mov	A, R7
		mov	B, #6
		div	AB
		mov	R6, B
		cjne	R6, #4,	code_6E8B
		mov	R3, RAM_8
		mov	R2, RAM_9
		mov	R1, RAM_A
		mov	DPL, R7
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		xrl	A, #6Ch
		mov	R5, A
		mov	A, #99h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		mov	A, R5
		movx	@DPTR, A

code_6E8B:				
		cjne	R6, #5,	code_6EAB
		mov	R3, RAM_8
		mov	R2, RAM_9
		mov	R1, RAM_A
		mov	DPL, R7
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		xrl	A, #6Eh
		mov	R6, A
		mov	A, #99h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A

code_6EAB:				
		inc	R7
		mov	A, R7
		xrl	A, #7
		jz	code_6EB4
		ljmp	code_6E0F
; ---------------------------------------------------------------------------

code_6EB4:				
		ret
 
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db  0Fh
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db  1Eh
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db  1Eh
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db  1Eh
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db    5
		db    0
		db    0
		db    0
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    1
		db    0
		db  63h
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    1
		db    0
		db  0Fh
		db    0
		db    1
		db    0
		db    0
		db    0
		db    3
		db    0
		db    2
		db    0
		db    0
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    1
		db    0
		db    1
		db    0
		db    9
		db    0
		db    6
		db    0
		db    0
		db    0
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db  64h
		db    0
		db  64h
		db    0
		db    0
		db  27h
		db  0Fh
		db    0
		db  64h
		db    0
		db    0
		db    0
		db    1
		db    0
		db    1
		db    0
		db    0
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  63h
		db    0
		db    0
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db    0
		db    0
		db    0
		db    3
		db 0E7h
		db    0
		db    0
		db    1
		db    2
		db    5
		db  0Fh
		db    3
		db    1
		db    0
		db    0
		db    0

; ======================================================


code_6F66:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		clr	C
		rrc	A
		inc	A
		mov	R7, A

code_6F6E:				
		mov	A, R7
		add	A, #3
		mov	R7, A
		mov	DPTR, #276h
		movx	@DPTR, A
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_6F7E
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_6F7E:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2Fh
		mov	RAM_22,#0
		mov	RAM_23,#12h
		mov	R5, #1
		mov	R4, #0
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_6F9B
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_6F9B:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0		; ram2
		mov	R1, #2
		mov	RAM_22,#0
		mov	RAM_23,#12h
		mov	R5, #13h
		mov	R4, #0
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_6FB8
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_6FB8:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #42h
		mov	RAM_22,	#0
		mov	RAM_23,	#12h
		mov	R5, #25h
		mov	R4, #0
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_6FD5
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_6FD5:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #14h
		mov	RAM_22,	#0
		mov	RAM_23,	#12h
		mov	R5, #37h
		mov	R4, #0
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_6FF2
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_6FF2:				
		mov	DPTR, #275h
		mov	A, #33h
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #75h
		mov	RAM_22,	#0
		mov	RAM_23,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_7012
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7012:				
		mov	R7, #1
		ret
;  code_6F66


; ======================================================


code_7015:				
		mov	RAM_18,	R7
		mov	RAM_19,	R4
		mov	RAM_1A,	R5
		mov	A, R7
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		cjne	A, RAM_1A, code_7035
		mov	A, R6
		cjne	A, RAM_19, code_7035
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_7035:				
		clr	C
		mov	A, RAM_1A
		subb	A, #0D4h
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, #7Eh
		jnc	code_7045
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_7045:				
		mov	A, RAM_18
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		setb	C
		subb	A, #0
;  code_7015

; START	OF FUNCTION CHUNK FOR code_7683
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_708E
		mov	A, RAM_1A
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, R0
		jc	code_708E
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_708E:				
		mov	A, RAM_18
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, RAM_19
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1A
		movx	@DPTR, A
		mov	DPTR, #0ACh
		movx	A, @DPTR
		jnz	code_70BC
		lcall	ClearState_CE40
		lcall	code_A920
		mov	DPTR, #274h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_70BC:				
		mov	DPTR, #0A7h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  CHUNK	FOR code_7683

; ======================================================


code_70C4:				
		mov	DPTR, #12Dh
		lcall	code_9611
		mov	DPTR, #12Dh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #1DAh
		lcall	code_9611
		mov	DPTR, #1DAh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_70EB
		ljmp	code_7171
; ---------------------------------------------------------------------------

code_70EB:				
		mov	DPTR, #16Dh
		lcall	code_9611
		mov	DPTR, #16Dh
		lcall	code_960B
		mov	DPTR, #16Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #172h
		lcall	code_9611
		mov	DPTR, #172h
		lcall	code_960B
		mov	DPTR, #174h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	DPTR, #275h
		movx	@DPTR, A

code_7118:				
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jnc	code_7171
		mov	A, R7
		add	A, ACC
		add	A, #77h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		lcall	code_9611
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R5, A
		add	A, ACC
		add	A, #77h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	A, R5
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		lcall	code_9611
		mov	DPTR, #275h
		movx	A, @DPTR
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #275h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_7118
; ---------------------------------------------------------------------------

code_7171:				
		ret
;  code_70C4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C994

code_7172:				
		mov	R7, #1Bh
		lcall	WhileSendR7_C882
		mov	R7, #63h
		lcall	WhileSendR7_C882
		mov	DPTR, #34Fh
		movx	A, @DPTR
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #26h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		clr	A
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #34Fh
		movx	A, @DPTR
		dec	A
		jz	code_71D1
		inc	A
		jnz	code_7201
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #92h
		mov	R5, #0Bh
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #87h
		mov	R5, #0Ah
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #7Ch
		mov	R5, #0Ah
		sjmp	code_71F9
; ---------------------------------------------------------------------------

code_71D1:				
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #7Ch
		mov	R5, #0Ah
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #87h
		mov	R5, #0Ah
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #92h
		mov	R5, #0Bh

code_71F9:				
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882

code_7201:				
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #2Eh
		ljmp	WhileSendR7_C882
;  CHUNK	FOR code_C994
; ---------------------------------------------------------------------------

code_721A:				
		mov	RAM_E, R6
		mov	RAM_F, R7
		mov	DPTR, #2D0h
		movx	A, @DPTR
		lcall	switch_13AA
; ---------------------------------------------------------------------------
		dw code_7256
		db    5
		dw code_725D
		db  14h
		dw code_7264
		db  15h
		dw code_726B
		db  16h
		dw code_7272
		db  17h
		dw code_7279
		db  1Eh
		dw code_7280
		db  1Fh
		dw code_7287
		db  22h
		dw code_728E
		db  23h
		dw code_729C
		db  25h
		dw code_7295
		db  28h
		dw code_72AA
		db  32h
		dw code_72A3
		db  33h
		dw code_72B1
		db  46h
		dw code_72B8
		db  48h
		db    0
		db    0
		dw code_72BF
; ---------------------------------------------------------------------------

code_7256:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CE84
; ---------------------------------------------------------------------------

code_725D:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF47
; ---------------------------------------------------------------------------

code_7264:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF50
; ---------------------------------------------------------------------------

code_726B:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF53
; ---------------------------------------------------------------------------

code_7272:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF56
; ---------------------------------------------------------------------------

code_7279:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF4A
; ---------------------------------------------------------------------------

code_7280:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CD59
; ---------------------------------------------------------------------------

code_7287:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CD64
; ---------------------------------------------------------------------------

code_728E:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CD6F
; ---------------------------------------------------------------------------

code_7295:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF4D
; ---------------------------------------------------------------------------

code_729C:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_A2A4
; ---------------------------------------------------------------------------

code_72A3:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CCFC
; ---------------------------------------------------------------------------

code_72AA:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CD14
; ---------------------------------------------------------------------------

code_72B1:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		ljmp	code_CF59
; ---------------------------------------------------------------------------

code_72B8:				
		mov	R7, RAM_F
		mov	R6, RAM_E
		lcall	code_CF5C

code_72BF:				
		ret
; ---------------------------------------------------------------------------

code_72C0:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	A, RAM_14
		jnz	code_72D2
		mov	A, RAM_13
		xrl	A, #2

code_72D2:				
		jnz	code_7317
		lcall	R3R2R1_GetACC_103D
		jz	code_72DC
		ljmp	code_7362
; ---------------------------------------------------------------------------

code_72DC:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jz	code_72E6
		sjmp	code_7313
; ---------------------------------------------------------------------------

code_72E6:				
		lcall	UserInput_ToR6R7_C489
	; 	lcall	test_00

		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	B, R6
		lcall	nextFour_13D0
; ---------------------------------------------------------------------------
		dw 7306h
		db    4
		db 0D2h
		dw 730Bh
		db    6
		db 0B5h
		dw 730Fh
		db  10h
		db 0E1h
		db    0
		db    0
		dw 7313h
; ---------------------------------------------------------------------------
		lcall	code_A7A3
		sjmp	code_7350
; ---------------------------------------------------------------------------
		mov	R7, #16h
		sjmp	code_7352
; ---------------------------------------------------------------------------
		mov	R7, #17h
		sjmp	code_7352
; ---------------------------------------------------------------------------

code_7313:				
		mov	R7, #5
		sjmp	code_7352
; ---------------------------------------------------------------------------

code_7317:				
		mov	A, RAM_14
		jnz	code_731F
		mov	A, RAM_13
		xrl	A, #80h

code_731F:				
		jnz	code_7355
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_7362
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jz	code_7338
		mov	R7, #5
		sjmp	code_7352
; ---------------------------------------------------------------------------

code_7338:				
		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00

		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	B, R6
		lcall	nextFour_13D0
; ---------------------------------------------------------------------------
		dw 7350h
		db    4
		db 0D2h
		db    0
		db    0
		dw code_7362
; ---------------------------------------------------------------------------

code_7350:				
		mov	R7, #15h

code_7352:				
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_7355:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_7362:				
		ret

; ======================================================


code_7363:				
		clr	A
		mov	DPTR, #169h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #1
		mov	R1, #9Bh
		mov	RAM_2E,	A
		mov	R5, #6
		lcall	code_C21A
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A

code_7394:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jnc	code_73C6
		mov	A, R7
		add	A, ACC
		add	A, #77h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #26Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_7394
; ---------------------------------------------------------------------------

code_73C6:				
		mov	DPTR, #167h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	B, #64h
		div	AB
		mov	A, B
		movx	@DPTR, A
		mov	DPTR, #1B2h
		movx	A, @DPTR
		jnz	code_73DC
		inc	DPTR
		movx	A, @DPTR

code_73DC:				
		jz	code_73F8
		mov	DPTR, #167h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		mov	DPTR, #1B5h
		movx	A, @DPTR
		subb	A, R7
		mov	A, #80h
		mov	R0, A
		mov	DPTR, #1B4h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jnc	code_73F8
		lcall	code_C1AE

code_73F8:				
		lcall	ClearState_CE40
		lcall	code_A920
		lcall	FLAG_SETB_CE7D
		mov	R7, #1
		ret
;  code_7363


; ======================================================


code_7404:				
		mov	A, R7
		add	A, #3
		mov	R7, A
		mov	DPTR, #270h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Fh
		mov	RAM_1E,#0
		mov	RAM_1F,#1
		clr	A
		mov	R5, A
		mov	R4, A
		lcall	IAP_READ_9B02		; 0X13
		mov	A, R7
		jnz	code_7423
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7423:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		xrl	A, #33h
		jz	code_742E
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_742E:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2Fh
		mov	RAM_1E,#0
		mov	RAM_1F,#12h
		mov	R5, #1
		mov	R4, #0
		lcall	IAP_READ_9B02		; 0X14
		mov	A, R7
		jnz	code_744B
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_744B:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2
		mov	RAM_1E,	#0
		mov	RAM_1F,	#12h
		mov	R5, #13h
		mov	R4, #0
		lcall	IAP_READ_9B02		; 0X15
		mov	A, R7
		jnz	code_7468
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7468:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #42h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#12h
		mov	R5, #25h
		mov	R4, #0
		lcall	IAP_READ_9B02		; 0X16
		mov	A, R7
		jnz	code_7485
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7485:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #14h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#12h
		mov	R5, #37h
		mov	R4, #0
		lcall	IAP_READ_9B02		; 0X17
		mov	A, R7
		jnz	code_74A2
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_74A2:				
		mov	R7, #1
		ret
;  code_7404


; ======================================================


code_74A5:				
		mov	A, R7
		lcall	switch_13AA
;  code_74A5

; ---------------------------------------------------------------------------
		dw code_74F8
		db    0
		dw code_74FB
		db    1
		dw code_74FE
		db    2
		dw code_7501
		db    3
		dw code_7504
		db    4
		dw code_7507
		db    5
		dw code_750A
		db    6
		dw code_750D
		db    7
		dw code_7510
		db    8
		dw code_7513
		db    9
		dw code_7516
		db  0Ah
		dw code_7519
		db  0Bh
		dw code_751C
		db  0Ch
		dw code_751F
		db  0Dh
		dw code_7522
		db  0Eh
		dw code_7525
		db  0Fh
		dw code_7528
		db  10h
		dw code_752B
		db  11h
		dw code_752E
		db  12h
		dw code_753A
		db  13h
		dw code_7531
		db  14h
		dw code_7534
		db  15h
		dw code_7537
		db  16h
		dw code_753D
		db  17h
		dw code_7540
		db  18h
		db    0
		db    0
		dw code_7543
; ---------------------------------------------------------------------------

code_74F8:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_74FB:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_74FE:				
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_7501:				
		mov	R7, #3
		ret
; ---------------------------------------------------------------------------

code_7504:				
		mov	R7, #4
		ret
; ---------------------------------------------------------------------------

code_7507:				
		mov	R7, #5
		ret
; ---------------------------------------------------------------------------

code_750A:				
		mov	R7, #6
		ret
; ---------------------------------------------------------------------------

code_750D:				
		mov	R7, #7
		ret
; ---------------------------------------------------------------------------

code_7510:				
		mov	R7, #8
		ret
; ---------------------------------------------------------------------------

code_7513:				
		mov	R7, #9
		ret
; ---------------------------------------------------------------------------

code_7516:				
		mov	R7, #0Ah
		ret
; ---------------------------------------------------------------------------

code_7519:				
		mov	R7, #0Bh
		ret
; ---------------------------------------------------------------------------

code_751C:				
		mov	R7, #0Ch
		ret
; ---------------------------------------------------------------------------

code_751F:				
		mov	R7, #13h
		ret
; ---------------------------------------------------------------------------

code_7522:				
		mov	R7, #17h
		ret
; ---------------------------------------------------------------------------

code_7525:				
		mov	R7, #0Eh
		ret
; ---------------------------------------------------------------------------

code_7528:				
		mov	R7, #0Fh
		ret
; ---------------------------------------------------------------------------

code_752B:				
		mov	R7, #10h
		ret
; ---------------------------------------------------------------------------

code_752E:				
		mov	R7, #11h
		ret
; ---------------------------------------------------------------------------

code_7531:				
		mov	R7, #12h
		ret
; ---------------------------------------------------------------------------

code_7534:				
		mov	R7, #14h
		ret
; ---------------------------------------------------------------------------

code_7537:				
		mov	R7, #15h
		ret
; ---------------------------------------------------------------------------

code_753A:				
		mov	R7, #16h
		ret
; ---------------------------------------------------------------------------

code_753D:				
		mov	R7, #1Ah
		ret
; ---------------------------------------------------------------------------

code_7540:				
		mov	R7, #1Bh
		ret
; ---------------------------------------------------------------------------

code_7543:				
		mov	R7, #0FFh
		ret

; ======================================================


code_7546:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A
		mov	DPTR, #105h
		movx	A, @DPTR
		jnz	code_7561
		inc	A
		movx	@DPTR, A
		mov	DPTR, #3A2h
		movx	A, @DPTR
		jz	code_7576
		mov	DPTR, #3A3h
		movx	A, @DPTR
		jz	code_757C
		sjmp	code_7576
; ---------------------------------------------------------------------------

code_7561:				
		mov	RAM_24,	#1
		mov	RAM_25,	#3
		mov	RAM_26,	#9Ch
		mov	R3, #1
		mov	R2, #0
		mov	R1, #86h
		lcall	code_80FD
		mov	A, R7
		jz	code_757C

code_7576:				
		mov	DPTR, #26Fh
		mov	A, #1
		movx	@DPTR, A

code_757C:				
		mov	DPTR, #8Bh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_75E4
		mov	A, R7
		xrl	A, #0Fh
		jnz	code_7596
		mov	A, R6
		xrl	A, #27h

code_7596:				
		jz	code_75E4
		mov	DPTR, #26Fh
		movx	A, @DPTR
		jz	code_75E4
		mov	RAM_1E,	#1
		mov	RAM_1F,	#0
		mov	RAM_20,	#86h
		mov	R3, #1
		mov	R2, #3
		mov	R1, #9Ch
		lcall	code_C411
		mov	DPTR, #8Bh
		mov	A, #0FFh
		mov	B, A
		lcall	code_1187
		clr	C
		mov	DPTR, #8Bh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jnc	code_75C9
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_75C9:				
		lcall	ClearState_CE40
		lcall	code_A95F
		lcall	FLAG_SETB_CE7D
		lcall	code_C3E1
		mov	A, R7
code_75D6:
		mov	DPTR, #29h
		jnz	code_75E0
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_75E0:				
		movx	A, @DPTR
		anl	A, #0F7h
		movx	@DPTR, A

code_75E4:				
		ret
;  code_7546


; ======================================================


code_75E5:				
		clr	A
		mov	DPTR, #311h
		movx	@DPTR, A
		mov	R7, A
;  code_75E5


; ======================================================


code_75EB:				
		mov	R5, RAM_7
		mov	DPTR, #2F6h
		movx	A, @DPTR
		add	A, #0FCh
		jz	code_763F
		inc	A
		jz	code_75FB
		ljmp	code_7682
; ---------------------------------------------------------------------------

code_75FB:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.3, code_7608
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		sjmp	code_760C
; ---------------------------------------------------------------------------

code_7608:				
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A

code_760C:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.2, code_7619
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		sjmp	code_761D
; ---------------------------------------------------------------------------

code_7619:				
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A

code_761D:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.1, code_762A
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A
		sjmp	code_762E
; ---------------------------------------------------------------------------

code_762A:				
		movx	A, @DPTR
		anl	A, #0FBh
		movx	@DPTR, A

code_762E:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.0, code_763A
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_763A:				
		movx	A, @DPTR
		anl	A, #0F7h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_763F:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.3, code_764C
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A
		sjmp	code_7650
; ---------------------------------------------------------------------------

code_764C:				
		movx	A, @DPTR
		anl	A, #0EFh
		movx	@DPTR, A

code_7650:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.2, code_765D
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A
		sjmp	code_7661
; ---------------------------------------------------------------------------

code_765D:				
		movx	A, @DPTR
		anl	A, #0DFh
		movx	@DPTR, A

code_7661:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.1, code_766E
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		sjmp	code_7672
; ---------------------------------------------------------------------------

code_766E:				
		movx	A, @DPTR
		anl	A, #0BFh
		movx	@DPTR, A

code_7672:				
		mov	A, R5
		mov	DPTR, #28h
		jnb	ACC.0, code_767E
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_767E:				
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A

code_7682:				
		ret
;  code_75EB


; ======================================================


code_7683:				

		mov	DPTR, #2D0h
		movx	A, @DPTR
		lcall	switch_13AA
; ---------------------------------------------------------------------------
		dw code_7700
		db    1
		dw code_76FD
		db    2
		dw code_76D6
		db    5
		dw code_76D9
		db  14h
		dw code_76DC
		db  15h
		dw code_76DF
		db 16h
		dw code_76E2
		db  17h
		dw code_76E5
		db  1Eh
		dw code_76E8
		db  1Fh
		dw code_76EB
		db  22h
		dw code_76F1
		db  23h
		dw code_76EE
		db  24h
	;	dw code_76F7  		; dw code_CB38
		dw code_CB38
		db  25h
		dw code_76F4
		db  28h
		dw code_7709
		db  32h
		dw code_76FA
		db  33h
		dw code_7703
		db  34h
		dw code_7706
		db  35h
		dw code_770C
		db  37h
		dw code_770F
		db  38h
		dw code_7712
		db  46h
		dw code_7715
		db  47h
		dw code_7718
		db  48h
		dw code_771B
		db  49h
		db    0
		db    0
		dw code_771E
; ---------------------------------------------------------------------------

code_76D6:				
		ljmp	code_AA96
; ---------------------------------------------------------------------------

code_76D9:				
		ljmp	code_C917
; ---------------------------------------------------------------------------

code_76DC:				
		ljmp	code_C093
; ---------------------------------------------------------------------------

code_76DF:				
		ljmp	code_C0B0
; ---------------------------------------------------------------------------

code_76E2:				
		ljmp	code_CEE8
; ---------------------------------------------------------------------------

code_76E5:				
		ljmp	code_C929
; ---------------------------------------------------------------------------

code_76E8:				
		ljmp	code_CB65
; ---------------------------------------------------------------------------

code_76EB:				
		ljmp	code_C93B
; ---------------------------------------------------------------------------

code_76EE:				
		ljmp	code_AA58
; ---------------------------------------------------------------------------

code_76F1:				
		ljmp	code_C94D
; ---------------------------------------------------------------------------

code_76F4:				
		ljmp	code_CE0C
; ---------------------------------------------------------------------------

code_76F7:				
		ljmp	code_CF3E
; ---------------------------------------------------------------------------

code_76FA:				
		ljmp	code_CBD8
; ---------------------------------------------------------------------------

code_76FD:				
		ljmp	code_9F41
; ---------------------------------------------------------------------------

code_7700:				
		ljmp	code_B989
; ---------------------------------------------------------------------------

code_7703:				
		ljmp	code_BD47
; ---------------------------------------------------------------------------

code_7706:				
		ljmp	code_BB1D
; ---------------------------------------------------------------------------

code_7709:				
		ljmp	code_BDEF
; ---------------------------------------------------------------------------

code_770C:				
		ljmp	code_CEEE
; ---------------------------------------------------------------------------

code_770F:				
		ljmp	code_C5C6
; ---------------------------------------------------------------------------

code_7712:				
		ljmp	code_BE10
; ---------------------------------------------------------------------------

code_7715:				
		ljmp	code_C2A0
; ---------------------------------------------------------------------------

code_7718:				
		ljmp	code_C2BA
; ---------------------------------------------------------------------------

code_771B:				
		lcall	code_CE60

code_771E:				
		ret

; ======================================================


code_771F:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_7724:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jc	code_7731
		ljmp	code_77B9
; ---------------------------------------------------------------------------

code_7731:				
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		jz	code_77B0
		mov	DPTR, #26Fh
		movx	A, @DPTR
		add	A, ACC
		add	A, ACC
		add	A, #7Eh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		setb	C
		subb	A, #0
		mov	A, R6
		subb	A, #0
		jc	code_77B0
		mov	DPTR, #26Fh
		movx	A, @DPTR
		add	A, ACC
		add	A, ACC
		add	A, #80h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #80h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		clr	C
		subb	A, #32h
		jc	code_77B0
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		add	A, ACC
		add	A, ACC
		add	A, #80h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Eh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0FFh
		mov	B, A
		lcall	code_1187

code_77B0:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_7724
; ---------------------------------------------------------------------------

code_77B9:				
		ret
;  code_771F


; ======================================================


code_77BA:				
		mov	DPTR, #29h
		movx	A, @DPTR
		jnb	ACC.0, code_77C4
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_77C4:				
		setb	C
		mov	A, R7
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_77D2
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_77D2:				
		mov	DPTR, #1E1h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		setb	C
		mov	DPTR, #12Bh
		movx	A, @DPTR
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #12Ah
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jnc	code_77F0
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_77F0:				
		mov	R5, RAM_7
		mov	R4, RAM_6
		mov	A, R4
		lcall	code_F83
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		mov	DPTR, #1E1h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Bh
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #12Ah
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		lcall	code_F83
		mov	R0, RAM_4
		mov	R1, RAM_5
		mov	R2, RAM_6
		mov	R3, RAM_7
		pop	RAM_7
		pop	RAM_6
		pop	RAM_5
		pop	RAM_4
		lcall	code_E74
		mov	DPTR, #1DDh
		lcall	code_1303
		mov	DPTR, #0FAh
		movx	A, @DPTR
		jnz	code_784B
		lcall	ClearState_CE40
		lcall	code_A8E1
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_784B:				
		mov	DPTR, #0F3h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_77BA


; ======================================================


code_7853:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		clr	C
		subb	A, #0Ah
		jc	code_785F
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_785F:				
		lcall	code_AD1F
		mov	DPTR, #276h
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	DPTR, #274h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #277h
		movx	@DPTR, A

code_7872:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jnc	code_78D2
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	B, #2
		mov	A, R6
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R5, A
		mov	R4, B
		clr	C
		mov	A, R4
		xrl	A, #80h
		subb	A, #80h
		jnc	code_78AD
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_78AD:				
		mov	DPTR, #274h
		mov	A, R4
		mov	B, R5
		lcall	code_1187
		setb	C
		mov	DPTR, #275h
		movx	A, @DPTR
		subb	A, #0Fh
		mov	DPTR, #274h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #0A7h
		jc	code_78CA
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_78CA:				
		mov	DPTR, #277h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_7872
; ---------------------------------------------------------------------------

code_78D2:				
		setb	C
		mov	DPTR, #275h
		movx	A, @DPTR
		subb	A, #0
		mov	DPTR, #274h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jc	code_78E7
		mov	R7, #1
		sjmp	code_78E9
; ---------------------------------------------------------------------------

code_78E7:				
		mov	R7, #0

code_78E9:				
		ret
;  code_7853

; ---------------------------------------------------------------------------

code_78EA:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	DPTR, #2F5h
		movx	A, @DPTR
		cjne	A, #1, code_78FE
		lcall	code_5FB9

code_78FE:				
		mov	A, RAM_14
		jnz	code_7906
		mov	A, RAM_13
		xrl	A, #2

code_7906:				
		jnz	code_7962
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_797F
		mov	DPTR, #2D2h
		movx	A, @DPTR
		jnz	code_791B
		sjmp	code_795D
; ---------------------------------------------------------------------------

code_791B:				
		mov	DPTR, #2D2h
		movx	A, @DPTR
		cjne	A, #1, code_7930
		lcall	code_CCD8
		lcall	code_4011
		mov	A, R7
		jnz	code_792D
		sjmp	code_795D
; ---------------------------------------------------------------------------

code_792D:				
		ljmp	code_BA8C
; ---------------------------------------------------------------------------

code_7930:				
		mov	DPTR, #2D2h
		movx	A, @DPTR
		cjne	A, #2, code_794C
		lcall	code_CE92
		mov	A, R7
		jz	code_797F
		lcall	code_CCE4
		mov	DPTR, #2FCh
		movx	A, @DPTR
		cjne	A, #1, code_794A
		ljmp	code_B919
; ---------------------------------------------------------------------------

code_794A:				
		sjmp	code_795D
; ---------------------------------------------------------------------------

code_794C:				
		mov	DPTR, #2D2h
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_797F
		lcall	code_CE99
		mov	A, R7
		jz	code_797F
		lcall	code_CCF0

code_795D:				
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_7962:				
		clr	A
		cjne	A, RAM_14, code_797F
		mov	A, RAM_13
		cjne	A, #20h, code_797F
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_797F
		mov	DPTR, #2D2h
		movx	A, @DPTR
		jnz	code_797F
		lcall	code_B672

code_797F:				
		ret

; ======================================================
;
;
;
R4R5_Ramdon_CaculateToR6R7_7980:				
		mov	RAM_1C,R6
		mov	RAM_1D,R7

		mov	RAM_1E,R4
		mov	RAM_1F,R5	 	; 随机数

		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

		mov	A, RAM_1E
		swap	A
		anl	A, #0Fh
		mov	R5, A	  		; R5=u16_ramdon>>12
		mov	A, RAM_1C
		swap	A
		anl	A, #0Fh
		mov	R7, A			; R7=par1>>12
		mov	A, R7	    		; 
		xrl	A, R5
		swap	A
		anl	A, #0F0h
		mov	DPTR, #26Fh
		movx	@DPTR, A   		; (R5^R7)<<12
		clr	A
		inc	DPTR
		movx	@DPTR, A


		mov	A, RAM_1E		;
		swap	A			;
		mov	R0, A			;
		anl	A, #0F0h		;
		xch	A, R0		    	;
		mov	A, RAM_1F  		; 
		swap	A			;
		anl	A, #0Fh		;
		orl	A, R0			;
		anl	A, #0Fh		;
		mov	R5, A			; R5=u16_ramdon>>4;
		mov	A, RAM_1C		;
		anl	A, #0Fh
		mov	R7, A	  		; r7=par1>>8
		mov	A, R7
		xrl	A, R5
		mov	R6, A	     		; R6=R5^R7;
		mov	DPTR, #26Fh
		movx	A, @DPTR
		orl	A, R6
		movx	@DPTR, A	  	; RESULT|=R6<<8;
		inc	DPTR
		movx	A, @DPTR
		movx	@DPTR, A


		mov	A, RAM_1F		;
		anl	A, #0Fh		;
		mov	R5, A	   		; R5=u16_ramdon&0X0F;

		mov	A, RAM_1C		;
		swap	A			;
		mov	R0, A			;
		anl	A, #0F0h		;
		xch	A, R0			;
		mov	A, RAM_1D		;
		swap	A			;
		anl	A, #0Fh   		; 
		orl	A, R0			;
		anl	A, #0Fh		;
		mov	R7, A		     	; r7=(par1>>4)&0X0F

		mov	A, R7			;
		xrl	A, R5			; (R5^R7)<<4
		swap	A			;
		mov	R0, A			;
		anl	A, #0Fh		;
		xch	A, R0			;
		xrl	A, R0			;
		mov	R7, A			;
		clr	A			;
		swap	A			;
		anl	A, #0F0h		;
		orl	A, R0			;
		mov	R6, A			;
		mov	DPTR, #26Fh		;
		movx	A, @DPTR		;
		orl	A, R6			;
		movx	@DPTR, A		;
		inc	DPTR
		movx	A, @DPTR
		orl	A, R7
		movx	@DPTR, A


		mov	A, RAM_1E		; r7=(par1>>8)&0X0F
		anl	A, #0Fh	  	; 
		mov	R7, A
		mov	A, RAM_1D
		anl	A, #0Fh
		mov	R5, A	 		; R5=u16_ramdon&0X0F;
		mov	A, R5
		xrl	A, R7
		mov	R7, A	    		; R7=R7^R5;

		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		orl	A, R7
		mov	R7, A
		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		mov	R6, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A



		ret



; ======================================================


code_7A16:				
		mov	RAM_9, R5
		mov	A, R7
		lcall	switch_13AA
;  code_7A16

; ---------------------------------------------------------------------------
		dw code_7A35
		db    1
		dw code_7A3E
		db    2
		dw code_7A45
		db    3
		dw code_7A48
		db    4
		dw code_7A51
		db    5
		dw code_7A56
		db    6
		dw code_7A95
		db    7
		db 0
		db    0
		dw code_7AA9
; ---------------------------------------------------------------------------

code_7A35:				
		lcall	code_B6C7
		lcall	code_C863
		ljmp	code_B859
; ---------------------------------------------------------------------------

code_7A3E:				
		mov	R5, RAM_D
		mov	R7, RAM_9
		ljmp	code_BF4B
; ---------------------------------------------------------------------------

code_7A45:				
		ljmp	code_C851
; ---------------------------------------------------------------------------

code_7A48:				
		mov	R4, RAM_C
		mov	R5, RAM_D
		mov	R7, RAM_9
		ljmp	code_5D3E
; ---------------------------------------------------------------------------

code_7A51:				
		mov	R7, RAM_9
		ljmp	code_CEB2
; ---------------------------------------------------------------------------

code_7A56:				
		mov	DPTR, #0A9h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R4, A
		mov	R5, A
		mov	R3, RAM_D
		mov	R2, RAM_C
		mov	R1, RAM_B
		mov	R0, RAM_A
		clr	C
		lcall	code_12DA
		jz	code_7A7E
		mov	DPTR, #0A9h
		mov	A, RAM_C
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_D
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		sjmp	code_7A84
; ---------------------------------------------------------------------------

code_7A7E:				
		mov	DPTR, #0ABh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_7A84:				
		mov	DPTR, #0A9h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0ABh
		ljmp	code_35E7
; ---------------------------------------------------------------------------

code_7A95:				
		mov	DPTR, #0A9h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_721A
		clr	A
		mov	DPTR, #0A9h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_7AA9:				
		ret

; ======================================================


code_7AAA:				
		mov	RAM_18,	R7
		mov	RAM_19,	R4
		mov	RAM_1A,	R5
		clr	C
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, #80h
		jc	code_7AC6
		setb	C
		mov	A, RAM_1A
		subb	A, #0Fh
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, #0A7h
		jc	code_7AC9

code_7AC6:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_7AC9:				
		mov	A, RAM_18
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		cjne	A, RAM_1A, code_7AFF
		mov	A, B
		cjne	A, RAM_19, code_7AFF
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_7AFF:				
		mov	A, RAM_18
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	DPL, R7
		mov	DPH, A
		mov	A, RAM_19
		mov	B, RAM_1A
		lcall	code_121F
		mov	DPTR, #2Eh
		movx	A, @DPTR
		jnz	code_7B34
		lcall	ClearState_CE40
		lcall	code_6F66
		mov	DPTR, #274h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7B34:				
		mov	DPTR, #2Ch
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_7AAA


; ======================================================


code_7B3C:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		xrl	A, #6
		jnz	code_7B60
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		push	RAM_6
		push	RAM_7
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R6
		mov	R4, A
		mov	A, R5
		pop	RAM_7
		pop	RAM_6
		ljmp	code_CE6F
; ---------------------------------------------------------------------------

code_7B60:				
		mov	DPTR, #31Dh
		movx	A, @DPTR
		xrl	A, #10h
		jnz	code_7BCA
		mov	DPTR, #276h
		movx	@DPTR, A

code_7B6C:				
		mov	DPTR, #322h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R5, A
		clr	C
		subb	A, R7
		jnc	code_7BC7
		mov	DPTR, #31Eh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	A, R3
		mov	R7, A
		mov	A, R5
		clr	C
		rrc	A
		mov	R3, A
		mov	R2, #0
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R2
		addc	A, R6
		mov	R6, A
		push	RAM_6
		push	RAM_7
		mov	A, #23h
		add	A, R5
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		mov	DPTR, #276h
		movx	A, @DPTR
		add	A, #24h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R5, A
		mov	A, R6
		mov	R4, A
		mov	A, R5
		pop	RAM_7
		pop	RAM_6
		lcall	code_CE6F
		mov	A, R7
		jnz	code_7BBE
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7BBE:				
		mov	DPTR, #276h
		movx	A, @DPTR
		add	A, #2
		movx	@DPTR, A
		sjmp	code_7B6C
; ---------------------------------------------------------------------------

code_7BC7:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_7BCA:				
		mov	R7, #0
		ret
;  code_7B3C


; ======================================================


code_7BCD:				
		clr	A
		mov	DPTR, #272h
		movx	@DPTR, A

code_7BD2:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1Ch
		jc	code_7BDF
		ljmp	code_7C5D
; ---------------------------------------------------------------------------

code_7BDF:				
		mov	A, R7
		cjne	A, #8, code_7BFC
		mov	DPTR, #8Eh
		movx	A, @DPTR
		jnz	code_7BF6
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #10h
		jz	code_7BF6
		mov	A, R7
		cjne	A, #11h, code_7BFC

code_7BF6:				
		mov	DPTR, #272h
		movx	A, @DPTR
		sjmp	code_7C18
; ---------------------------------------------------------------------------

code_7BFC:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #9, code_7C2A
		mov	DPTR, #8Eh
		movx	A, @DPTR
		jnz	code_7C17
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R6, A
		xrl	A, #10h
		jz	code_7C17
		mov	A, R6
		cjne	A, #11h, code_7C2A

code_7C17:				
		mov	A, R7

code_7C18:				
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_7C54
; ---------------------------------------------------------------------------

code_7C2A:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #6
		mul	AB
		add	A, #0B9h
		mov	DPL, A
		clr	A
		addc	A, #6Eh
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R4, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R5, A
		mov	A, R7
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A

code_7C54:				
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		ljmp	code_7BD2
; ---------------------------------------------------------------------------

code_7C5D:				
		ret
;  code_7BCD


; ======================================================
;
;
;
RESET_0:				

		mov	R0, #7Fh
		clr	A
code_7C61:				
		mov	@R0, A
		djnz	R0, code_7C61





	;	mov	SP, #0x3b
		MOV	SP,#0X50
		ljmp	code_7CA5
; ---------------------------------------------------------------------------

code_7C6A:				
		ljmp	main_C514
; ---------------------------------------------------------------------------

code_7C6D:				
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		mov	R0, A

code_7C71:				
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		jc	code_7C79
		mov	@R0, A
		sjmp	code_7C7A
; ---------------------------------------------------------------------------

code_7C79:				
		movx	@R0, A

code_7C7A:				
		inc	R0
		djnz	R7, code_7C71
		sjmp	code_7CA8
; ---------------------------------------------------------------------------

code_7C7F:				
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		mov	R0, A
		anl	A, #7
		add	A, #0Ch
		xch	A, R0
		clr	C
		rlc	A
		swap	A
		anl	A, #0Fh
		orl	A, #20h
		xch	A, R0
		movc	A, @A+PC
		jc	code_7C97
		cpl	A
		anl	A, @R0
		sjmp	code_7C98
; ---------------------------------------------------------------------------
code_7C97:				
		orl	A, @R0
code_7C98:				
		mov	@R0, A
		djnz	R7, code_7C7F
		sjmp	code_7CA8
; ---------------------------------------------------------------------------
		db    1
		db    2
		db    4
		db    8
		db  10h
		db  20h
		db  40h
		db  80h
; ---------------------------------------------------------------------------

code_7CA5:				
		mov	DPTR, #0CD84h

code_7CA8:				
		clr	A
		mov	R6, #1
		movc	A, @A+DPTR
		jz	code_7C6A
		inc	DPTR
		mov	R7, A
		anl	A, #3Fh
		jnb	ACC.5, code_7CBE
		anl	A, #1Fh
		mov	R6, A
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		jz	code_7CBE
		inc	R6

code_7CBE:				
		xch	A, R7
		anl	A, #0C0h
		add	A, ACC
		jz	code_7C6D
		jc	code_7C7F
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		mov	R2, A
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		mov	R0, A

code_7CCF:				
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		xch	A, R0
		xch	A, DPL
		xch	A, R0
		xch	A, R2
		xch	A, DPH
		xch	A, R2
		movx	@DPTR, A
		inc	DPTR
		xch	A, R0
		xch	A, DPL
		xch	A, R0
		xch	A, R2
		xch	A, DPH
		xch	A, R2
		djnz	R7, code_7CCF
		djnz	R6, code_7CCF
		sjmp	code_7CA8
;  


; ======================================================
;
;
;
code_7CEA:				
		mov	RAM_8, R7
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_7D0A
		lcall	code_AD91
		mov	A, R7
		jz	code_7D0A
		mov	DPTR, #162h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #162h
		mov	A, #0FFh
		movx	@DPTR, A

code_7D0A:				
		lcall	code_AD1F
		mov	A, R7
		xrl	A, RAM_8
		jnz	code_7D6F
		mov	DPTR, #3A2h
		movx	A, @DPTR
		jnz	code_7D28
		
		mov	R3, #1
		mov	R2, #1
		mov	R1, #9Bh
		mov	RAM_2E,#0FFh
		mov	R5, #6
		lcall	code_C21A
		
		sjmp	code_7D4C
; ---------------------------------------------------------------------------

code_7D28:				
		mov	RAM_1E,#1
		mov	RAM_1F,#1
		mov	RAM_20,#9Bh
		mov	R3, #1
		mov	R2, #3
		mov	R1, #9Ch
		lcall	code_C411
		mov	RAM_C, #1
		mov	RAM_D, #1
		mov	RAM_E, #9Eh
		mov	R3, #1
		mov	R2, #3
		mov	R1, #9Fh
		lcall	code_C429

code_7D4C:				
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jz	code_7D55
		lcall	code_C9A5

code_7D55:				
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_7D5D
		inc	DPTR
		movx	A, @DPTR

code_7D5D:				
		jnz	code_7D66
		mov	DPTR, #0A4h
		movx	A, @DPTR
		anl	A, #0FCh
		movx	@DPTR, A

code_7D66:				
		mov	DPTR, #139h
		movx	A, @DPTR
		jz	code_7D6F
		lcall	code_6A73

code_7D6F:				
		ret
;  code_7CEA


; ======================================================


code_7D70:				
		mov	RAM_18,	R7
		mov	RAM_19,	R4
		mov	RAM_1A,	R5
		clr	C
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, #80h
		jnc	code_7D82
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_7D82:				
		mov	A, RAM_18
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		cjne	A, RAM_1A, code_7DB8
		mov	A, B
		cjne	A, RAM_19, code_7DB8
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_7DB8:				
		mov	A, RAM_18
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	DPL, R7
		mov	DPH, A
		mov	A, RAM_19
		mov	B, RAM_1A
		lcall	code_121F
		mov	DPTR, #2Eh
		movx	A, @DPTR
		jnz	code_7DED
		lcall	ClearState_CE40
		lcall	code_6F66
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_7DED:				
		mov	DPTR, #2Ch
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_7D70


; ======================================================


code_7DF5:				
		mov	DPTR, #2D0h
		movx	A, @DPTR
		lcall	switch_13AA
		mov	R6, #3Ch
		inc	RAM_7E
		orl	A, R0
		dec	A
		mov	R6, #4Bh
		dec	RAM_7E
		orl	A, R6
		dec	@R0
		mov	R6, #51h
		dec	@R1
		mov	R6, #45h
		dec	R6
		mov	R6, #54h
		dec	R7
		mov	R6, #57h
		ret
;  code_7DF5

; ---------------------------------------------------------------------------
		db  7Eh
		db  5Dh
		db  23h
		db  7Eh
		db  5Ah
		db  24h
		db  7Eh
		db  42h
		db  25h
		db  7Eh
		db  3Fh
		db  28h
		db  7Eh
		db  66h
		db  32h
		db  7Eh
		db  60h
		db  33h
		db  7Eh
		db  63h
		db  35h
		db  7Eh
		db  69h
		db  37h
		db  7Eh
		db  6Ch
		db  38h
		db  7Eh
		db  6Fh
		db  46h
		db  7Eh
		db  72h
		db  47h
		db  7Eh
		db  75h
		db  48h
		db    0
		db    0
		db  7Eh
		db  78h
		db    2
		db 0BAh
		db 0D5h
		db    2
		db 0AFh
		db  4Dh
		db    2
		db 0AEh
		db 0A8h
		db    2
		db 0CCh
		db  27h
		db    2
		db 0CCh
		db  1Ah
		db    2
		db 0CEh
		db  15h
		db    2
		db 0CBh
		db  47h
		db    2
		db 0CBh
		db  56h
		db    2
		db 0CCh
		db 0CCh
		db    2
		db 0B2h
		db 0F6h
		db    2
		db 0BAh
		db 0F9h
		db    2
		db 0CBh
		db 0CAh
		db    2
		db 0CDh
		db    8
		db    2
		db 0CBh
		db  74h
		db    2
		db 0CCh
		db  68h
		db    2
		db 0CCh
		db  75h
		db    2
		db 0CCh
		db  8Fh
		db    2
		db 0CFh
		db    6
		db    2
		db 0CFh
		db  0Ch
		db  12h
		db 0CFh
		db  12h
		db  22h

; ======================================================


code_7E79:				

; FUNCTION CHUNK AT 0000C5F2 SIZE 00000015 BYTES

		mov	RAM_10,	R7
		mov	DPTR, #31Bh
		movx	A, @DPTR
		xrl	A, #1
		jnz	code_7EFB
		mov	DPTR, #352h
		movx	A, @DPTR
		xrl	RAM_10,	A
		mov	A, R5
		jz	code_7EBF
		mov	R7, RAM_10
		lcall	code_C193
		mov	A, R7
		jz	code_7EFB
		mov	DPTR, #319h
		movx	A, @DPTR
		jz	code_7E9C
		clr	A
		movx	@DPTR, A

code_7E9C:				
		clr	A
		mov	R7, A
		lcall	SM2_CC0D
		mov	DPTR, #319h
		movx	A, @DPTR
		mov	R6, #0
		mov	R3, #1
		add	A, #13h
		mov	R1, A
		mov	A, R6
		addc	A, #3
		mov	R2, A
		mov	A, RAM_10
		lcall	WriteACC_ToR3R2R1_10B6
		mov	DPTR, #319h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_7EBF:				
		mov	DPTR, #319h
		movx	A, @DPTR
		mov	R7, A
		jz	code_7EFB
		mov	R6, #0
		mov	R3, #1
		mov	A, #13h
		add	A, R7
		mov	R1, A
		mov	A, R6
		addc	A, #3
		mov	R2, A
		mov	A, RAM_10
		lcall	WriteACC_ToR3R2R1_10B6
		mov	DPTR, #319h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #319h
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_7EFB
		lcall	code_CEA0
		lcall	code_C682
		mov	A, R7
		jz	code_7EF8
		lcall	code_CDDE
		ljmp	code_C5F2
; ---------------------------------------------------------------------------

code_7EF8:				
		lcall	code_C4B8

code_7EFB:				
		ret
;  code_7E79


; ======================================================


code_7EFC:				
		mov	DPTR, #269h
		mov	A, #1
		movx	@DPTR, A
		clr	A
		mov	R7, A
		mov	R6, A
		mov	R5, A
		mov	R4, A
		mov	DPTR, #1DDh
		lcall	code_12F7
		lcall	code_F11
		jz	code_7F14
		jnc	code_7F23

code_7F14:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A
		mov	DPTR, #1DDh
		lcall	code_130F
		addc	A, R4
		rl	A
		xchd	A, @R1
		inc	R2

code_7F23:				
		mov	DPTR, #1E3h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		setb	C
		mov	DPTR, #1E8h
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #1E7h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jc	code_7F59
		mov	DPTR, #1E5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		setb	C
		mov	DPTR, #1EAh
		movx	A, @DPTR
		subb	A, R7
		mov	A, R6
		xrl	A, #80h
		mov	R0, A
		mov	DPTR, #1E9h
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, R0
		jnc	code_7F78

code_7F59:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A
		mov	DPTR, #1E3h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		mov	A, #7Fh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0FFh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #27h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A

code_7F78:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_7EFC


; ======================================================


code_7F7E:				
		mov	R4, RAM_7
		mov	A, R4
		jz	code_7FFF
		lcall	DS1302_C000
		mov	A, R4
		jnb	ACC.0, code_7F99
		mov	DPTR, #39Ch
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #8Ch
		lcall	DS1302_C004

code_7F99:				
		mov	A, R4
		jnb	ACC.1, code_7FAC
		mov	DPTR, #39Dh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #88h
		lcall	DS1302_C004

code_7FAC:				
		mov	A, R4
		jnb	ACC.2, code_7FBF
		mov	DPTR, #39Eh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #86h
		lcall	DS1302_C004

code_7FBF:				
		mov	A, R4
		jnb	ACC.3, code_7FD2
		mov	DPTR, #39Fh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #84h
		lcall	DS1302_C004

code_7FD2:				
		mov	A, R4
		jnb	ACC.4, code_7FE5
		mov	DPTR, #3A0h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #82h
		lcall	DS1302_C004

code_7FE5:				
		mov	A, R4
		jnb	ACC.5, code_7FF8
		mov	DPTR, #3A1h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #80h
		lcall	DS1302_C004

code_7FF8:				
		mov	R5, #80h
		mov	R7, #8Eh
		lcall	DS1302_C004

code_7FFF:				
		ret
;  

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_9D7A

code_8000:				
		clr	A
		mov	DPTR, #168h
		movx	@DPTR, A
		mov	DPTR, #167h
		movx	@DPTR, A
		mov	DPTR, #169h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #274h
		movx	@DPTR, A

code_802B:				
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jnc	code_805D
		mov	A, R7
		add	A, ACC
		add	A, #77h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #274h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_802B
; ---------------------------------------------------------------------------

code_805D:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #9Bh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #6
		lcall	code_C21A
		mov	DPTR, #54h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #162h
		movx	@DPTR, A
		mov	DPTR, #0F7h
		movx	@DPTR, A
		lcall	code_CEB8
		ljmp	code_909C
;  CHUNK	FOR code_9D7A

; ======================================================


code_807F:				
		mov	RAM_2F,	R3
		mov	RAM_30,	R2
		mov	RAM_31,	R1
		clr	A
		mov	B, A
		lcall	code_1200
		clr	A
		mov	DPTR, #2BDh
		movx	@DPTR, A

code_8090:				
		mov	DPTR, #2BDh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_809F
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_809F:				
		jb	P3.2, code_8090
		clr	A
		mov	DPTR, #2BDh
		movx	@DPTR, A

code_80A7:				
		mov	R3, RAM_2F
		mov	R2, RAM_30
		mov	R1, RAM_31
		lcall	code_119D
		add	A, ACC
		mov	R7, A
		mov	A, B
		rlc	A
		mov	B, R7
		lcall	code_1200
		mov	R3, RAM_2F
		mov	R2, RAM_30
		mov	R1, RAM_31
		lcall	code_119D
		mov	R5, A
		mov	R4, B
		lcall	code_B3EB
		mov	A, R4
		mov	R6, A
		mov	A, R5
		orl	A, R7
		mov	R7, A
		mov	A, R6
		mov	B, R7
		lcall	code_1200
		mov	DPTR, #2BDh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #10h
		jc	code_80A7
		clr	A
		mov	DPTR, #2BDh
		movx	@DPTR, A

code_80E6:				
		lcall	code_B3EB
		mov	DPTR, #2BDh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_80E6
		mov	R7, #0Ah
		lcall	code_CD8E
		mov	R7, #1
		ret
;  code_807F


; ======================================================


code_80FD:				
		mov	RAM_21,	R3
		mov	RAM_22,	R2
		mov	RAM_23,	R1
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		lcall	R3R2R1_GetACC_103D
		mov	R6, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		lcall	R3R2R1_GetACC_103D
		mov	R5, A
		setb	C
		subb	A, R6
		jc	code_811E
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_811E:				
		mov	A, R5
		clr	C
		subb	A, R6
		jnc	code_8126
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_8126:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R6, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		setb	C
		subb	A, R6
		jc	code_8147
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_8147:				
		mov	A, R5
		clr	C
		subb	A, R6
		jnc	code_814F
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_814F:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	R6, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		setb	C
		subb	A, R6
		jc	code_8170
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_8170:				
		mov	A, R5
		clr	C
		subb	A, R6
		jnc	code_8178
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_8178:				
		mov	R7, #0
		ret
;  code_80FD


; ======================================================


code_817B:				
		mov	RAM_21,	R3
		mov	RAM_22,	R2
		mov	RAM_23,	R1
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		lcall	R3R2R1_GetACC_103D
		mov	R6, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		lcall	R3R2R1_GetACC_103D
		mov	R5, A
		setb	C
		subb	A, R6
		jc	code_819C
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_819C:				
		mov	A, R5
		clr	C
		subb	A, R6
		jnc	code_81A4
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_81A4:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R6, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		mov	DPTR, #1
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		setb	C
		subb	A, R6
		jc	code_81C5
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_81C5:				
		mov	A, R5
		clr	C
		subb	A, R6
		jnc	code_81CD
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_81CD:				
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	R6, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		setb	C
		subb	A, R6
		jc	code_81EE
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_81EE:				
		mov	A, R5
		clr	C
		subb	A, R6
		jnc	code_81F6
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_81F6:				
		mov	R7, #0
		ret
;  code_817B


; ======================================================


code_81F9:				
		lcall	code_AD1F
		mov	DPTR, #26Ah
		mov	A, R7
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #52h
		mov	R5, #8
		lcall	code_AC05
		clr	A
		mov	DPTR, #270h
		movx	@DPTR, A

code_8211:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #270h
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jnc	code_8275
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	B, #2
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	RAM_10,	#5
		lcall	code_546D
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	R5, #5
		lcall	code_AC05
		mov	DPTR, #270h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_8211
; ---------------------------------------------------------------------------

code_8275:				
		ret
;  code_81F9


; ======================================================


code_8276:				
		mov	R7, #80h
		lcall	code_B8F3
		mov	DPTR, #26Bh
		mov	A, R7
		movx	@DPTR, A
		cjne	R7, #0FFh, code_8286
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8286:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		jnb	ACC.7, code_82A3
		anl	A, #7Fh
		lcall	DS1302_BFFF
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R5, A
		mov	R7, #80h
		lcall	DS1302_C004
		mov	R5, #80h
		mov	R7, #8Eh
		lcall	DS1302_C004

code_82A3:				
		mov	R7, #84h
		lcall	code_B8F3
		mov	DPTR, #26Ch
		mov	A, R7
		movx	@DPTR, A
		jnb	ACC.7, code_82EF
		movx	A, @DPTR
		mov	R7, A
		anl	A, #0Fh
		mov	R5, A
		mov	R4, #0
		mov	A, R7
		mov	R6, #0
		jnb	ACC.5, code_82C1
		mov	R7, #0Ch
		sjmp	code_82C3
; ---------------------------------------------------------------------------

code_82C1:				
		mov	R7, #0

code_82C3:				
		mov	A, R7
		add	A, R5
		mov	R7, A
		mov	A, R6
		addc	A, R4
		mov	R6, A
		mov	R4, #0
		mov	R5, #18h
		lcall	DIV_10FC
		mov	R7, RAM_5
		mov	DPTR, #26Ch
		mov	A, R5
		lcall	DS1302_BFFF
		mov	DPTR, #26Ch
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #84h
		lcall	DS1302_C004
		mov	R5, #80h
		mov	R7, #8Eh
		lcall	DS1302_C004

code_82EF:				
		mov	R7, #1
		ret
;  code_8276


; ======================================================


code_82F2:				
		mov	RAM_8, R3
		mov	RAM_9, R2
		mov	RAM_A, R1
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0A6h
		mov	RAM_1E,#0
		mov	RAM_1F,#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #0Bh
		lcall	IAP_READ_9B02		; 0X18
		mov	A, R7
		jnz	code_8311
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8311:				
		mov	DPTR, #2A6h
		movx	A, @DPTR
		xrl	A, #88h
		jz	code_831C
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_831C:				
		mov	R3, RAM_8
		mov	R2, RAM_9
		mov	R1, RAM_A
		mov	RAM_1E,#0
		mov	RAM_1F,#3Dh
		mov	R5, #1
		mov	R4, #0
		mov	R7, #0Bh
		lcall	IAP_READ_9B02		; 0X19
		mov	A, R7
		jnz	code_8336
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8336:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0A7h
		mov	RAM_1E,#0
		mov	RAM_1F,#2
		mov	R5, #3Eh
		mov	R4, #0
		mov	R7, #0Bh
		lcall	IAP_READ_9B02			; 1
		mov	A, R7
		jnz	code_8350
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8350:				
		mov	R3, RAM_8
		mov	R2, RAM_9
		mov	R1, RAM_A
		mov	R5, #3Dh
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #2A7h
		movx	A, @DPTR
		xrl	A, R6
		jnz	code_8365
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R7

code_8365:				
		jz	code_836A
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_836A:				
		mov	R7, #1
		ret
;  code_82F2


; ======================================================
;
;
; r3r2r1 from  数组 准备写入
; r22r23    写入多少个
; R7 是扇区
;
;
;
IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D:	

	;	mov	RAM_1C,R7			; 扇区
	
	;	mov	RAM_1D,R4			; 
	;	mov	RAM_1E,R5			; 6.8版本编号称重表_20201212_004.bin 是这个程序
	
		nop					; 
		nop					; 我现在跳去了这里 2023-8-20
		nop					; 
		LJMP	AT24C64_Write_Page_addr6r7_NumE_F3
		
		mov	RAM_1F,R3			; 
		mov	RAM_20,R2			; 
		mov	RAM_21,R1			; 
		
		mov	C, EA
		clr	A
		rlc	A
		mov	DPTR, #2B6h
		movx	@DPTR, A
		clr	EA
		inc	DPTR
		mov	A, #1
		movx	@DPTR, A
		
		lcall	ClearState_CE40
		
		mov	A, RAM_1C
		add	A, #0FFh
		mov	R7, A
		mov	A, R7			; R6R7=(扇区-1)*2
		add	A, ACC
		mov	R7, A
		mov	A, R7			; RAM_1D|=
		mov	R6, A
		mov	A, R6
		orl	RAM_1D,A
		
		clr	A
		mov	DPTR, #2B8h		; i=0;
		movx	@DPTR, A		; 

code_839D:				
		mov	DPTR, #2B8h		; 
		movx	A, @DPTR		;
		mov	R5, A			; 
		mov	R7, A			;
		mov	R6, #0		;
		clr	C			;
		subb	A, RAM_23		; 
		mov	A, R6
		subb	A, RAM_22
		jnc	code_83D8		; for(i=0;i<time;i++)
						; {
		mov	A, RAM_1E		;
		add	A, R7			;
		mov	R7, A			; 
		mov	A, R6			;	 
		addc	A, RAM_1D		;	r6r7+=RAM_1D,RAM_1E
		mov	R6, A
		
		mov	R3, RAM_1F
		mov	R2, RAM_20
		mov	R1, RAM_21
		mov	DPL, R5
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056;	
		mov	R5, A
		lcall	IapProgramByte_r6r7Addr_9914
		mov	A, R7			; 	IapProgramByte_r6r7Addr_9914(r6r7[i],buff[i+])
		jnz	code_83D0
		mov	DPTR, #2B7h
		movx	@DPTR, A
		sjmp	code_83D8
; ---------------------------------------------------------------------------

code_83D0:				
		mov	DPTR, #2B8h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		
		sjmp	code_839D
; ---------------------------------------------------------------------------

code_83D8:				
		lcall	FLAG_SETB_CE7D
		
		mov	DPTR, #2B6h
		movx	A, @DPTR
		add	A, #0FFh
		mov	EA,C
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
 


; ======================================================
;
;
;
IAP_Write_R3R2R1_83E7:	

		mov	RAM_19,R3			; 
		mov	RAM_1A,R2			;
		mov	RAM_1B,R1			;
		
		mov	R7, #0Bh
		lcall	IAP_ERASE_CF27
		
		mov	A, R7
		jnz	code_83F7
		
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_83F7:				
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	RAM_22,#0
		mov	RAM_23,#3Dh			; 61字节
		mov	R5, #1
		mov	R4, #0
		mov	R7, #0Bh
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_8411
		
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8411:				
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	R5, #3Dh
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #2B4h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0B4h
		mov	RAM_22,#0
		mov	RAM_23,#2
		mov	R5, #3Eh
		mov	R4, #0
		mov	R7, #0Bh
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_843E
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_843E:				
		mov	DPTR, #2B3h
		mov	A, #88h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0B3h
		mov	RAM_22,#0
		mov	RAM_23,#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #0Bh
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_845D
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_845D:				
		mov	R7, #1
		ret
;  


; ======================================================
;
; STC11F52XE 有18个扇区  ，每个扇区有512字节
; STC11F60XE 有2个扇区  ，每个扇区有512字节
;
IAP_ERASE_8460:				
		mov	RAM_1C,R7			; RAM_1C=R7;
		mov	A, RAM_1C			; 
		jz	code_846B			; if(RAM_1C==0 || RAM_1C>=0x12)
		setb	C				; {
		subb	A, #12h			;
		jc	code_846E			;

code_846B:						; 
		mov	R7, #0			;	return 0;
		ret					; }
; ---------------------------------------------------------------------------

code_846E:				
		clr	A
	;	mov	DPTR, #2B6h			; sram_2B6=0; original  ; 6.8版本编号称重表_20201212_004 版本程序执行这个
		
		ljmp	AT24C512_fill_19B		; 嵌入式 程序跳去这里	; 现在的程序跳去了这里
		
		
		; --------------------------------------------------------------
		
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A			; sram_2B7=0;
		mov	C, EA
		rlc	A
		inc	DPTR
		movx	@DPTR, A
		
		clr	EA
		lcall	ClearState_CE40

code_847F:						; while(1)
		mov	DPTR, #2B7h			; {
		movx	A, @DPTR
		jnz	code_84C4			;	if(sram_2B7==0)
							;	{
		mov	IAP_CONTR, #83h		;	
		mov	IAP_CMD, #3			;		扇区擦除
		mov	A, RAM_1C			;
		dec	A				;
		mov	R7, A				;
		add	A, ACC			;
		mov	IAP_ADDRH, A		;		IAP_ADDRH=((RAM_1C-1)*2)<<8+0;
		clr	A				;
		mov	IAP_ADDRL, A		;

code_8496:				
		mov	A, PCON			; 		while(PCON&BIT(5))
		jnb	ACC.5, code_84A0		; 		{
		anl	PCON, #0DFh			;			PCON&=0XDF;
		sjmp	code_8496			; 		}
 
code_84A0:				
		mov	IAP_TRIG, #5Ah
		mov	IAP_TRIG, #0A5h
		
		mov	A, IAP_CONTR		;
		jnb	ACC.4, code_84BC		;		if(IAP_CONTR&BIT(4))
							;		{
		anl	IAP_CONTR, #0EFh		;			IAP_CONTR&=0xEF;
		
		mov	DPTR, #2B6h			;			
		movx	A, @DPTR			;
		inc	A				;			sram_2B6++;
		movx	@DPTR, A			;
		movx	A, @DPTR			;
		clr	C				;
		subb	A, #2				;
		jc	code_847F			;			if(sram_2B6>=2)
		sjmp	code_84C4			;				break;

							;		}
code_84BC:				
		mov	DPTR, #2B7h
		mov	A, #1				;		sram_2B7=1;
		movx	@DPTR, A			; 		
		sjmp	code_847F			;	}
							; }
 
code_84C4:				
		lcall	FLAG_SETB_CE7D
		
		lcall	IAP_IDLE_CB0B
		
		mov	DPTR, #2B8h
		movx	A, @DPTR
		add	A, #0FFh
		mov	EA,C
		mov	DPTR, #2B7h
		movx	A, @DPTR
		mov	R7, A
		ret
;  


; ======================================================


code_84D8:				
		clr	C
		mov	A, R4
		xrl	A, #80h
		subb	A, #80h
		jnc	code_84E7
		clr	C
		clr	A
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, R4
		mov	R4, A

code_84E7:				
		mov	DPTR, #1C2h
		movx	A, @DPTR
		jnz	code_84F1
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #1

code_84F1:				
		jnz	code_853C
		mov	A, R7
		add	A, ACC
		add	A, #4Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		setb	C
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, R2
		xrl	A, #80h
		subb	A, R0
		jc	code_8511
		sjmp	code_852E
; ---------------------------------------------------------------------------

code_8511:				
		mov	A, #54h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	A, #54h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		setb	C
		subb	A, #5
		jc	code_854D

code_852E:				
		mov	A, #54h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		sjmp	code_853C
; ---------------------------------------------------------------------------

code_853C:				
		mov	A, R7
		add	A, ACC
		add	A, #4Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A

code_854D:				
		ret
;  code_84D8


; ======================================================


code_854E:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,#0
		mov	RAM_1F,#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #12h
		lcall	IAP_READ_9B02			; 2
		mov	A, R7
		jnz	code_8567
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8567:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #99h
		jz	code_8572
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8572:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		mov	RAM_1E,	#0
		mov	RAM_1F,	#0Eh
		mov	R5, #1
		mov	R4, #0
		mov	R7, #12h
		lcall	IAP_READ_9B02			; 3
		mov	A, R7
		jnz	code_858C
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_858C:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	RAM_1E,	#0
		mov	RAM_1F,	#2
		mov	R5, #0Fh
		mov	R4, #0
		mov	R7, #12h
		lcall	IAP_READ_9B02			; 4
		mov	A, R7
		jnz	code_85A6
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_85A6:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		mov	R5, #0Eh
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #26Ah
		movx	A, @DPTR
		xrl	A, R6
		jnz	code_85BB
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R7

code_85BB:				
		jz	code_85C0
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_85C0:				
		mov	R7, #1
		ret
;  code_854E

; ---------------------------------------------------------------------------

code_85C3:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	A, RAM_14
		jnz	code_85D5
		mov	A, RAM_13
		xrl	A, #2

code_85D5:				
		jnz	code_85FA
		lcall	R3R2R1_GetACC_103D
		jnz	code_8637
		mov	DPTR, #304h
		movx	A, @DPTR
		jnz	code_85EA
		lcall	code_BD03
		mov	A, R7
		jz	code_8637
		sjmp	code_8615
; ---------------------------------------------------------------------------

code_85EA:				
		mov	DPTR, #304h
		movx	A, @DPTR
		xrl	A, #1
		jnz	code_8637
		lcall	code_BD25
		mov	A, R7
		jz	code_8637
		sjmp	code_8622
; ---------------------------------------------------------------------------

code_85FA:				
		mov	A, RAM_14
		jnz	code_8602
		mov	A, RAM_13
		xrl	A, #80h

code_8602:				
		jnz	code_862A
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_8637
		mov	DPTR, #304h
		movx	A, @DPTR
		jnz	code_861B

code_8615:				
		lcall	code_CC41
		ljmp	code_BE51
; ---------------------------------------------------------------------------

code_861B:				
		mov	DPTR, #304h
		movx	A, @DPTR
		cjne	A, #1, code_8637

code_8622:				
		lcall	code_CC4E
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_862A:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_8637:				
		ret

; ======================================================


code_8638:				
		mov	DPTR, #2D1h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	DPTR, #8Dh
		movx	A, @DPTR
		jz	code_8650
		mov	DPTR, #2D1h
		movx	A, @DPTR
		setb	C
		subb	A, #1
		jc	code_8650
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8650:				
		mov	DPTR, #8Fh
		movx	A, @DPTR
		jz	code_8662
		mov	DPTR, #2D1h
		movx	A, @DPTR
		setb	C
		subb	A, #2
		jc	code_8662
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8662:				
		mov	DPTR, #92h
		movx	A, @DPTR
		jz	code_8674
		mov	DPTR, #2D1h
		movx	A, @DPTR
		setb	C
		subb	A, #3
		jc	code_8674
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8674:				
		mov	DPTR, #93h
		movx	A, @DPTR
		jz	code_8686
		mov	DPTR, #2D1h
		movx	A, @DPTR
		setb	C
		subb	A, #4
		jc	code_8686
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8686:				
		mov	DPTR, #94h
		movx	A, @DPTR
		jz	code_8698
		mov	DPTR, #2D1h
		movx	A, @DPTR
		setb	C
		subb	A, #6
		jc	code_8698
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8698:				
		mov	DPTR, #96h
		movx	A, @DPTR
		jz	code_86AA
		mov	DPTR, #2D1h
		movx	A, @DPTR
		setb	C
		subb	A, #9
		jc	code_86AA
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_86AA:				
		mov	R7, #1
		ret
;  code_8638


; ======================================================


code_86AD:				
		mov	DPTR, #26h
		movx	A, @DPTR
		jz	code_86C5
		mov	DPTR, #126h
		lcall	code_130F
		nop
		nop
		nop
		nop
		clr	A
		mov	DPTR, #12Dh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_86C5:				
		mov	DPTR, #1E1h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Bh
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #12Ah
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		lcall	code_F83
		mov	DPTR, #1DDh
		lcall	code_12F7
		lcall	code_D6B
		mov	DPTR, #126h
		lcall	code_1303
		clr	A
		mov	R7, A
		mov	R6, A
		mov	R5, A
		mov	R4, #3Fh
		mov	DPTR, #126h
		lcall	code_12F7
		lcall	code_C7A
		lcall	code_FBC
		mov	DPTR, #12Dh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_30E8
		lcall	code_CE1E
		mov	DPTR, #12Dh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_9616
		mov	DPTR, #12Dh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_86AD


; ======================================================


code_8720:				
		mov	R7, #12h
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_872A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_872A:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		mov	RAM_22,#0
		mov	RAM_23,#0Eh
		mov	R5, #1
		mov	R4, #0
		mov	R7, #12h
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_8744
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8744:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		mov	R5, #0Eh
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #279h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #79h
		mov	RAM_22,#0
		mov	RAM_23,#2
		mov	R5, #0Fh
		mov	R4, #0
		mov	R7, #12h
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_8771
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8771:				
		mov	DPTR, #278h
		mov	A, #99h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #78h
		mov	RAM_22,#0
		mov	RAM_23,#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #12h
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_8790
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_8790:				
		mov	R7, #1
		ret
 

; ======================================================
;
;
;
IAP_ReadByte_ByR6R7_8793:				
		mov	RAM_20,R6
		mov	RAM_21,R7
		
		clr	A
		mov	DPTR, #2AAh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_879E:				
		mov	DPTR, #2ABh
		movx	A, @DPTR
		jnz	code_87F3
		
		mov	IAP_CONTR, #83h		; 
		mov	IAP_CMD, #1			; READ
		mov	A, RAM_20			;
		mov	IAP_ADDRH, A		; 
		mov	IAP_ADDRL, RAM_21		; 

code_87B1:				
		mov	A, PCON
		jnb	ACC.5, code_87BB		; while(PCON&BIT(5))PCON&=0XDF;
		anl	PCON, #0DFh
		sjmp	code_87B1
 
code_87BB:				
		mov	C, EA
		clr	A
		rlc	A
		mov	DPTR, #2ACh
		movx	@DPTR, A
		clr	EA
		mov	IAP_TRIG, #5Ah
		mov	IAP_TRIG, #0A5h
		movx	A, @DPTR
		add	A, #0FFh
		mov	EA,	C
		mov	A, IAP_CONTR
		jnb	ACC.4, code_87E6
		anl	IAP_CONTR, #0EFh
		mov	DPTR, #2AAh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jc	code_879E
		sjmp	code_87F3
; ---------------------------------------------------------------------------

code_87E6:				
		mov	A, IAP_DATA
		lcall	WriteACC_ToR3R2R1_10B6
		mov	DPTR, #2ABh
		mov	A, #1
		movx	@DPTR, A
		sjmp	code_879E
; ---------------------------------------------------------------------------

code_87F3:				
		lcall	IAP_IDLE_CB0B
		mov	DPTR, #2AAh
		movx	A, @DPTR
		clr	C
		subb	A, #2
		jnc	code_8803
		mov	R7, #1
		sjmp	code_8805
; ---------------------------------------------------------------------------

code_8803:				
		mov	R7, #0

code_8805:				
		ret
;  


; ======================================================


code_8806:				
		mov	R5, RAM_7
		mov	R4, RAM_6
		clr	A
		mov	DPTR, #273h
		movx	@DPTR, A

code_880F:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_8832
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		jz	code_8832
		mov	DPTR, #273h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_880F
; ---------------------------------------------------------------------------

code_8832:				
		mov	DPTR, #273h
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_883E
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_883E:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		add	A, ACC
		add	A, ACC
		add	A, #80h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Eh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #1
		movx	@DPTR, A
		ret
;  code_8806


; ======================================================


code_8877:				
		lcall	R3R2R1_GetACC_103D
		mov	R7, A
		clr	C
		subb	A, #0
		jc	code_88E0
		mov	A, R7
		setb	C
		subb	A, #63h
		jnc	code_88E0
		mov	DPTR, #1

code_8889:
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_88E0
		mov	A, R7
		setb	C
		subb	A, #0Ch
		jnc	code_88E0
		mov	DPTR, #2
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_88E0
		mov	A, R7
		setb	C
		subb	A, #1Fh
		jnc	code_88E0
		mov	DPTR, #3
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		clr	C
		subb	A, #0
		jc	code_88E0
		mov	A, R7
		setb	C
		subb	A, #17h
		jnc	code_88E0
		mov	DPTR, #4
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		clr	C
		subb	A, #0
		jc	code_88E0
		mov	A, R7
		setb	C
		subb	A, #3Bh
		jnc	code_88E0
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		clr	C
		subb	A, #0
		jc	code_88E0
		mov	A, R7
		setb	C
		subb	A, #3Bh
		jc	code_88E3

code_88E0:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_88E3:				
		mov	R7, #1
		ret
;  code_8877


; ======================================================


code_88E6:				
		mov	RAM_18,	R6
		mov	RAM_19,	R7
		mov	RAM_1A,	R3
		mov	RAM_1B,	R2
		mov	RAM_1C,	R1
		lcall	code_CEDC
		mov	A, R7
		jz	code_8954
		mov	R3, RAM_1A
		mov	R2, RAM_1B
		mov	R1, RAM_1C
		lcall	R3R2R1_GetACC_103D
		jnz	code_8954
		mov	R7, RAM_19
		mov	R6, RAM_18
		lcall	code_A01E
		mov	A, R7
		jz	code_892A
		mov	R7, RAM_19
		mov	R6, RAM_18
		lcall	code_9968
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #2CBh
		movx	A, @DPTR
		mov	R6, A
		mov	A, R7
		clr	C
		subb	A, R6
		jnc	code_8954
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	DPTR, #2CCh
		sjmp	code_8947
; ---------------------------------------------------------------------------

code_892A:				
		clr	A
		cjne	A, RAM_19, code_8954
		mov	A, RAM_18
		cjne	A, #20h, code_8954
		mov	DPTR, #2CCh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #2CBh
		movx	A, @DPTR
		mov	R6, A
		mov	A, R7
		mov	B, R6
		div	AB
		inc	DPTR
		mov	A, B

code_8947:				
		movx	@DPTR, A
		clr	A
		mov	DPTR, #374h
		movx	@DPTR, A
		mov	DPTR, #373h
		movx	@DPTR, A
		lcall	code_AA1A

code_8954:				
		ret
;  code_88E6


; ======================================================


code_8955:				
		mov	DPTR, #2CFh
		movx	A, @DPTR
		jnz	code_897D
		mov	DPTR, #361h
		mov	A, #39h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #5Ch
		movx	@DPTR, A
		mov	DPTR, #2F2h
		mov	A, #2
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #20h
		mov	R1, #69h
		mov	DPTR, #1C2h
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		lcall	code_BCBF
		ljmp	code_A449
; ---------------------------------------------------------------------------

code_897D:				
		mov	DPTR, #2F2h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #39h
		movx	@DPTR, A
		mov	DPTR, #2CFh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #362h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #2CFh
		movx	A, @DPTR
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	RAM_1C,	A
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_1D,	A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_1E,	A
		mov	RAM_1F,	#1
		mov	R3, #2
		mov	R5, #5
		mov	R7, #2
		lcall	code_B88B
		lcall	code_6D52
		ret
;  code_8955

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_921C

code_89C4:				
		mov	R3, RAM_5
		mov	R2, RAM_7
		mov	A, RAM_3B
		jz	code_8A31
		mov	DPTR, #1EEh
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R1, RAM_5
		mov	DPTR, #1EDh
		movx	A, @DPTR
		cjne	A, RAM_1, code_89E9
		setb	C
		sjmp	code_89EA
; ---------------------------------------------------------------------------

code_89E9:				
		clr	C

code_89EA:				
		jc	code_8A31
		mov	DPTR, #1EEh
		movx	A, @DPTR
		mov	R7, A
		mov	B, #6
		mul	AB
		add	A, #0EFh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R2
		movx	@DPTR, A
		mov	A, R7
		mov	B, #6
		mul	AB
		add	A, #0F0h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, R3
		movx	@DPTR, A
		mov	R7, RAM_34
		mov	R6, RAM_33
		mov	R5, RAM_32
		mov	R4, RAM_31
		mov	DPTR, #1EEh
		movx	A, @DPTR
		mov	B, #6
		mul	AB
		add	A, #0F1h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		lcall	code_1303
		mov	DPTR, #1EEh
		mov	A, R1
		movx	@DPTR, A

code_8A31:				
		ret
;  CHUNK	FOR code_921C
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C696

code_8A32:				
		mov	R3, RAM_5
		mov	R2, RAM_7
		mov	A, RAM_3B
		jz	code_8A9F
		mov	DPTR, #22Ch
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		mov	R4, #0
		mov	R5, #0Ah
		lcall	DIV_10FC
		mov	R1, RAM_5
		mov	DPTR, #22Bh
		movx	A, @DPTR
		cjne	A, RAM_1, code_8A57
		setb	C
		sjmp	code_8A58
; ---------------------------------------------------------------------------

code_8A57:				
		clr	C

code_8A58:				
		jc	code_8A9F
		mov	DPTR, #22Ch
		movx	A, @DPTR
		mov	R7, A
		mov	B, #6
		mul	AB
		add	A, #2Dh
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		mov	A, R2
		movx	@DPTR, A
		mov	A, R7
		mov	B, #6
		mul	AB
		add	A, #2Eh
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		mov	A, R3
		movx	@DPTR, A
		mov	R7, RAM_3A
		mov	R6, RAM_39
		mov	R5, RAM_38
		mov	R4, RAM_37
		mov	DPTR, #22Ch
		movx	A, @DPTR
		mov	B, #6
		mul	AB
		add	A, #2Fh
		mov	DPL, A
		clr	A
		addc	A, #2
		mov	DPH, A
		lcall	code_1303
		mov	DPTR, #22Ch
		mov	A, R1
		movx	@DPTR, A

code_8A9F:				
		ret
;  CHUNK	FOR 

; ======================================================


code_8AA0:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		clr	C
		rrc	A
		mov	DPTR, #273h
		movx	@DPTR, A
		movx	A, @DPTR
		add	A, ACC
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2Fh
		movx	A, @DPTR
		mov	R7, A
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_1365
		mov	R2, #0
		mov	R1, #2
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_1365
		mov	DPTR, #273h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R2, #0
		mov	R1, #42h
		movx	A, @DPTR
		mov	R7, A
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_1365
		mov	R2, #0
		mov	R1, #14h
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		ljmp	code_1365
;  code_8AA0


; ======================================================


code_8B0C:				
		mov	A, R7
		lcall	switch_13AA
;  code_8B0C

; ---------------------------------------------------------------------------
		dw code_8B44
		db    0
		dw code_8B47
		db    1
		dw code_8B4A
		db    2
		dw code_8B4D
		db    3
		dw code_8B50
		db    4
		dw code_8B53
		db    5
		dw code_8B56
		db    6
		dw code_8B59
		db    7
		dw code_8B5C
		db    8
		dw code_8B5F
		db    9
		dw code_8B62
		db 0Ah
		dw code_8B65
		db 0Bh
		dw code_8B68
		db  0Ch
		dw code_8B6B
		db  0Dh
		dw code_8B6E
		db  0Eh
		dw code_8B71
		db  0Fh
		db 0
		db    0
		dw code_8B74
; ---------------------------------------------------------------------------

code_8B44:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8B47:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_8B4A:				
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_8B4D:				
		mov	R7, #3
		ret
; ---------------------------------------------------------------------------

code_8B50:				
		mov	R7, #4
		ret
; ---------------------------------------------------------------------------

code_8B53:				
		mov	R7, #5
		ret
; ---------------------------------------------------------------------------

code_8B56:				
		mov	R7, #6
		ret
; ---------------------------------------------------------------------------

code_8B59:				
		mov	R7, #7
		ret
; ---------------------------------------------------------------------------

code_8B5C:				
		mov	R7, #8
		ret
; ---------------------------------------------------------------------------

code_8B5F:				
		mov	R7, #9
		ret
; ---------------------------------------------------------------------------

code_8B62:				
		mov	R7, #0Ch
		ret
; ---------------------------------------------------------------------------

code_8B65:				
		mov	R7, #0Dh
		ret
; ---------------------------------------------------------------------------

code_8B68:				
		mov	R7, #0Eh
		ret
; ---------------------------------------------------------------------------

code_8B6B:				
		mov	R7, #0Fh
		ret
; ---------------------------------------------------------------------------

code_8B6E:				
		mov	R7, #10h
		ret
; ---------------------------------------------------------------------------

code_8B71:				
		mov	R7, #13h
		ret
; ---------------------------------------------------------------------------

code_8B74:				
		mov	R7, #0FFh
		ret

; ======================================================


code_8B77:				
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_8B7C:				
		mov	R7, #80h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #3A1h
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #82h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #3A0h
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #84h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #39Fh
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #86h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #39Eh
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #88h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #39Dh
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #8Ch
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #39Ch
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #80h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #3A1h
		movx	A, @DPTR
		cjne	A, RAM_7, code_8B7C
		ret
;  code_8B77

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B9AE

code_8BE0:				
		mov	DPTR, #361h
		mov	A, #77h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #4
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #72h
		lcall	code_68F6
		mov	A, R7
		jnz	code_8C05
		mov	DPTR, #363h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #79h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #50h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_8C05:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_8C2E
		mov	R4, #0
		mov	R5, #0Ah
		lcall	code_1151
		mov	R4, RAM_6
		mov	R5, RAM_7
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	RAM_27,	#4
		mov	RAM_28,	#2
		sjmp	code_8C42
; ---------------------------------------------------------------------------

code_8C2E:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	RAM_27,	#4
		mov	RAM_28,	#3

code_8C42:				
		clr	A
		mov	RAM_29,	A
		lcall	code_4161
		ret
;  CHUNK	FOR code_B9AE

; ======================================================


code_8C49:				
		mov	DPTR, #2D4h
		movx	A, @DPTR
		jz	code_8CB1
		mov	DPTR, #2DAh
		movx	A, @DPTR
		xrl	A, #1
		jz	code_8CB1
		mov	DPTR, #2E9h
		clr	A
		mov	B, #1
		lcall	code_1187
		mov	DPTR, #2E8h
		movx	A, @DPTR
		jnz	code_8C81
		clr	C
		mov	DPTR, #2EAh
		movx	A, @DPTR
		subb	A, #0F4h
		mov	DPTR, #2E9h
		movx	A, @DPTR
		subb	A, #1
		jc	code_8CB1
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #2E8h
		inc	A
		movx	@DPTR, A
		sjmp	code_8CAE
; ---------------------------------------------------------------------------

code_8C81:				
		clr	C
		mov	DPTR, #2EAh
		movx	A, @DPTR
		subb	A, #1
		mov	DPTR, #2E9h
		movx	A, @DPTR
		subb	A, #0
		jc	code_8CB1
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #2E8h
		movx	@DPTR, A
		mov	DPTR, #2E7h
		movx	A, @DPTR
		jnz	code_8CA8
		mov	DPTR, #2DAh
		movx	A, @DPTR
		mov	DPTR, #2E7h
		movx	@DPTR, A
		sjmp	code_8CAE
; ---------------------------------------------------------------------------

code_8CA8:				
		mov	DPTR, #2E7h
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A

code_8CAE:				
		lcall	code_944A

code_8CB1:				
		ret
;  code_8C49


; ======================================================


code_8CB2:				
		mov	RAM_11,	R6
		mov	RAM_12,	R7
		mov	A, RAM_12
		orl	A, RAM_11
		jnz	code_8CD2
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R6, A
		cjne	A, #2, code_8CC7
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_8CC7:				
		mov	A, R6
		xrl	A, #3
		jz	code_8CCF
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8CCF:				
		ljmp	code_C1AE
; ---------------------------------------------------------------------------

code_8CD2:				
		mov	A, RAM_12
		xrl	A, #1
		orl	A, RAM_11
		jnz	code_8CF1
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_8CE5
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_8CE5:				
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_8CEE
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_8CEE:				
		ljmp	code_C8BD
; ---------------------------------------------------------------------------

code_8CF1:				
		mov	A, RAM_12
		xrl	A, #2
		orl	A, RAM_11
		jnz	code_8D16
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #2, code_8D03
		ljmp	code_AAD3
; ---------------------------------------------------------------------------

code_8D03:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_8D16
		mov	DPTR, #168h
		movx	A, @DPTR
		jz	code_8D13
		ljmp	code_B76C
; ---------------------------------------------------------------------------

code_8D13:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_8D16:				
		mov	R7, #0
		ret
;  code_8CB2


; ======================================================


code_8D19:				
		mov	DPTR, #26h
		movx	A, @DPTR
		jnz	code_8D7C
		mov	DPTR, #5Eh
		movx	A, @DPTR
		jz	code_8D27
		sjmp	code_8D7C
; ---------------------------------------------------------------------------

code_8D27:				
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.2, code_8D37
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jnb	ACC.2, code_8D37
		sjmp	code_8D7C
; ---------------------------------------------------------------------------

code_8D37:				
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.1, code_8D4E
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jnb	ACC.1, code_8D4E
		mov	DPTR, #0B1h
		movx	A, @DPTR
		cjne	A, #1, code_8D4E
		sjmp	code_8D7C
; ---------------------------------------------------------------------------

code_8D4E:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_8D71
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_8D71
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.0, code_8D71
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jnb	ACC.0, code_8D71
		mov	DPTR, #0B1h
		movx	A, @DPTR
		cjne	A, #2, code_8D71
		sjmp	code_8D7C
; ---------------------------------------------------------------------------

code_8D71:				
		lcall	code_621F
		mov	A, R7
		jz	code_8D7F
		mov	R7, #1
		lcall	code_B7E4

code_8D7C:				
		lcall	code_C70E

code_8D7F:				
		ret
;  code_8D19


; ======================================================


code_8D80:				
		clr	A
		mov	DPTR, #2BCh
		movx	@DPTR, A
		setb	P0.6
		setb	P0.7
		setb	P4.6
		setb	P4.1
		setb	P4.5
		clr	P4.4
		inc	DPTR
		movx	@DPTR, A

code_8D93:				
		mov	DPTR, #2BDh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #64h, code_8D93
		mov	DPTR, #2BCh
		movx	A, @DPTR
		mov	R7, A
		jb	P0.5, code_8DA9
		mov	R6, #0
		sjmp	code_8DAB
; ---------------------------------------------------------------------------

code_8DA9:				
		mov	R6, #1

code_8DAB:				
		mov	A, R7
		orl	A, R6
		mov	DPTR, #2BCh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jb	P0.4, code_8DBA
		mov	R6, #0
		sjmp	code_8DBC
; ---------------------------------------------------------------------------

code_8DBA:				
		mov	R6, #2

code_8DBC:				
		mov	A, R7
		orl	A, R6
		mov	DPTR, #2BCh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jb	P0.3, code_8DCB
		mov	R6, #0
		sjmp	code_8DCD
; ---------------------------------------------------------------------------

code_8DCB:				
		mov	R6, #4

code_8DCD:				
		mov	A, R7
		orl	A, R6
		mov	DPTR, #2BCh
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jb	P0.2, code_8DDC
		mov	R6, #0
		sjmp	code_8DDE
; ---------------------------------------------------------------------------

code_8DDC:				
		mov	R6, #8

code_8DDE:				
		mov	A, R7
		orl	A, R6
		mov	R7, A
		mov	DPTR, #2BCh
		movx	@DPTR, A
		ret
;  code_8D80

; ---------------------------------------------------------------------------

code_8DE6:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	A, RAM_14
		jnz	code_8DF8
		mov	A, RAM_13
		xrl	A, #2

code_8DF8:				
		jnz	code_8E24
		lcall	R3R2R1_GetACC_103D
		jnz	code_8E4A
		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00

		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_8E4A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_77BA
		mov	A, R7
		jz	code_8E4A
		sjmp	code_8E38
; ---------------------------------------------------------------------------

code_8E24:				
		clr	A
		cjne	A, RAM_14, code_8E3D
		mov	A, RAM_13
		cjne	A, #80h, code_8E3D
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_8E4A

code_8E38:				
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_8E3D:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_8E4A:				
		ret
; ---------------------------------------------------------------------------

code_8E4B:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	A, RAM_14
		jnz	code_8E5D
		mov	A, RAM_13
		xrl	A, #2

code_8E5D:				
		jnz	code_8E89
		lcall	R3R2R1_GetACC_103D
		jnz	code_8EAF

		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00
		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		setb	C
		subb	A, #0
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_8EAF
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_62E6
		mov	A, R7
		jz	code_8EAF
		sjmp	code_8E9D
; ---------------------------------------------------------------------------

code_8E89:				
		clr	A
		cjne	A, RAM_14, code_8EA2
		mov	A, RAM_13
		cjne	A, #80h, code_8EA2
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_8EAF

code_8E9D:				
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_8EA2:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_8EAF:				
		ret
; ---------------------------------------------------------------------------

code_8EB0:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		lcall	code_CDC4
		mov	A, R7
		jz	code_8ECD
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_8ECD:				
		mov	A, RAM_14
		jnz	code_8ED5
		mov	A, RAM_13
		xrl	A, #2

code_8ED5:				
		jnz	code_8F14
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_8F14
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #2
		jz	code_8EEC
		sjmp	code_8F0F
; ---------------------------------------------------------------------------

code_8EEC:				
		lcall	code_CDC4
		mov	A, R7
		jz	code_8F14

		lcall	UserInput_ToR6R7_C489
	;	lcall	test_00

		lcall	code_9392
		mov	A, R7
		dec	A
		jz	code_8F07
		dec	A
		jz	code_8F0B
		add	A, #2
		jnz	code_8F0F
		mov	R7, #33h
		sjmp	code_8F11
; ---------------------------------------------------------------------------

code_8F07:				
		mov	R7, #34h
		sjmp	code_8F11
; ---------------------------------------------------------------------------

code_8F0B:				
		mov	R7, #35h
		sjmp	code_8F11
; ---------------------------------------------------------------------------

code_8F0F:				
		mov	R7, #5

code_8F11:				
		lcall	code_BBAC

code_8F14:				
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_A0F7

code_8F15:				
		lcall	DS1302_C000
		mov	DPTR, #39Ch
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #8Ch
		lcall	DS1302_C004
		mov	DPTR, #39Dh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #88h
		lcall	DS1302_C004
		mov	DPTR, #39Eh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #86h
		lcall	DS1302_C004
		mov	DPTR, #39Fh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #84h
		lcall	DS1302_C004
		mov	DPTR, #3A0h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #82h
		lcall	DS1302_C004
		mov	DPTR, #3A1h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C8F3
		mov	R5, RAM_7
		mov	R7, #80h
		lcall	DS1302_C004
		mov	R5, #80h
		mov	R7, #8Eh
		ljmp	DS1302_C004
;  CHUNK	FOR code_A0F7

; ======================================================


code_8F79:				
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #26h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0BCh
		mov	R5, #4
		lcall	code_AC05
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0C1h
		mov	R5, #6
		lcall	code_AC05
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #0C8h
		mov	R5, #6
		lcall	code_AC05
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #2Eh
		lcall	WhileSendR7_C882
		mov	R7, #0Dh
		ljmp	WhileSendR7_C882
;  code_8F79


; ======================================================


code_8FDB:				
		clr	A
		mov	DPTR, #0B4h
		movx	@DPTR, A
		lcall	code_A332
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2Fh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #42h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #14h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	DPTR, #272h
		mov	A, #1
		movx	@DPTR, A

code_9021:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_9036
		lcall	code_6F6E
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_9021
; ---------------------------------------------------------------------------

code_9036:				
		lcall	code_A723
		ljmp	code_8AA0
;  code_8FDB


; ======================================================


code_903C:				
		mov	RAM_19,	R6
		mov	RAM_1A,	R7
		clr	C
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, #80h
		jc	code_9056
		setb	C
		mov	A, RAM_1A
		subb	A, #0Fh
		mov	A, RAM_19
		xrl	A, #80h
		subb	A, #0A7h
		jc	code_9059

code_9056:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9059:				
		mov	RAM_1E,#1
		mov	RAM_1F,#0
		mov	RAM_20,#86h
		mov	R3, #1
		mov	R2, #3
		mov	R1, #9Ch
		lcall	code_C411
		mov	DPTR, #8Bh
		mov	A, RAM_19
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1A
		movx	@DPTR, A
		lcall	code_C3E1
		mov	A, R7
		mov	DPTR, #29h
		jnz	code_9084
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		sjmp	code_9088
; ---------------------------------------------------------------------------

code_9084:				
		movx	A, @DPTR
		anl	A, #0F7h
		movx	@DPTR, A

code_9088:				
		lcall	ClearState_CE40
		lcall	code_A95F
		mov	DPTR, #275h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_903C


; ======================================================


code_909C:				
		mov	DPTR, #137h
		movx	A, @DPTR
		jnz	code_90A4
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_90A4:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #75h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #3Dh
		lcall	code_C21A
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #275h
		movx	@DPTR, A
		cjne	R7, #3,	code_90D3
		mov	RAM_24,	#1
		mov	RAM_25,	#1
		mov	RAM_26,	#67h
		mov	RAM_27,	#3Ah
		mov	R3, #1
		mov	R2, #2
		mov	R1, #76h
		lcall	code_A9DC

code_90D3:				
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #2B0h
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	ClearState_CE40
		mov	R3, #1
		mov	R2, #2
		mov	R1, #75h
		lcall	IAP_Write_R3R2R1_83E7
		mov	DPTR, #2B2h
		mov	A, R7
		movx	@DPTR, A
		
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #2B2h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_909C


; ======================================================


code_90FC:				
		mov	DPTR, #125h
		movx	A, @DPTR
		jnz	code_915B
		mov	DPTR, #96h
		movx	A, @DPTR
		jz	code_9117
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		anl	A, #0FDh
		movx	@DPTR, A
		anl	A, #0FBh
		movx	@DPTR, A
		sjmp	code_9148
; ---------------------------------------------------------------------------

code_9117:				
		mov	A, R7
		add	A, #0FEh
		jz	code_9134
		dec	A
		jz	code_913C
		dec	A
		jz	code_9144
		dec	A
		jz	code_914C
		dec	A
		jz	code_9154
		add	A, #5
		jnz	code_915B
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9134:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_913C:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0FBh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9144:				
		mov	DPTR, #0F2h
		movx	A, @DPTR

code_9148:				
		anl	A, #0F7h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_914C:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0BFh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9154:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A

code_915B:				
		ret
;  code_90FC


; ======================================================


code_915C:				
		mov	DPTR, #2ECh
		movx	A, @DPTR
		mov	R6, A
		cjne	A, #0FFh, code_9171
		inc	DPTR
		movx	A, @DPTR
		cjne	A, #0FFh, code_9171
		inc	DPTR
		movx	A, @DPTR
		cjne	A, #0FFh, code_9171
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_9171:				
		clr	A
		mov	DPTR, #270h
		movx	@DPTR, A
		mov	A, R6
		cpl	A
		jz	code_9189
		mov	DPTR, #2ECh
		movx	A, @DPTR
		mov	DPTR, #39Ch
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A

code_9189:				
		mov	DPTR, #2EDh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_919D
		mov	DPTR, #39Dh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A

code_919D:				
		mov	DPTR, #2EEh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_91B1
		mov	DPTR, #39Eh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A

code_91B1:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_7F7E
		mov	R7, #1
		ret
;  code_915C


; ======================================================


code_91BC:				
		mov	DPTR, #2F9h
		movx	A, @DPTR
		mov	R6, A
		cjne	A, #0FFh, code_91D1
		inc	DPTR
		movx	A, @DPTR
		cjne	A, #0FFh, code_91D1
		inc	DPTR
		movx	A, @DPTR
		cjne	A, #0FFh, code_91D1
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_91D1:				
		clr	A
		mov	DPTR, #270h
		movx	@DPTR, A
		mov	A, R6
		cpl	A
		jz	code_91E9
		mov	DPTR, #2F9h
		movx	A, @DPTR
		mov	DPTR, #39Fh
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A

code_91E9:				
		mov	DPTR, #2FAh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_91FD
		mov	DPTR, #3A0h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A

code_91FD:				
		mov	DPTR, #2FBh
		movx	A, @DPTR
		mov	R7, A
		cpl	A
		jz	code_9211
		mov	DPTR, #3A1h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #270h
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A

code_9211:				
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_7F7E
		mov	R7, #1
		ret
 


; ======================================================


code_921C:				

; FUNCTION CHUNK AT 000089C4 SIZE 0000006E BYTES
; FUNCTION CHUNK AT 0000C9D8 SIZE 00000011 BYTES

		lcall	code_C558
		mov	A, R7
		jnz	code_925E
		mov	R3, #1
		mov	R2, #2
		mov	R1, #0BBh
		lcall	code_807F
		mov	A, R7
		jz	code_9277
		mov	DPTR, #2BBh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #0FFh
		jnc	code_9277
		mov	A, R7
		subb	A, #0E0h
		mov	A, R6
		xrl	A, #80h
		subb	A, #31h
		jnc	code_924A
		sjmp	code_9277
; ---------------------------------------------------------------------------

code_924A:				
		clr	A
		mov	DPTR, #35Ch
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #2BBh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R5, A
		ljmp	code_C9D8
; ---------------------------------------------------------------------------

code_925E:				
		mov	DPTR, #35Ch
		clr	A
		mov	B, #1
		lcall	code_1187
		clr	C
		mov	DPTR, #35Dh
		movx	A, @DPTR
		subb	A, #90h
		mov	DPTR, #35Ch
		movx	A, @DPTR
		subb	A, #1
		jc	code_927A

code_9277:				
		lcall	code_CA3E

code_927A:				
		ret
;  code_921C


; ======================================================


code_927B:				
		mov	A, R7
		add	A, #1
		mov	R5, A
		clr	A
		rlc	A
		mov	R4, A
		mov	A, R5
		xrl	A, #1
		orl	A, R4
		jnz	code_928B
		clr	C
		sjmp	code_928C
; ---------------------------------------------------------------------------

code_928B:				
		setb	C

code_928C:				
		mov	P0.6, C
		mov	A, R5
		xrl	A, #2
		orl	A, R4
		jnz	code_9297
		clr	C
		sjmp	code_9298
; ---------------------------------------------------------------------------

code_9297:				
		setb	C

code_9298:				
		mov	P0.7, C
		mov	A, R7
		add	A, #1
		mov	R5, A
		clr	A
		rlc	A
		mov	R4, A
		mov	A, R5
		xrl	A, #3
		orl	A, R4
		jnz	code_92AA
		clr	C
		sjmp	code_92AB
; ---------------------------------------------------------------------------

code_92AA:				
		setb	C

code_92AB:				
		mov	P4.6, C
		mov	A, R5
		xrl	A, #4
		orl	A, R4
		jnz	code_92B6
		clr	C
		sjmp	code_92B7
; ---------------------------------------------------------------------------

code_92B6:				
		setb	C

code_92B7:				
		mov	P4.1, C
		mov	A, R7
		add	A, #1
		mov	R5, A
		clr	A
		rlc	A
		mov	R4, A
		mov	A, R5
		xrl	A, #5
		orl	A, R4
		jnz	code_92C9
		clr	C
		sjmp	code_92CA
; ---------------------------------------------------------------------------

code_92C9:				
		setb	C

code_92CA:				
		mov	P4.5, C
		mov	A, R5
		xrl	A, #6
		orl	A, R4
		jnz	code_92D5
		clr	C
		sjmp	code_92D6
; ---------------------------------------------------------------------------

code_92D5:				
		setb	C

code_92D6:				
		mov	P4.4, C
		ret
;  code_927B

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B6F1

code_92D9:				
		clr	A
		mov	DPTR, #36Dh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #363h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #79h
		movx	@DPTR, A
		mov	DPTR, #29h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.5, code_92FF
		mov	DPTR, #362h
		mov	A, #6Dh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_92FF:				
		mov	A, R7
		jnb	ACC.4, code_930A
		mov	DPTR, #362h
		mov	A, #66h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_930A:				
		mov	A, R7
		jnb	ACC.3, code_9315
		mov	DPTR, #362h
		mov	A, #7Dh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9315:				
		mov	A, R7
		jnb	ACC.0, code_9320
		mov	DPTR, #362h
		mov	A, #6
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9320:				
		mov	A, R7
		jnb	ACC.1, code_932B
		mov	DPTR, #362h
		mov	A, #5Bh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_932B:				
		mov	A, R7
		jnb	ACC.6, code_9335
		mov	DPTR, #362h
		mov	A, #7
		movx	@DPTR, A

code_9335:				
		ret
;  CHUNK	FOR code_B6F1

; ======================================================


code_9336:				
		mov	RAM_8, R7
		mov	RAM_9, R3
		mov	RAM_A, R2
		mov	RAM_B, R1
		mov	A, RAM_8
		add	A, RAM_C
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		setb	C
		mov	A, R7
		subb	A, #1Eh
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_9354
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9354:				
		lcall	DS1302_C000
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_935C:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		clr	C
		subb	A, RAM_C
		jnc	code_9388
		movx	A, @DPTR
		mov	R6, A
		add	A, RAM_8
		add	A, ACC
		orl	A, #0C0h
		mov	R7, A
		mov	R3, RAM_9
		mov	R2, RAM_A
		mov	R1, RAM_B
		mov	DPL, R6
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		lcall	DS1302_C004
		mov	DPTR, #26Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_935C
; ---------------------------------------------------------------------------

code_9388:				
		mov	R5, #80h
		mov	R7, #8Eh
		lcall	DS1302_C004
		mov	R7, #1
		ret
;  code_9336


; ======================================================


code_9392:				
		mov	RAM_18,R6
		mov	RAM_19,R7
		xrl	RAM_19,#8Bh
		xrl	RAM_18,#3

	;	xrl	RAM_19,#0B5h
	;	xrl	RAM_18,#4
	 	xrl	RAM_19,#0x233&0xff
		xrl	RAM_18,#0x233>>8	   		; 计算做一下改变 什么计算呢，我他妈的忘了

		mov	DPTR, #2C3h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R4, #3
		mov	R5, #0E8h
		lcall	code_1151
		mov	R2, RAM_4
		mov	R3, RAM_5
		mov	R6, RAM_18
		mov	R7, RAM_19
		mov	R4, #3
		mov	R5, #0E8h
		lcall	code_1151
		mov	A, R5
		cjne	A, RAM_3, code_93EB
		mov	A, R4
		cjne	A, RAM_2, code_93EB
		mov	R6, RAM_18
		mov	R7, RAM_19
		mov	R4, #3
		mov	R5, #0E8h
		lcall	code_1151
		mov	A, R6
		jnz	code_93EB
		mov	A, R7
		add	A, #0FAh
		jz	code_93E5
		dec	A
		jz	code_93E8
		add	A, #5
		jnz	code_93EB
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_93E5:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_93E8:				
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_93EB:				
		mov	R7, #0FFh
		ret
;  

; ---------------------------------------------------------------------------

code_93EE:				
		mov	DPTR, #2D1h
		movx	A, @DPTR
		dec	A
		add	A, #0F7h
		jnc	code_9416
		add	A, #0Ah
		jnz	code_9449
		mov	DPTR, #361h
		mov	A, #39h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #78h
		movx	@DPTR, A
		mov	DPTR, #5Fh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	R5, A
		mov	R4, A
		clr	A
		sjmp	code_9441
; ---------------------------------------------------------------------------

code_9416:				
		mov	DPTR, #2D1h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA9F
		mov	DPTR, #361h
		mov	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, #78h
		movx	@DPTR, A
		mov	DPTR, #2D1h
		movx	A, @DPTR
		add	A, ACC
		add	A, ACC
		add	A, #5Dh
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_12EB
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR

code_9441:				
		mov	RAM_1D,	A
		lcall	code_3A89
		lcall	code_C338

code_9449:				
		ret

; ======================================================


code_944A:				
		mov	DPTR, #2E8h
		movx	A, @DPTR
		jz	code_9452
		sjmp	code_945E
; ---------------------------------------------------------------------------

code_9452:				
		mov	DPTR, #2DAh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #2E7h
		movx	A, @DPTR
		cjne	A, RAM_7, code_946C

code_945E:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #4
		ljmp	code_C21A
; ---------------------------------------------------------------------------

code_946C:				
		mov	DPTR, #2E7h
		movx	A, @DPTR
		dec	A
		jz	code_9485
		dec	A
		jz	code_9490
		add	A, #2
		jnz	code_94A5
		mov	RAM_24,	#1
		mov	RAM_25,	#2
		mov	RAM_26,	#0DBh
		sjmp	code_9499
; ---------------------------------------------------------------------------

code_9485:				
		mov	RAM_24,	#1
		mov	RAM_25,	#2
		mov	RAM_26,	#0DFh
		sjmp	code_9499
; ---------------------------------------------------------------------------

code_9490:				
		mov	RAM_24,	#1
		mov	RAM_25,	#2
		mov	RAM_26,	#0E3h

code_9499:				
		mov	RAM_27,	#4
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		lcall	code_A9DC

code_94A5:				
		ret
;  code_944A


; ======================================================


code_94A6:				

; FUNCTION CHUNK AT 0000BC9D SIZE 00000022 BYTES

		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_94FF
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_94FF
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #30h
		movx	@DPTR, A
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_94E7
		mov	A, R7
		setb	C
		subb	A, #6
		jnc	code_94E7
		lcall	code_9A60
		mov	DPTR, #0A1h
		movx	A, @DPTR
		jz	code_94D9
		lcall	code_CD43
		sjmp	code_94E7
; ---------------------------------------------------------------------------

code_94D9:				
		mov	DPTR, #0B3h
		movx	A, @DPTR
		jz	code_94E4
		lcall	code_C31F
		sjmp	code_94E7
; ---------------------------------------------------------------------------

code_94E4:				
		lcall	code_CD4E

code_94E7:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.6, code_94F5
		jnb	ACC.7, code_94F5
		ljmp	code_BC9D
; ---------------------------------------------------------------------------

code_94F5:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		jnb	ACC.6, code_94FF
		lcall	code_9AB1

code_94FF:				
		ret
;  code_94A6


; ======================================================


code_9500:				
		lcall	code_AD1F
		mov	DPTR, #26Ah
		mov	A, R7
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #53h
		mov	R1, #5Bh
		mov	R5, #8
		lcall	code_AC05
		clr	A
		mov	DPTR, #270h
		movx	@DPTR, A

code_9518:				
		mov	DPTR, #26Ah
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #270h
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jnc	code_9558
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #270h
		movx	A, @DPTR
		add	A, ACC
		add	A, #89h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	R2, #2
		mov	R1, #6Bh
		lcall	code_545C
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Bh
		mov	R5, #5
		lcall	code_AC05
		mov	DPTR, #270h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_9518
; ---------------------------------------------------------------------------

code_9558:				
		ret
;  code_9500


; ======================================================


code_9559:				
		clr	A
		mov	DPTR, #274h
		movx	@DPTR, A
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R5, A
		setb	C
		subb	A, #1
		jc	code_956F
		mov	DPTR, #274h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A

code_956F:				
		mov	A, R5
		setb	C
		subb	A, #2
		jc	code_957C
		mov	DPTR, #274h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A

code_957C:				
		mov	DPTR, #169h
		movx	A, @DPTR
		setb	C
		subb	A, #3
		jc	code_958C
		mov	DPTR, #274h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A

code_958C:				
		mov	DPTR, #169h
		movx	A, @DPTR
		mov	R5, A
		setb	C
		subb	A, #4
		jc	code_959D
		mov	DPTR, #274h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A

code_959D:				
		mov	A, R5
		setb	C
		subb	A, #0Bh
		jc	code_95AA
		mov	DPTR, #274h
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A

code_95AA:				
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R7, A
		mov	R6, #0
		ret
;  code_9559


; ======================================================


code_95B2:				
		mov	DPTR, #169h
		mov	A, R7
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		mov	R5, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #16Dh
		xch	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R5, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #174h
		xch	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, #75h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_95B2


; ======================================================


code_960B:				
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		inc	DPTR
;  code_960B


; ======================================================


code_9611:				
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
;  code_9611


; ======================================================


code_9616:				
		mov	R5, RAM_7
		mov	R4, RAM_6
		lcall	code_C6AA
		mov	DPTR, #276h
		mov	A, R7
		movx	@DPTR, A
		cjne	R7, #1,	code_962A
		mov	R7, RAM_5
		mov	R6, RAM_4
		ret
; ---------------------------------------------------------------------------

code_962A:				
		clr	C
		mov	A, R4
		xrl	A, #80h
		subb	A, #80h
		mov	DPTR, #276h
		movx	A, @DPTR
		jc	code_9638
		sjmp	code_963A
; ---------------------------------------------------------------------------

code_9638:				
		cpl	A
		inc	A

code_963A:				
		mov	C, ACC.7
		rrc	A
		mov	R7, A
		mov	A, R7
		rlc	A
		subb	A, ACC
		mov	R6, A
		mov	A, R7
		add	A, R5
		mov	R7, A
		mov	A, R6
		addc	A, R4
		mov	R6, A
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R3, A
		rlc	A
		subb	A, ACC
		mov	R2, A
		mov	R5, RAM_3
		mov	R4, A
		lcall	code_1151
		mov	R5, RAM_3
		mov	R4, RAM_2
		lcall	code_10EA
		mov	R4, RAM_6
		mov	R5, RAM_7
		ret
;  code_9616


; ======================================================


code_9664:				
		mov	DPTR, #269h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #3A4h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #0
		jc	code_967A
		mov	A, R7
		setb	C
		subb	A, #1
		jc	code_967F

code_967A:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_967F:				
		mov	DPTR, #3A5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		subb	A, #0
		jc	code_9696
		setb	C
		mov	A, R7
		subb	A, #0Fh
		mov	A, R6
		subb	A, #27h
		jc	code_969B

code_9696:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_969B:				
		mov	DPTR, #3A7h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	A, R6
		subb	A, #0
		jc	code_96B2
		setb	C
		mov	A, R7
		subb	A, #0Fh
		mov	A, R6
		subb	A, #27h
		jc	code_96B7

code_96B2:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_96B7:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_9664

; ---------------------------------------------------------------------------

code_96BD:				
		mov	RAM_13,R6
		mov	RAM_14,R7
		mov	RAM_15,R3
		mov	RAM_16,R2
		mov	RAM_17,R1

		mov	A, RAM_14
		jnz	code_96CF
		mov	A, RAM_13
		xrl	A, #2
code_96CF:				
		jnz	code_9706  			; if(==200)
						    	; {
		lcall	R3R2R1_GetACC_103D
		jnz	code_9713

		lcall	UserInput_ToR6R7_C489  	; 配置 4000后 输入的数据
	;	lcall	test_00			; r6r7=0X4D2 =1234

		mov	DPTR, #sram_13B
		CLR	A
		mov	R4, A	     			; 改版
		inc	DPTR
		CLR	A
		mov	R5, A

	;	mov	DPTR, #sram_13B
	;	movx	A, @DPTR
	;	mov	R4, A
	;	inc	DPTR		 		; 原版
	;	movx	A, @DPTR
	;	mov	R5, A

		mov	DPTR, #ramdon1
		movx	A, @DPTR
		xrl	A, R4
		mov	R4, A		  		; 随机数
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R5
		mov	R5, A

		lcall	R4R5_Ramdon_CaculateToR6R7_A3BE

		mov	A, R6
		jnz	code_9701			; if(R6==0)
							; {
		mov	A, R7
		add	A, #0FEh
		jz	code_96FD	 		;	if(R7==2)
		inc	A
		jnz	code_9701			;	if(R7==1)
		mov	R7, #47h
		sjmp	code_9703
; ---------------------------------------------------------------------------

code_96FD:				
		mov	R7, #49h
		sjmp	code_9703
; ---------------------------------------------------------------------------

code_9701:				
		mov	R7, #5

code_9703:				
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_9706:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_9713:				
		ret

; ======================================================


returnR7_9714:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_9719:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #7
		jnc	code_9746
		movx	A, @DPTR
		mov	R6, A
		add	A, #99h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		mov	R5, A
		mov	A, #0FCh
		add	A, R6
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		xrl	A, R5
		jnz	code_9746
		mov	DPTR, #269h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_9719
; ---------------------------------------------------------------------------

code_9746:				
		mov	A, R7
		clr	C
		subb	A, #7
		jc	code_9751
		lcall	code_C59A
		sjmp	code_9754
; ---------------------------------------------------------------------------

code_9751:				
		lcall	code_BC7B

code_9754:				
		mov	DPTR, #103h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5Ah
		jc	code_9767
		mov	A, R7
		setb	C
		subb	A, #96h
		jnc	code_9767
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9767:				
		mov	R7, #1
		ret



; ======================================================


code_976A:				
		mov	RAM_8, R7
		mov	RAM_9, R3
		mov	RAM_A, R2
		mov	RAM_B, R1
		mov	A, RAM_8
		add	A, RAM_C
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		setb	C
		mov	A, R7
		subb	A, #1Eh
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_9788
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9788:				
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_978D:				
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, RAM_C
		jnc	code_97BD
		mov	A, RAM_8
		add	A, R7
		add	A, ACC
		orl	A, #0C0h
		mov	R7, A
		lcall	code_B8F3
		mov	R3, RAM_9
		mov	R2, RAM_A
		mov	R1, RAM_B
		mov	DPTR, #26Bh
		movx	A, @DPTR
		mov	DPL, A
		mov	DPH, #0
		mov	A, R7
		lcall	code_10C8
		mov	DPTR, #26Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_978D
; ---------------------------------------------------------------------------

code_97BD:				
		mov	R7, #1
		ret
;  code_976A


; ======================================================


code_97C0:				
		mov	DPTR, #302h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_74A5
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #30Dh
		movx	A, @DPTR
		xrl	A, #1
		jnz	code_97EE

		lcall	UserInput_ToR6R7_C489

		mov	R4, RAM_6
		mov	R5, RAM_7
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		mov	R6, #0
		lcall	code_5AA7
		mov	A, R7
		jz	code_97EB
		sjmp	code_980A
; ---------------------------------------------------------------------------

code_97EB:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_97EE:				
		mov	DPTR, #30Dh
		movx	A, @DPTR
		xrl	A, #2
		jnz	code_9813
		lcall	code_CEE2
		mov	A, R7
		mov	R5, A
		mov	R4, #0
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		mov	R6, #0
		lcall	code_5AA7
		mov	A, R7
		jz	code_9810

code_980A:				
		lcall	code_C0CD
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_9810:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9813:				
		mov	R7, #0
		ret
;  code_97C0


; ======================================================


code_9816:				

; FUNCTION CHUNK AT 0000AAD3 SIZE 0000003C BYTES

		mov	DPTR, #2D0h
		movx	A, @DPTR
		xrl	A, #25h
		jz	code_986A
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.3, code_982F
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.3, code_982F
		ljmp	code_AAD3
; ---------------------------------------------------------------------------

code_982F:				
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_9837
		inc	DPTR
		movx	A, @DPTR

code_9837:				
		jnz	code_986A
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.1, code_984B
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.1, code_984B
		mov	R7, #1
		sjmp	code_9867
; ---------------------------------------------------------------------------

code_984B:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_986A
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_986A
		mov	DPTR, #0A4h
		movx	A, @DPTR
		jb	ACC.0, code_986A
		mov	DPTR, #2Dh
		movx	A, @DPTR
		jnb	ACC.0, code_986A
		mov	R7, #2

code_9867:				
		lcall	code_A1CF

code_986A:				
		ret
;  code_9816


; ======================================================


RI0_TI0_0:				
		push	ACC
		push	B
		push	DPH
		push	DPL
		push	PSW
		mov	PSW, #0
		push	RAM_0
		push	RAM_1
		push	RAM_2
		push	RAM_3
		push	RAM_4
		push	RAM_5
		push	RAM_6
		push	RAM_7
		jnb	SCON.0, code_989D
		clr	SCON.0
		mov	DPTR, #2C2h
		mov	A, SBUF
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		mov	C, SCON.2
		clr	A
		rlc	A
		mov	R5, A
	;	lcall	code_C696	 		; change1
		LCALL	   code_CF83
code_989D:				
		jnb	TI, code_98A5
		clr	TI
		lcall	code_CADE

code_98A5:				
		pop	RAM_7
		pop	RAM_6
		pop	RAM_5
		pop	RAM_4
		pop	RAM_3
		pop	RAM_2
		pop	RAM_1
		pop	RAM_0
		pop	PSW
		pop	DPL
		pop	DPH
		pop	B
		pop	ACC
		reti
;  RI0_TI0_0


; ======================================================


code_98C0:				
		clr	A
		mov	DPTR, #3A2h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		lcall	code_8276
		mov	A, R7
		jz	code_98DE
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	RAM_C, #1
		clr	A
		mov	R7, A
		lcall	code_976A
		mov	A, R7
		jnz	code_98E4

code_98DE:				
		clr	A
		mov	DPTR, #3A2h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_98E4:				
		mov	DPTR, #3A2h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #26Ah
		movx	A, @DPTR
		xrl	A, #0CCh
		jz	code_98F6
		mov	R7, #1
		sjmp	code_98F8
; ---------------------------------------------------------------------------

code_98F6:				
		mov	R7, #0

code_98F8:				
		mov	DPTR, #3A3h
		mov	A, R7
		movx	@DPTR, A
		jz	code_9913
		mov	DPTR, #26Ah
		mov	A, #0CCh
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #6Ah
		mov	RAM_C, #1
		clr	A
		mov	R7, A
		lcall	code_9336

code_9913:				
		ret
;  code_98C0


; ======================================================


IapProgramByte_r6r7Addr_9914:				
		mov	R3, RAM_7
		mov	R2, RAM_6
		
		clr	A
		mov	DPTR, #2B9h		; sram_2B9=0;
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A		; sram_2BA=0;

code_991F:				
		mov	DPTR, #2BAh
		movx	A, @DPTR
		jnz	code_995F		; while(sram_2BA==0)
						; {
		mov	IAP_CONTR, #83h	;	IAP_CONTR=0x83;
		mov	IAP_CMD, #2		;	IAP_CMD=2;		; 字节编程
		mov	IAP_ADDRH, R2
		mov	IAP_ADDRL, R3
		mov	IAP_DATA, R5	;	IAP_DATA=R5;

code_9931:				
		mov	A, PCON
		jnb	ACC.5, code_993B	;	while(PCON&BIT(5))
						;	{
		anl	PCON, #0DFh		;		PCON&=0xdf;
		sjmp	code_9931		;	}
 
code_993B:				
		mov	IAP_TRIG, #5Ah	;	IAP_TRIG=0X5A;
		mov	IAP_TRIG, #0A5h	;	IAP_TRIG=0XA5;
		mov	A, IAP_CONTR
		jnb	ACC.4, code_9957	;	if(IAP_CONTR&BIT(4))
						;	{
		anl	IAP_CONTR, #0EFh
		mov	DPTR, #2B9h
		movx	A, @DPTR
		inc	A			;		sram_2B9++;
		movx	@DPTR, A		; 
		movx	A, @DPTR		;
		clr	C			;
		subb	A, #2			;
		jc	code_991F		;		if(sram_2B9>=2)
		sjmp	code_995F		;			break;
						;	}
code_9957:				
		mov	DPTR, #2BAh		;
		mov	A, #1			;	sram_2BA=1;
		movx	@DPTR, A		;
		sjmp	code_991F		;
						; }
code_995F:				
		lcall	IAP_IDLE_CB0B
		
		mov	DPTR, #2BAh
		movx	A, @DPTR		; return state;
		mov	R7, A
		ret
 


; ======================================================


code_9968:				
		mov	A, R7
		mov	B, R6
		lcall	nextFour_13D0
;  code_9968

; ---------------------------------------------------------------------------
		db 99h
		db  9Dh
		db    0
		db    2
		db  99h
		db 0A0h
		db    0
		db    4
		db  99h
		db 0A3h
		db    0
		db    8
		db  99h
		db 0B5h
		db    0
		db  10h
		db  99h
		db 0A6h
		db    0
		db  20h
		db  99h
		db 0A9h
		db    0
		db  40h
		db  99h
		db 0ACh
		db    0
		db  80h
		db  99h
		db 0B2h
		db    1
		db    0
		db  99h
		db  9Ah
		db    4
		db    0
		db  99h
		db 0AFh
		db    8
		db    0
		db    0
		db    0
		dw code_99B8
; ---------------------------------------------------------------------------
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------
		mov	R7, #3
		ret
; ---------------------------------------------------------------------------
		mov	R7, #4
		ret
; ---------------------------------------------------------------------------
		mov	R7, #5
		ret
; ---------------------------------------------------------------------------
		mov	R7, #6
		ret
; ---------------------------------------------------------------------------
		mov	R7, #7
		ret
; ---------------------------------------------------------------------------
		mov	R7, #8
		ret
; ---------------------------------------------------------------------------
		mov	R7, #9
		ret
; ---------------------------------------------------------------------------

code_99B8:				
		mov	R7, #0FFh
		ret

; ======================================================


code_99BB:				
		lcall	code_CDC0
		mov	A, R7
		jz	code_9A0D
		mov	R7, RAM_5
		mov	R6, RAM_4
		lcall	code_A01E
		mov	A, R7
		jz	code_9A0D
		mov	DPTR, #308h
		movx	A, @DPTR
		add	A, #6Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #308h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	DPTR, #307h
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		setb	C
		subb	A, R7
		jc	code_99F3
		mov	DPTR, #306h
		movx	A, @DPTR
		mov	DPTR, #308h
		movx	@DPTR, A

code_99F3:				
		mov	DPTR, #308h
		movx	A, @DPTR
		add	A, #6Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #1
		movx	@DPTR, A
		clr	A
		mov	DPTR, #374h
		movx	@DPTR, A
		mov	DPTR, #373h
		inc	A
		movx	@DPTR, A

code_9A0D:				
		ret
;  code_99BB


; ======================================================


code_9A0E:				
		mov	DPTR, #5Eh
		movx	A, @DPTR
		jz	code_9A33
		mov	DPTR, #0A0h
		movx	A, @DPTR
		cjne	A, #0FFh, code_9A22
		mov	DPTR, #363h
		mov	A, #40h
		sjmp	code_9A26
; ---------------------------------------------------------------------------

code_9A22:				
		clr	A
		mov	DPTR, #363h

code_9A26:				
		movx	@DPTR, A
		inc	DPTR
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #38h
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9A33:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R5, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	R4, A
		mov	RAM_27,	#4
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_28,	A
		clr	A
		mov	RAM_29,	A
		lcall	code_4161
		ret
;  code_9A0E


; ======================================================


code_9A60:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0F0h
		movx	@DPTR, A
		mov	DPTR, #0B0h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_9A87
		dec	A
		jz	code_9A8D
		dec	A
		jz	code_9A98
		dec	A
		jz	code_9AA0
		dec	A
		jz	code_9AA6
		add	A, #5
		jnz	code_9AB0
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9A87:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		sjmp	code_9A94
; ---------------------------------------------------------------------------

code_9A8D:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A

code_9A94:				
		orl	A, #2
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9A98:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9AA0:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		sjmp	code_9AAD
; ---------------------------------------------------------------------------

code_9AA6:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A

code_9AAD:				
		orl	A, #8
		movx	@DPTR, A

code_9AB0:				
		ret
;  code_9A60


; ======================================================


code_9AB1:				
		mov	DPTR, #0F8h
		movx	A, @DPTR
		jnz	code_9B01
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_9AC5
		lcall	code_AD91
		mov	A, R7
		jnz	code_9AE2

code_9AC5:				
		mov	DPTR, #1D6h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #0F9h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_9ADD
		mov	R7, #1
		sjmp	code_9ADF
; ---------------------------------------------------------------------------

code_9ADD:				
		mov	R7, #0

code_9ADF:				
		mov	A, R7
		jnz	code_9AC5

code_9AE2:				
		mov	DPTR, #0F9h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_AD91
		cjne	R7, #1,	code_9B01
		mov	DPTR, #0F9h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #0F9h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #0F8h
		mov	A, #1
		movx	@DPTR, A

code_9B01:				
		ret
 


; ======================================================
;
; R3R2R1 指针
; R4R5 OFFSET
; 
;
IAP_READ_9B02:				
	;	mov	RAM_19,R4
	;	mov	RAM_1A,R5				; 
	;	mov	RAM_1B,R3				; 6.8版本编号称重表_20201212_004 是这样执行的
	
	
		nop						; 
		nop			 			; 
		nop						;
		ljmp	AT24C512_Sequential_Read_1DA	; 我现在的程序 是这样执行的2023-8-20
		
		mov	RAM_1C,R2
		mov	RAM_1D,R1
		mov	A, R7
		add	A, #0FFh
		mov	R7, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R7
		mov	R6, A
		mov	A, R6
		orl	RAM_19,A
		
		
		
		clr	A
		mov	DPTR, #2A9h
		movx	@DPTR, A

code_9B1E:				
		mov	DPTR, #2A9h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, RAM_1F
		clr	A
		subb	A, RAM_1E
		jnc	code_9B50
		
		mov	A, R7
		mov	R5, A
		mov	R4, #0
		add	A, RAM_1A
		mov	R7, A
		mov	A, R4
		addc	A, RAM_19
		mov	R6, A
		mov	R3, RAM_1B
		mov	A, RAM_1D
		add	A, R5
		mov	R1, A
		mov	A, R4
		addc	A, RAM_1C
		mov	R2, A
		lcall	IAP_ReadByte_ByR6R7_8793
		
		mov	A, R7
		jnz	code_9B48
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_9B48:				
		mov	DPTR, #2A9h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		
		sjmp	code_9B1E
; ---------------------------------------------------------------------------

code_9B50:				
		mov	R7, #1
		ret
;  


; ======================================================


code_9B53:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,#0
		mov	RAM_1F,#2
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #0Ch
		lcall	IAP_READ_9B02		; 5
		mov	A, R7
		jnz	code_9B6C
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_9B6C:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #5Fh
		mov	RAM_1E,	#0
		mov	RAM_1F,	#26h
		mov	R5, #2
		mov	R4, #0
		mov	R7, #0Ch
		lcall	IAP_READ_9B02		; 6
		mov	A, R7
		jnz	code_9B86
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_9B86:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #5Fh
		mov	R5, #26h
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, R6
		jnz	code_9B9B
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R7

code_9B9B:				
		jz	code_9BA0
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9BA0:				
		mov	R7, #1
		ret
 


; ======================================================


CRC16_R5TIME_9BA3:				
		mov	RAM_1C,	R3
		mov	RAM_1D,	R2
		mov	RAM_1E,	R1
		mov	DPTR, #2B6h
		mov	A, #0FFh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_9BB1:				
		mov	R7, RAM_5
		dec	R5
		mov	A, R7
		jz	code_9BE8
		mov	R0, #1Ch
		clr	A
		mov	B, #1
		lcall	code_134C
		lcall	R3R2R1_GetACC_103D
		mov	R7, A
		mov	DPTR, #2B6h
		movx	A, @DPTR
		xrl	A, R7
		mov	DPTR, #2B8h
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #2EE8h
		movc	A, @A+DPTR
		mov	R6, A
		mov	DPTR, #2B7h
		movx	A, @DPTR
		xrl	A, R6
		mov	DPTR, #2B6h
		movx	@DPTR, A
		mov	A, R7
		mov	DPTR, #2FE8h
		movc	A, @A+DPTR
		mov	DPTR, #2B7h
		movx	@DPTR, A
		sjmp	code_9BB1
; ---------------------------------------------------------------------------

code_9BE8:				
		mov	DPTR, #2B6h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	A, R5
		mov	R7, A
		ret
;  

; ---------------------------------------------------------------------------
 
code_9BF3:				
		mov	DPTR, #361h
		mov	A, #5Eh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #4
		movx	@DPTR, A
		mov	DPTR, #0ADh
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.3, code_9C09
		mov	R6, #6
		sjmp	code_9C0B
; ---------------------------------------------------------------------------

code_9C09:				
		mov	R6, #3Fh

code_9C0B:				
		mov	DPTR, #363h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnb	ACC.2, code_9C18
		mov	R7, #6
		sjmp	code_9C1A
; ---------------------------------------------------------------------------

code_9C18:				
		mov	R7, #3Fh

code_9C1A:				
		mov	DPTR, #364h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #0ADh
		movx	A, @DPTR
		mov	R7, A
		jnb	ACC.1, code_9C2B
		mov	R6, #6
		sjmp	code_9C2D
; ---------------------------------------------------------------------------

code_9C2B:				
		mov	R6, #3Fh

code_9C2D:				
		mov	DPTR, #365h
		mov	A, R6
		movx	@DPTR, A
		mov	A, R7
		jnb	ACC.0, code_9C3A
		mov	R7, #6
		sjmp	code_9C3C
; ---------------------------------------------------------------------------

code_9C3A:				
		mov	R7, #3Fh

code_9C3C:				
		mov	DPTR, #366h
		mov	A, R7
		movx	@DPTR, A
		ret
;  CHUNK	FOR code_B9AE

; ======================================================


code_9C42:				
		mov	DPTR, #31Bh
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_9C8F
		mov	DPTR, #319h
		movx	A, @DPTR
		clr	C
		subb	A, #5
		jc	code_9C59
		lcall	code_CEA6
		ljmp	code_C4B8
; ---------------------------------------------------------------------------

code_9C59:				
		mov	DPTR, #319h
		movx	A, @DPTR
		mov	R5, A
		mov	R6, #0
		mov	R3, #1
		add	A, #13h
		mov	R1, A
		mov	A, R6
		addc	A, #3
		mov	R2, A
		lcall	R3R2R1_GetACC_103D
		mov	R7, A
		mov	DPTR, #352h
		movx	A, @DPTR
		xrl	A, R7
		mov	DPTR, #26Fh
		movx	@DPTR, A
		mov	A, R5
		jnz	code_9C7F
		movx	A, @DPTR
		mov	R7, A
		mov	R5, #1
		sjmp	code_9C86
; ---------------------------------------------------------------------------

code_9C7F:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R5, A

code_9C86:				
		lcall	code_C7A6
		mov	DPTR, #319h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_9C8F:				
		ret
;  code_9C42


; ======================================================


code_9C90:				

; FUNCTION CHUNK AT 0000C6E6 SIZE 00000014 BYTES

		lcall	code_AE01
		lcall	code_B328
		lcall	code_CBA0
		lcall	code_C56E
		lcall	code_CD98
		lcall	code_B744
		lcall	code_9EAB
		lcall	code_C381
		lcall	code_C399
		lcall	code_BDCE
		lcall	code_B8A7
		lcall	code_C3C9
		lcall	code_C3B1
		lcall	code_B092
		lcall	code_C584
		lcall	code_CEBE
		lcall	code_CEC4
		lcall	code_CED0
		lcall	code_CEAC
		lcall	code_CBAE
		lcall	code_C82B
		clr	A
		mov	DPTR, #98h
		movx	@DPTR, A
		mov	DPTR, #90h
		movx	@DPTR, A
		lcall	code_CDB6
		ljmp	code_C6E6
;  code_9C90

; ---------------------------------------------------------------------------

code_9CDE:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	DPTR, #30Dh
		movx	A, @DPTR
		cjne	A, #1, code_9CF2
		lcall	code_5FB9

code_9CF2:				
		mov	DPTR, #30Dh
		movx	A, @DPTR
		cjne	A, #2, code_9D06
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_88E6

code_9D06:				
		clr	A
		cjne	A, RAM_14, code_9D2B
		mov	A, RAM_13
		cjne	A, #2, code_9D2B
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_9D2B
		lcall	code_97C0
		mov	A, R7
		jz	code_9D2B
		lcall	code_6836
		mov	A, R7
		jnz	code_9D2B
		mov	R7, #5
		lcall	code_BBAC

code_9D2B:				
		ret
; ---------------------------------------------------------------------------

code_9D2C:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		mov	DPTR, #2F2h
		movx	A, @DPTR
		cjne	A, #1, code_9D40
		lcall	code_5FB9

code_9D40:				
		mov	DPTR, #2F2h
		movx	A, @DPTR
		cjne	A, #2, code_9D54
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_88E6

code_9D54:				
		clr	A
		cjne	A, RAM_14, code_9D79
		mov	A, RAM_13
		cjne	A, #2, code_9D79
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_9D79
		lcall	code_ABC2
		mov	A, R7
		jz	code_9D79
		lcall	code_6B30
		mov	A, R7
		jnz	code_9D79
		mov	R7, #5
		lcall	code_BBAC

code_9D79:				
		ret

; ======================================================


code_9D7A:				

; FUNCTION CHUNK AT 00008000 SIZE 0000007F BYTES
; FUNCTION CHUNK AT 0000CF35 SIZE 00000006 BYTES

		mov	RAM_18,	R7
		mov	DPTR, #90h
		movx	A, @DPTR
		jnz	code_9DC6
		mov	DPTR, #98h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_9D99
		dec	A
		jz	code_9D9E
		dec	A
		jz	code_9DA3
		add	A, #3
		jnz	code_9DA6
		lcall	code_BEB0
		sjmp	code_9DA6
; ---------------------------------------------------------------------------

code_9D99:				
		lcall	nullsub_3
		sjmp	code_9DA6
; ---------------------------------------------------------------------------

code_9D9E:				
		lcall	code_66B6
		sjmp	code_9DA6
; ---------------------------------------------------------------------------

code_9DA3:				
		lcall	code_CE38

code_9DA6:				
		mov	DPTR, #98h
		mov	A, RAM_18
		movx	@DPTR, A
		add	A, #0FEh
		jz	code_9DBD
		dec	A
		jz	code_9DC0
		dec	A
		jz	code_9DC3
		add	A, #3
		jnz	code_9DC6
		ljmp	code_CF35
; ---------------------------------------------------------------------------

code_9DBD:				
		ljmp	code_CF38
; ---------------------------------------------------------------------------

code_9DC0:				
		ljmp	code_8000
; ---------------------------------------------------------------------------

code_9DC3:				
		lcall	code_CD38

code_9DC6:				
		ret
;  code_9D7A


; ======================================================


code_9DC7:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		lcall	code_82F2
		mov	A, R7
		jz	code_9DDF
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		lcall	code_C780
		mov	A, R7
		jnz	code_9DE2

code_9DDF:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_9DE2:				
		mov	DPTR, #269h
		movx	A, @DPTR
		cjne	A, #3, code_9E10
		mov	RAM_24,	#1
		mov	RAM_25,	#2
		mov	RAM_26,	#6Ah
		mov	RAM_27,	#3Ah
		mov	R3, #1
		mov	R2, #1
		mov	R1, #67h
		lcall	code_A9DC
		mov	DPTR, #2A4h
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #1DAh
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_9E10:				
		mov	R7, #0
		ret
;  code_9DC7


; ======================================================


code_9E13:				
		mov	R7, #0Ch
		lcall	IAP_ERASE_CF27	; state=IAP_ERASE_CF27(0X0C);
		mov	A, R7			; 
		jnz	code_9E1D		; if(state==0)
		mov	R7, A			;	return 0;
		ret
code_9E1D:				
		mov	R3, #1
		mov	R2, #0		; 
		mov	R1, #5Fh		;
		mov	RAM_22,#0
		mov	RAM_23,#26h			; 38
		mov	R5, #2
		mov	R4, #0
		mov	R7, #0Ch
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7			; state=IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D(0X0C);
		jnz	code_9E37		
		mov	R7, A			; if(state==0)return 0;	
		ret
 
code_9E37:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #5Fh
		mov	R5, #26h
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #272h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #72h
		mov	RAM_22,#0
		mov	RAM_23,#2		; 0X02字节
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #0Ch
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		ret
;  code_9E13

; ---------------------------------------------------------------------------

code_9E5F:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		clr	A
		cjne	A, RAM_14, code_9E85
		mov	A, RAM_13
		cjne	A, #2, code_9E85
		lcall	R3R2R1_GetACC_103D
		jnz	code_9EAA
		mov	DPTR, #303h
		movx	A, @DPTR
		jnz	code_9E82
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_9E82:				
		ljmp	code_3D63
; ---------------------------------------------------------------------------

code_9E85:				
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_A01E
		mov	A, R7
		jz	code_9EAA
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_9EAA
		mov	DPTR, #303h
		movx	A, @DPTR
		jz	code_9EAA
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_9968
		lcall	code_CABF

code_9EAA:				
		ret

; ======================================================


code_9EAB:				
		clr	A
		mov	DPTR, #164h
		movx	@DPTR, A
		mov	DPTR, #26h
		inc	A
		movx	@DPTR, A
		clr	A
		mov	DPTR, #5Eh
		movx	@DPTR, A
		mov	DPTR, #0A0h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		lcall	code_9EF6
		clr	A
		mov	DPTR, #12Ah
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #126h
		lcall	code_130F
		nop
		nop
		nop
		nop
		clr	A
		mov	DPTR, #12Dh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1DAh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #12Ch
		movx	@DPTR, A
		mov	DPTR, #2Ah
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #95h
		mov	A, #0FFh
		movx	@DPTR, A
		ret
;  code_9EAB


; ======================================================


code_9EF6:				
		mov	A, #1
		lcall	WriteACC_ToR3R2R1_10B6
		mov	DPL, A
		mov	DPH, #0
		clr	A
		lcall	code_10C8
		mov	DPTR, #2
		clr	A
		lcall	code_10C8
		mov	DPTR, #3
		mov	A, #0FFh
		lcall	code_10C8
		mov	DPTR, #4
		mov	A, #0FFh
		lcall	code_10C8
		mov	DPTR, #5
		clr	A
		lcall	code_10C8
		mov	DPTR, #6
		clr	A
		lcall	code_10C8
		mov	DPTR, #7
		clr	A
		mov	B, A
		lcall	code_121F
		mov	A, R1
		add	A, #9
		mov	R1, A
		clr	A
		addc	A, R2
		mov	R2, A
		clr	A
		mov	RAM_2E,	A
		mov	R5, #14h
		ljmp	code_C21A
;  code_9EF6

; ---------------------------------------------------------------------------

code_9F41:				
	;	mov	DPTR, #361h
	;	mov	A, #0E6h
	;	movx	@DPTR, A	   			; 4.6
	;	inc	DPTR
	;	mov	A, #7Dh		     		; 
	;	movx	@DPTR, A

		mov	DPTR, #361h
		mov	A, #0XFD
		movx	@DPTR, A	   			; 6D.6
		inc	DPTR
		mov	A, #0X7F		     		; 
		movx	@DPTR, A
	 
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_9F5B
		mov	A, R7
		setb	C
		subb	A, #1Dh
		jc	code_9F6B

code_9F5B:				
		clr	A
		mov	DPTR, #363h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #79h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #50h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_9F6B:				
		mov	A, R7
		mov	B, #4
		mul	AB
		add	A, #0x1e30&0xff 		; code_1E30
		mov	R1, A
		mov	A, #0x1e30>>8
		addc	A, B
		mov	RAM_24,#0FFh
		mov	RAM_25,A
		mov	RAM_26,R1
		mov	RAM_27,#4
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		lcall	code_A9DC
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_CA7F

code_9F8B:				
		mov	RAM_1A,	R3
		mov	RAM_1B,	R2
		mov	RAM_1C,	R1
		mov	RAM_1D,	R5
		mov	A, RAM_1D
		clr	C
		subb	A, #0Ah
		jc	code_9F9D
		mov	RAM_1D,	#9

code_9F9D:				
		mov	R3, RAM_1A
		mov	R2, RAM_1B
		mov	R1, RAM_1C
		lcall	R3R2R1_GetACC_103D
		xrl	A, RAM_1D
		jz	code_9FD4

code_9FAA:				
		mov	R3, RAM_1A
		mov	R2, RAM_1B
		mov	R1, RAM_1C
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		setb	C
		subb	A, RAM_1D
		jc	code_9FC9
		mov	RAM_21,	#0
		mov	RAM_22,	#0
		mov	RAM_23,	#0
		lcall	code_57FC
		sjmp	code_9FAA
; ---------------------------------------------------------------------------

code_9FC9:				
		mov	R3, RAM_1A
		mov	R2, RAM_1B
		mov	R1, RAM_1C
		mov	A, RAM_1D
		lcall	WriteACC_ToR3R2R1_10B6

code_9FD4:				
		ret
;  CHUNK	FOR code_CA7F

; ======================================================


code_9FD5:				
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		setb	C
		mov	A, R7
		subb	A, #0Fh
		mov	A, R6
		xrl	A, #80h
		subb	A, #0A7h
		jc	code_A000
		mov	DPTR, #5Eh
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #0A0h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_A000:				
		clr	C
		mov	A, R7
		subb	A, #19h
		mov	A, R6
		xrl	A, #80h
		subb	A, #7Ch
		jnc	code_A018
		mov	DPTR, #5Eh
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #0A0h
		mov	A, #0FFh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_A018:				
		clr	A
		mov	DPTR, #5Eh
		movx	@DPTR, A
		ret
;  code_9FD5


; ======================================================


code_A01E:				
		mov	A, R7
		jnz	code_A024
		mov	A, R6
		xrl	A, #4

code_A024:				
		jz	code_A060
		mov	A, R7
		xrl	A, #2
		orl	A, R6
		jz	code_A060
		mov	A, R7
		xrl	A, #4
		orl	A, R6
		jz	code_A060
		mov	A, R7
		xrl	A, #8
		orl	A, R6
		jz	code_A060
		mov	A, R7
		xrl	A, #20h
		orl	A, R6
		jz	code_A060
		mov	A, R7
		xrl	A, #40h
		orl	A, R6
		jz	code_A060
		mov	A, R7
		xrl	A, #80h
		orl	A, R6
		jz	code_A060
		mov	A, R7
		jnz	code_A050
		mov	A, R6
		xrl	A, #8

code_A050:				
		jz	code_A060
		mov	A, R7
		jnz	code_A058
		mov	A, R6
		xrl	A, #1

code_A058:				
		jz	code_A060
		mov	A, R7
		xrl	A, #10h
		orl	A, R6
		jnz	code_A064

code_A060:				
		mov	R7, #1
		sjmp	code_A066
; ---------------------------------------------------------------------------

code_A064:				
		mov	R7, #0

code_A066:				
		ret
 


; ======================================================
;
;
;
INIT_A067:				
		lcall	code_6E04
		
		lcall	code_3442
		
		lcall	code_C01D
		
		lcall	code_5716
		
		lcall	code_CED6
		
		lcall	code_CDE8
		
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jz	code_A084
		mov	R7, #3
		lcall	code_C059

code_A084:				
		mov	DPTR, #8Eh
		movx	A, @DPTR
		jz	code_A08F
		mov	R7, #2
		lcall	code_C059

code_A08F:				
		lcall	nullsub_5
		lcall	code_CA7F
		lcall	code_CA0B
		lcall	code_CA1C
		lcall	code_70C4
		lcall	code_CDAC
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jz	code_A0AA
		lcall	code_C994

code_A0AA:				
		mov	R7, #1
		ljmp	code_9D7A



; ======================================================


code_A0AF:				
		mov	A, R7
		clr	C
		subb	A, #7
		jc	code_A0B8
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A0B8:				
		mov	A, #0FCh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		cjne	A, RAM_5, code_A0C9
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_A0C9:				
		mov	A, #0FCh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		mov	A, R5
		movx	@DPTR, A
		mov	DPTR, #91h
		movx	A, @DPTR
		jnz	code_A0EF
		lcall	ClearState_CE40
		lcall	code_A378
		mov	DPTR, #270h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A0EF:				
		mov	DPTR, #85h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_A0AF


; ======================================================


code_A0F7:				

; FUNCTION CHUNK AT 00008F15 SIZE 00000064 BYTES

		mov	DPTR, #3A2h
		movx	A, @DPTR
		mov	R5, A
		mov	DPTR, #29h
		jnz	code_A107
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A
		sjmp	code_A10B
; ---------------------------------------------------------------------------

code_A107:				
		movx	A, @DPTR
		anl	A, #0FBh
		movx	@DPTR, A

code_A10B:				
		mov	A, R5
		jz	code_A13E
		mov	DPTR, #3A3h
		movx	A, @DPTR
		jz	code_A13B
		mov	RAM_1E,	#1
		mov	RAM_1F,	#3
		mov	RAM_20,	#9Ch
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		lcall	code_C411
		mov	RAM_C, #1
		mov	RAM_D, #3
		mov	RAM_E, #9Fh
		mov	R3, #1
		mov	R2, #1
		mov	R1, #32h
		lcall	code_C429
		ljmp	code_8F15
; ---------------------------------------------------------------------------

code_A13B:				
		lcall	code_8B77

code_A13E:				
		ret
;  code_A0F7


; ======================================================


code_A13F:				
		lcall	UserInput_ToR6R7_C489
		mov	DPTR, #309h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #306h
		movx	A, @DPTR
		mov	DPTR, #272h
		movx	@DPTR, A

code_A152:				
		mov	DPTR, #307h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #272h
		movx	A, @DPTR
		setb	C
		subb	A, R7
		jnc	code_A181
		movx	A, @DPTR
		mov	R7, A
		add	A, #67h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0FFh
		movx	@DPTR, A
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_A152
; ---------------------------------------------------------------------------

code_A181:				
		clr	A
		mov	DPTR, #305h
		movx	@DPTR, A
		ret
;  code_A13F

; ---------------------------------------------------------------------------

code_A187:				
		mov	DPTR, #2C6h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #32h
		jc	code_A198
		clr	A
		movx	@DPTR, A
		lcall	code_B6F1

code_A198:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #3, code_A1A8
		mov	DPTR, #169h
		movx	A, @DPTR
		xrl	A, #0Bh
		jz	code_A1AC

code_A1A8:				
		mov	A, R7
		cjne	A, #4, code_A1C9

code_A1AC:				
		mov	DPTR, #2F3h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #64h
		jc	code_A1CE
		clr	A
		movx	@DPTR, A
		mov	DPTR, #2C5h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	B, #6
		div	AB
		mov	A, B
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_A1C9:				
		clr	A
		mov	DPTR, #2C5h
		movx	@DPTR, A

code_A1CE:				
		ret

; ======================================================


code_A1CF:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R6, A
		cjne	A, #4, code_A1DA
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_A1DA:				
		mov	A, R6
		xrl	A, #2
		jz	code_A1E2
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A1E2:				
		mov	DPTR, #29h
		movx	A, @DPTR
		anl	A, #39h
		jz	code_A1ED
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A1ED:				
		mov	DPTR, #26h
		movx	A, @DPTR
		jnz	code_A1F9
		mov	DPTR, #5Eh
		movx	A, @DPTR
		jz	code_A1FC

code_A1F9:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A1FC:				
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_A204
		inc	DPTR
		movx	A, @DPTR

code_A204:				
		jz	code_A209
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A209:				
		mov	DPTR, #0B1h
		mov	A, R7
		movx	@DPTR, A
		mov	R7, #4
		lcall	code_9D7A
		mov	R7, #1
		ret
;  code_A1CF


; ======================================================


code_A216:				
		mov	RAM_1B,	R3
		mov	RAM_1C,	R2
		mov	RAM_1D,	R1
		mov	RAM_24,	RAM_1E
		mov	RAM_25,	RAM_1F
		mov	RAM_26,	RAM_20
		lcall	code_80FD
		mov	DPTR, #277h
		mov	A, R7
		movx	@DPTR, A
		jz	code_A232
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A232:				
		mov	R3, RAM_1B
		mov	A, RAM_1D
		add	A, #3
		mov	R1, A
		clr	A
		addc	A, RAM_1C
		mov	R2, A
		push	RAM_2
		push	RAM_1
		mov	A, RAM_20
		add	A, #3
		mov	R1, A
		clr	A
		addc	A, RAM_1F
		mov	RAM_24,	RAM_1E
		mov	RAM_25,	A
		mov	RAM_26,	R1
		pop	RAM_1
		pop	RAM_2
		lcall	code_817B
		mov	DPTR, #277h
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_A216


; ======================================================


code_A25D:				
		mov	RAM_19,	R6
		mov	RAM_1A,	R7
		mov	R7, TL0
		mov	A, R7
		mov	R7, A
		mov	R5, TH0
		mov	A, R5
		mov	DPTR, #273h
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	R4, RAM_19
		mov	R5, RAM_1A
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	DIV_10FC
		mov	R2, RAM_4
		mov	R3, RAM_5
		mov	R4, RAM_19
		mov	R5, RAM_1A
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	DIV_10FC
		mov	A, R7
		add	A, R3
		mov	R7, A
		mov	A, R6
		addc	A, R2
		mov	R6, A
		mov	R4, RAM_19
		mov	R5, RAM_1A
		lcall	DIV_10FC
		mov	R6, RAM_4
		mov	R7, RAM_5
		ret
;  code_A25D

; ---------------------------------------------------------------------------

code_A2A4:				
		mov	DPTR, #2F6h
		movx	A, @DPTR
		mov	R5, A
		xrl	A, #3
		jz	code_A2B2
		mov	A, R5
		xrl	A, #4
		jnz	code_A2EA

code_A2B2:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R5, A
		xrl	A, #3
		jz	code_A2EA
		mov	A, R5
		xrl	A, #4
		jz	code_A2EA
		mov	A, R7
		jnz	code_A2C6
		mov	A, R6
		xrl	A, #4

code_A2C6:				
		jz	code_A2CE
		mov	A, R7
		xrl	A, #2
		orl	A, R6
		jnz	code_A2EA

code_A2CE:				
		mov	DPTR, #2FDh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		setb	C
		subb	A, #5
		jc	code_A2DD
		mov	A, #2
		movx	@DPTR, A

code_A2DD:				
		clr	A
		mov	DPTR, #374h
		movx	@DPTR, A
		mov	DPTR, #373h
		inc	A
		movx	@DPTR, A
		lcall	code_B9AE

code_A2EA:				
		ret

; ======================================================


code_A2EB:				
		mov	DPTR, #2F6h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_A2F8
		mov	A, R7
		cjne	A, #4, code_A305

code_A2F8:				
		clr	A
		mov	DPTR, #311h
		movx	@DPTR, A
		mov	DPTR, #2FDh
		mov	A, #2
		movx	@DPTR, A
		sjmp	code_A32F
; ---------------------------------------------------------------------------

code_A305:				
		mov	DPTR, #2FDh
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #271h
		mov	A, #2
		movx	@DPTR, A

code_A311:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_A32F
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_A311
; ---------------------------------------------------------------------------

code_A32F:				
		ljmp	code_B9AE
;  code_A2EB


; ======================================================


code_A332:				
		mov	R7, #3
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_A33C
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A33C:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0B4h
		mov	RAM_22,#0
		mov	RAM_23,#1
		mov	R5, #1
		mov	R4, #0
		mov	R7, #3
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A356
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A356:				
		mov	DPTR, #273h
		mov	A, #33h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #73h
		mov	RAM_22,	#0
		mov	RAM_23,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #3
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A375
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A375:				
		mov	R7, #1
		ret
;  code_A332


; ======================================================


code_A378:				
		mov	R7, #11h
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_A382
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A382:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0FCh
		mov	RAM_22,#0
		mov	RAM_23,#8
		mov	R5, #1
		mov	R4, #0
		mov	R7, #11h
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A39C
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A39C:				
		mov	DPTR, #271h
		mov	A, #55h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #71h
		mov	RAM_22,	#0
		mov	RAM_23,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #11h
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A3BB
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A3BB:				
		mov	R7, #1
		ret
;  code_A378


; ======================================================
;
;
;
R4R5_Ramdon_CaculateToR6R7_A3BE:				
		mov	RAM_18,R6
		mov	RAM_19,R7  			; user input

		mov	RAM_1A,R4			;
		mov	RAM_1B,R5	    		; ramdon
		
		mov	R7, #0EAh			; 4000
		mov	R6, #4			;
	;	lcall	R4R5_Ramdon_CaculateToR6R7_7980
	 	lcall	connect_0000		; 计算做一些改变 跟原来不一样

		mov	R4, #27h			;
		mov	R5, #10h			;
		lcall	DIV_10FC			;

		mov	A, R5				;
		cjne	A, RAM_19, code_A3E1	;
		mov	A, R4				;
		cjne	A, RAM_18, code_A3E1 	; if(==temp1)
							; {
		mov	R6, #0			;
		mov	R7, #1			;
		ret					;
							; }
code_A3E1:				
		mov	R5, RAM_1B
		mov	R4, RAM_1A

		mov	R7, #19h
		mov	R6, #15h
		lcall	R4R5_Ramdon_CaculateToR6R7_7980

		mov	R4, #27h
		mov	R5, #10h
		lcall	DIV_10FC
		mov	A, R5
		cjne	A, RAM_19, code_A400  	
		mov	A, R4
		cjne	A, RAM_18, code_A400	; else if(result1==)
							; {
		mov	R6, #0
		mov	R7, #2
		ret					; }
							; else
							; {
code_A400:				
		clr	A
		mov	R6, A
		mov	R7, A
		ret  					; }
; ======================================================


DS1302_A404:				
		mov	C, EA
		clr	A
		rlc	A
		mov	DPTR, #273h
		movx	@DPTR, A
		clr	EA
		setb	P1.3
		nop
		nop
		nop
		nop
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_A419:				
		mov	DPTR, #274h
		movx	A, @DPTR
		clr	C
		rrc	A
		movx	@DPTR, A
		jnb	P1.3, code_A427
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A

code_A427:				
		setb	P1.2
		nop
		nop
		nop
		nop
		clr	P1.2
		nop
		nop
		nop
		nop
		mov	DPTR, #275h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #8, code_A419
		
		mov	DPTR, #273h
		movx	A, @DPTR
		add	A, #0FFh
		mov	EA,	C
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
 


; ======================================================


code_A449:				
		mov	DPTR, #2C7h
		mov	A, #1
		movx	@DPTR, A
		clr	A
		mov	DPTR, #272h
		movx	@DPTR, A

code_A454:				
		mov	DPTR, #2CEh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jnc	code_A48B
		mov	DPTR, #2CDh
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		add	A, R7
		mov	R7, A
		add	A, #67h
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0FFh
		movx	@DPTR, A
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_A454
; ---------------------------------------------------------------------------

code_A48B:				
		ljmp	code_AA1A
;  code_A449

; ---------------------------------------------------------------------------

code_A48E:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		clr	A
		cjne	A, RAM_14, code_A4AD
		mov	A, RAM_13
		cjne	A, #20h, code_A4AD
		lcall	R3R2R1_GetACC_103D
		jnz	code_A4D2
		lcall	code_CC82
		mov	R7, #38h
		sjmp	code_A4CF
; ---------------------------------------------------------------------------

code_A4AD:				
		clr	A
		cjne	A, RAM_14, code_A4D2
		mov	A, RAM_13
		cjne	A, #2, code_A4D2
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_A4D2
		lcall	code_CC82
		lcall	code_8638
		mov	A, R7
		jz	code_A4CD
		ljmp	code_93EE
; ---------------------------------------------------------------------------

code_A4CD:				
		mov	R7, #5

code_A4CF:				
		lcall	code_BBAC

code_A4D2:				
		ret

; ======================================================


code_A4D3:				
		clr	PSW.5
		mov	A, R0
		jnb	ACC.7, code_A4E8
		cpl	PSW.5
		clr	A
		clr	C
		subb	A, R3
		mov	R3, A
		clr	A
		subb	A, R2
		mov	R2, A
		clr	A
		subb	A, R1
		mov	R1, A
		clr	A
		subb	A, R0
		mov	R0, A

code_A4E8:				
		mov	A, R4
		jnb	ACC.7, code_A503
		cpl	PSW.5
		lcall	code_A509
		lcall	code_1439
		clr	A
		clr	C
		subb	A, R3
		mov	R3, A
		clr	A
		subb	A, R2
		mov	R2, A
		clr	A
		subb	A, R1
		mov	R1, A
		clr	A
		subb	A, R0
		mov	R0, A
		sjmp	code_A506
; ---------------------------------------------------------------------------

code_A503:				
		lcall	code_1439

code_A506:				
		jnb	PSW.5, code_A516
;  code_A4D3


; ======================================================


code_A509:				
		clr	A
		clr	C
		subb	A, R7
		mov	R7, A
		clr	A
		subb	A, R6
		mov	R6, A
		clr	A
		subb	A, R5
		mov	R5, A
		clr	A
		subb	A, R4
		mov	R4, A

code_A516:				
		ret
;  code_A509


; ======================================================


code_A517:				
		mov	DPTR, #0F1h
		movx	A, @DPTR
		jnz	code_A538
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_A527
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #1

code_A527:				
		jnz	code_A532
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jb	ACC.1, code_A538
		sjmp	code_A532
; ---------------------------------------------------------------------------

code_A532:				
		mov	DPTR, #0F1h
		mov	A, #1
		movx	@DPTR, A

code_A538:				
		mov	DPTR, #0A8h
		movx	A, @DPTR
		jnz	code_A559
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_A548
		inc	DPTR
		movx	A, @DPTR
		xrl	A, #1

code_A548:				
		jnz	code_A553
		mov	DPTR, #0ADh
		movx	A, @DPTR
		jb	ACC.0, code_A559
		sjmp	code_A553
; ---------------------------------------------------------------------------

code_A553:				
		mov	DPTR, #0A8h
		mov	A, #1
		movx	@DPTR, A

code_A559:				
		ret
;  code_A517

; ---------------------------------------------------------------------------

code_A55A:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		lcall	code_CDC4
		mov	A, R7
		jz	code_A577
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_A577:				
		clr	A
		cjne	A, RAM_14, code_A59C
		mov	A, RAM_13
		cjne	A, #2, code_A59C
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_A59C
		lcall	code_2ACB
		mov	A, R7
		jz	code_A59C
		lcall	code_C631
		mov	A, R7
		jnz	code_A59C
		mov	R7, #5
		lcall	code_BBAC

code_A59C:				
		ret

; ======================================================


code_A59D:				
		mov	DPTR, #29h
		movx	A, @DPTR
		jnb	ACC.0, code_A5A7
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A5A7:				
		mov	DPTR, #12Ah
		movx	A, @DPTR
		mov	R5, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #1E3h
		xch	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #0FAh
		movx	A, @DPTR
		jnz	code_A5D6
		lcall	ClearState_CE40
		lcall	code_A8E1
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A5D6:				
		mov	DPTR, #0F3h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_A59D


; ======================================================


code_A5DE:				
		mov	DPTR, #29h
		movx	A, @DPTR
		jnb	ACC.0, code_A5E8
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A5E8:				
		mov	DPTR, #12Ah
		movx	A, @DPTR
		mov	R5, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #1E7h
		xch	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #0FAh
		movx	A, @DPTR
		jnz	code_A617
		lcall	ClearState_CE40
		lcall	code_A8E1
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A617:				
		mov	DPTR, #0F3h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_A5DE


; ======================================================


code_A61F:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #3
		lcall	IAP_READ_9B02		; 7
		mov	A, R7
		jnz	code_A638
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A638:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #33h
		jz	code_A643
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A643:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0B4h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#1
		mov	R5, #1
		mov	R4, #0
		mov	R7, #3
		lcall	IAP_READ_9B02		; 8
		mov	A, R7
		jnz	code_A65D
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A65D:				
		mov	R7, #1
		ret
;  code_A61F


; ======================================================


code_A660:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #11h
		lcall	IAP_READ_9B02		; 9
		mov	A, R7
		jnz	code_A679
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A679:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #55h
		jz	code_A684
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A684:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0FCh
		mov	RAM_1E,	#0
		mov	RAM_1F,	#8
		mov	R5, #1
		mov	R4, #0
		mov	R7, #11h
		lcall	IAP_READ_9B02		; 0X0A
		mov	A, R7
		jnz	code_A69E
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A69E:				
		mov	R7, #1
		ret
;  code_A660


; ======================================================


code_A6A1:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #0Ah
		lcall	IAP_READ_9B02		; 0X0B
		mov	A, R7
		jnz	code_A6BA
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A6BA:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #77h
		jz	code_A6C5
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A6C5:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #86h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#7
		mov	R5, #1
		mov	R4, #0
		mov	R7, #0Ah
		lcall	IAP_READ_9B02		; 0X0C
		mov	A, R7
		jnz	code_A6DF
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A6DF:				
		mov	R7, #1
		ret
;  code_A6A1

; ---------------------------------------------------------------------------

code_A6E2:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		lcall	code_88E6
		mov	A, RAM_14
		jnz	code_A6F7
		mov	A, RAM_13
		xrl	A, #2

code_A6F7:				
		jnz	code_A722
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_A722
		lcall	code_CEE2
		mov	A, R7
		dec	A
		jz	code_A717
		dec	A
		jz	code_A71C
		add	A, #2
		jnz	code_A722
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_A717:				
		lcall	code_BD69
		sjmp	code_A71F
; ---------------------------------------------------------------------------

code_A71C:				
		lcall	code_B53A

code_A71F:				
		lcall	code_CBF3

code_A722:				
		ret

; ======================================================


code_A723:				
		clr	A
		mov	DPTR, #273h
		movx	@DPTR, A

code_A728:				
		mov	DPTR, #273h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #0Ah
		jnc	code_A762
		mov	R3, #0
		mov	R2, #0
		mov	R1, #0
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_1365
		mov	A, R7
		mov	B, #3
		mul	AB
		add	A, #0D3h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_1365
		mov	DPTR, #273h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_A728
; ---------------------------------------------------------------------------

code_A762:				
		ret
;  code_A723


; ======================================================


code_A763:				
		mov	DPTR, #169h
		mov	A, #0Bh
		movx	@DPTR, A
		mov	DPTR, #41h
		movx	A, @DPTR
		mov	DPTR, #1A1h
		movx	@DPTR, A
		mov	DPTR, #97h
		movx	@DPTR, A
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_A785
		lcall	code_AD91
		mov	A, R7
		jnz	code_A7A2

code_A785:				
		mov	DPTR, #1D8h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_8806
		mov	DPTR, #0F7h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0FFh, code_A79D
		mov	R7, #1
		sjmp	code_A79F
; ---------------------------------------------------------------------------

code_A79D:				
		mov	R7, #0

code_A79F:				
		mov	A, R7
		jnz	code_A785

code_A7A2:				
		ret
;  code_A763


; ======================================================


code_A7A3:				
		mov	DPTR, #29h
		movx	A, @DPTR
		jnb	ACC.0, code_A7AD
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_A7AD:				
		mov	DPTR, #12Ah
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #1E1h
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	R7, A
		lcall	code_B7E4
		mov	DPTR, #0FAh
		movx	A, @DPTR
		jnz	code_A7DB
		lcall	ClearState_CE40
		lcall	code_A8E1
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A7DB:				
		mov	DPTR, #0F3h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_A7A3


; ======================================================


code_A7E3:				
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	DPTR, #277h
		movx	A, @DPTR
		mov	R7, A
		rlc	A
		subb	A, ACC
		mov	DPL, R7
		mov	DPH, A
;  code_A7E3


; ======================================================


code_A7F5:				
		lcall	R3R2R1_GetACC_1056
		anl	A, #7Fh
		mov	R7, A
		clr	A
		mov	DPTR, #27Dh
		movx	@DPTR, A

code_A800:				
		mov	DPTR, #27Dh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, #10h
		jnc	code_A820
		mov	A, R6
		mov	DPTR, #0CAAFh
		movc	A, @A+DPTR
		cjne	A, RAM_7, code_A818
		mov	DPTR, #27Dh
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A818:				
		mov	DPTR, #27Dh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_A800
; ---------------------------------------------------------------------------

code_A820:				
		mov	R7, #0FFh
		ret
;  code_A7F5


; ======================================================


code_A823:				
		mov	DPH, A
		lcall	code_135C
		mov	DPTR, #30Eh
		movx	A, @DPTR
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	R4, #0
		mov	R5, #3
		lcall	DIV_10FC
		mov	B, #2
		mov	A, R7
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
;  code_A823


; ======================================================


code_A84A:				
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A

code_A851:				
		mov	RAM_1C,	R6
		mov	RAM_1D,	R7
		mov	RAM_1E,	R5
		clr	A
		mov	RAM_1F,	A
		mov	R3, #2
		mov	R5, #5
		mov	R7, #2
		ljmp	code_B88B
;  code_A84A


; ======================================================


code_A863:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #13h
		mov	R5, #4
		mov	RAM_11,	R3
		mov	RAM_12,	R2
		mov	RAM_13,	R1
		clr	A
		mov	DPTR, #274h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_A878:				
		mov	DPTR, #275h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, R5
		jnc	code_A89C
		mov	R3, RAM_11
		mov	R2, RAM_12
		mov	R1, RAM_13
		mov	DPL, R7
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		add	A, R7
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_A878
; ---------------------------------------------------------------------------

code_A89C:				
		mov	DPTR, #274h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_A863


; ======================================================
; 
; 
;
IAP_program_A8A2:				
		mov	R7, #1			; 
		lcall	IAP_ERASE_CF27		; 擦除先
		mov	A, R7				;
		jnz	code_A8AC			;
		mov	R7, A				;
		ret					;
; ---------------------------------------------------------------------------
code_A8AC:				
		mov	R3, #1			; 
		mov	R2, #high(0X1A2)		; 
		mov	R1, #LOW(0X1A2)		; 数组指针
		mov	RAM_22,#0			;
		mov	RAM_23,#38h			; 数量56
		mov	R5, #1			;
		mov	R4, #0			; 偏移量 0位置1位置，从1位置保存
		
		mov	R7, #1			;
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D	; 写入
		mov	A, R7				;
		jnz	code_A8C6			;
		mov	R7, A				; 
		ret
; ---------------------------------------------------------------------------

code_A8C6:				
		mov	DPTR, #275h
		mov	A, #11h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #75h
		mov	RAM_22,#0
		mov	RAM_23,#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #1
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		ret



; ======================================================


code_A8E1:				
		mov	R7, #2
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_A8EB
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A8EB:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #0DDh
		mov	RAM_22,#0
		mov	RAM_23,#0Eh
		mov	R5, #1
		mov	R4, #0
		mov	R7, #2
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A905
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A905:				
		mov	DPTR, #272h
		mov	A, #22h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #72h
		mov	RAM_22,	#0
		mov	RAM_23,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #2
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		ret
;  code_A8E1


; ======================================================


code_A920:				
		mov	R7, #9
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_A92A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A92A:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #3Eh
		mov	RAM_22,#0
		mov	RAM_23,#24h
		mov	R5, #1
		mov	R4, #0
		mov	R7, #9
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A944
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A944:				
		mov	DPTR, #275h
		mov	A, #44h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #75h
		mov	RAM_22,	#0
		mov	RAM_23,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #9
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		ret
;  code_A920


; ======================================================


code_A95F:				
		mov	R7, #0Ah
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_A969
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A969:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #86h
		mov	RAM_22,	#0
		mov	RAM_23,	#7
		mov	R5, #1
		mov	R4, #0
		mov	R7, #0Ah
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		mov	A, R7
		jnz	code_A983
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_A983:				
		mov	DPTR, #276h
		mov	A, #77h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #76h
		mov	RAM_22,	#0
		mov	RAM_23,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #0Ah
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		ret
;  code_A95F


; ======================================================


code_A99E:				
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_A9BC
		lcall	code_AD91
		mov	A, R7
		jz	code_A9BC
		mov	DPTR, #106h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #106h
		mov	A, #0FFh
		movx	@DPTR, A

code_A9BC:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0EFh
		movx	@DPTR, A
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_A9D6
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_A9D6
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0DFh
		movx	@DPTR, A

code_A9D6:				
		clr	A
		mov	DPTR, #1A1h
		movx	@DPTR, A
		ret
;  code_A99E


; ======================================================


code_A9DC:				
		mov	RAM_21,	R3
		mov	RAM_22,	R2
		mov	RAM_23,	R1

code_A9E2:				
		mov	A, RAM_27
		setb	C
		subb	A, #0
		jc	code_AA19
		mov	R7, RAM_27
		mov	R6, #0
		mov	A, #0FFh
		add	A, R7
		mov	DPL, A
		mov	A, R6
		addc	A, #0FFh
		mov	DPH, A
		mov	R3, RAM_24
		mov	R2, RAM_25
		mov	R1, RAM_26
		lcall	R3R2R1_GetACC_1056
		mov	R5, A
		mov	A, #0FFh
		add	A, R7
		mov	DPL, A
		mov	A, R6
		addc	A, #0FFh
		mov	DPH, A
		mov	R3, RAM_21
		mov	R2, RAM_22
		mov	R1, RAM_23
		mov	A, R5
		lcall	code_10C8
		dec	RAM_27
		sjmp	code_A9E2
; ---------------------------------------------------------------------------

code_AA19:				
		ret
;  code_A9DC


; ======================================================


code_AA1A:				
		mov	DPTR, #2CDh
		movx	A, @DPTR
		add	A, #61h
		mov	R1, A
		clr	A
		addc	A, #3
		mov	R2, A
		mov	R3, #1
		push	RAM_3
		push	RAM_2
		push	RAM_1
		mov	DPTR, #2C8h
		lcall	code_135C
		mov	DPTR, #2CCh
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		mov	DPL, A
		mov	DPH, B
		lcall	code_137A
		mov	RAM_24,	R3
		mov	RAM_25,	R2
		mov	RAM_26,	R1
		mov	DPTR, #2CEh
		movx	A, @DPTR
		mov	RAM_27,	A
		pop	RAM_1
		pop	RAM_2
		pop	RAM_3
		ljmp	code_A9DC
;  code_AA1A

; ---------------------------------------------------------------------------

code_AA58:				
		mov	DPTR, #2ECh
		mov	A, #0FFh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #2F9h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		clr	A
		mov	DPTR, #2D3h
		movx	@DPTR, A
		mov	DPTR, #3A2h
		movx	A, @DPTR
		jnz	code_AA7B
		mov	DPTR, #303h
		movx	@DPTR, A
		sjmp	code_AA93
; ---------------------------------------------------------------------------

code_AA7B:				
		lcall	code_8B77
		mov	DPTR, #303h
		mov	A, #1
		movx	@DPTR, A
		clr	A
		mov	DPTR, #2EBh
		movx	@DPTR, A
		mov	DPTR, #2FEh
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #301h
		movx	@DPTR, A

code_AA93:				
		ljmp	code_2677
; ---------------------------------------------------------------------------

code_AA96:				
		clr	A
		mov	DPTR, #2C6h
		movx	@DPTR, A
		mov	DPTR, #2F3h
		movx	@DPTR, A
		mov	DPTR, #2C5h
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	@DPTR, A

code_AAA7:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_AAD2
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	A, #67h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_AAA7
; ---------------------------------------------------------------------------

code_AAD2:				
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_9816

code_AAD3:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_AADD
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_AADD:				
		mov	DPTR, #29h
		movx	A, @DPTR
		anl	A, #39h
		jz	code_AAE8
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_AAE8:				
		mov	DPTR, #26h
		movx	A, @DPTR
		jnz	code_AAF4
		mov	DPTR, #5Eh
		movx	A, @DPTR
		jz	code_AAF7

code_AAF4:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_AAF7:				
		lcall	code_7853
		mov	A, R7
		jnz	code_AB07
		mov	DPTR, #29h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_AB07:				
		mov	R7, #3
		lcall	code_9D7A
		mov	R7, #1
		ret
;  CHUNK	FOR code_9816

; ======================================================


code_AB0F:				
		mov	RAM_18,	R3
		mov	RAM_19,	R2
		mov	RAM_1A,	R1
		lcall	code_8877
		mov	A, R7
		jnz	code_AB1D
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_AB1D:				
		mov	RAM_1E,	RAM_18
		mov	RAM_1F,	RAM_19
		mov	RAM_20,	RAM_1A
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		lcall	code_A216
		mov	A, R7
		jnz	code_AB35
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_AB35:				
		mov	RAM_1E,	#1
		mov	RAM_1F,	#1
		mov	RAM_20,	#2Fh
		mov	R3, RAM_18
		mov	R2, RAM_19
		mov	R1, RAM_1A
		lcall	code_C3F9
		lcall	code_BC59
		ret
;  code_AB0F


; ======================================================


code_AB4B:				
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_AB53
		inc	DPTR
		movx	A, @DPTR

code_AB53:				
		jz	code_AB86
		mov	DPTR, #26h
		movx	A, @DPTR
		jnz	code_AB86
		mov	DPTR, #5Eh
		movx	A, @DPTR
		jnz	code_AB86
		mov	DPTR, #12Dh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		orl	A, R6
		jz	code_AB86
		mov	DPTR, #1A2h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	C
		mov	A, R7
		subb	A, R5
		mov	A, R4
		xrl	A, #80h
		mov	R0, A
		mov	A, R6
		xrl	A, #80h
		subb	A, R0
		jnc	code_AB86
		mov	R7, #1
		lcall	code_B7E4

code_AB86:				
		ret
;  code_AB4B


; ======================================================


code_AB87:				
		mov	DPTR, #12Dh
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #0F5h
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0A3h
		movx	@DPTR, A
		mov	DPTR, #1A1h
		movx	A, @DPTR
		mov	R5, A
		cjne	A, #1, code_ABAA
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A

code_ABAA:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_ABC1
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_ABC1
		mov	A, R5
		cjne	A, #2, code_ABC1
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A

code_ABC1:				
		ret
;  code_AB87


; ======================================================


code_ABC2:				
		mov	DPTR, #2CFh
		movx	A, @DPTR
		jnz	code_ABE2
		lcall	code_CEE2
		mov	A, R7
		mov	R5, A
		mov	R4, #0
		mov	R7, #10h
		mov	R6, #0
		lcall	code_5AA7
		mov	A, R7
		jz	code_ABDF
		lcall	code_C0EA
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_ABDF:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_ABE2:				
		lcall	UserInput_ToR6R7_C489
		mov	R4, RAM_6
		mov	R5, RAM_7
		mov	DPTR, #2CFh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_7015
		mov	A, R7
		jz	code_ABFA
		lcall	code_CC34
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_ABFA:				
		mov	R7, #0
		ret
;  code_ABC2


; ======================================================


code_ABFD:				
		mov	R2, #2
		mov	R1, #6Ch
;  code_ABFD


; ======================================================


code_AC01:				
		mov	R3, #1
		mov	R5, #5
;  code_AC01


; ======================================================


code_AC05:				
		mov	RAM_18,	R3
		mov	RAM_19,	R2
		mov	RAM_1A,	R1
		mov	RAM_1B,	R5
		clr	A
		mov	DPTR, #276h
		movx	@DPTR, A

code_AC12:				
		mov	DPTR, #276h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, RAM_1B
		jnc	code_AC36
		mov	R3, RAM_18
		mov	R2, RAM_19
		mov	R1, RAM_1A
		mov	DPL, R7
		mov	DPH, #0
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		lcall	WhileSendR7_C882
		mov	DPTR, #276h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_AC12
; ---------------------------------------------------------------------------

code_AC36:				
		ret
;  code_AC05


; ======================================================


code_AC37:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,#0
		mov	RAM_1F,#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #1
		lcall	IAP_READ_9B02		; 0X0C
		mov	A, R7
		jnz	code_AC50
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_AC50:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #11h
		jz	code_AC5B
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_AC5B:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #0A2h
		mov	RAM_1E,#0
		mov	RAM_1F,#38h
		mov	R5, #1
		mov	R4, #0
		mov	R7, #1
		lcall	IAP_READ_9B02		; 0X0D
		ret
;  code_AC37


; ======================================================


code_AC71:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #2
		lcall	IAP_READ_9B02		; 0X0E
		mov	A, R7
		jnz	code_AC8A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_AC8A:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #22h
		jz	code_AC95
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_AC95:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #0DDh
		mov	RAM_1E,	#0
		mov	RAM_1F,	#0Eh
		mov	R5, #1
		mov	R4, #0
		mov	R7, #2
		lcall	IAP_READ_9B02		; 0X0F
		ret
;  code_AC71


; ======================================================


code_ACAB:				
		mov	R3, #1
		mov	R2, #2
		mov	R1, #69h
		mov	RAM_1E,	#0
		mov	RAM_1F,	#1
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #9
		lcall	IAP_READ_9B02		; 0X10
		mov	A, R7
		jnz	code_ACC4
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_ACC4:				
		mov	DPTR, #269h
		movx	A, @DPTR
		xrl	A, #44h
		jz	code_ACCF
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_ACCF:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #3Eh
		mov	RAM_1E,	#0
		mov	RAM_1F,	#24h
		mov	R5, #1
		mov	R4, #0
		mov	R7, #9
		lcall	IAP_READ_9B02		; 0X11
		ret
;  code_ACAB


; ======================================================


code_ACE5:				
		clr	A
		mov	DPTR, #272h
		movx	@DPTR, A

code_ACEA:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #9
		jnc	code_AD1E
		mov	A, R7
		add	A, ACC
		add	A, #3Eh
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	A, R7
		add	A, ACC
		add	A, #50h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		mov	A, #80h
		movx	@DPTR, A
		inc	DPTR
		clr	A
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_ACEA
; ---------------------------------------------------------------------------

code_AD1E:				
		ret
;  code_ACE5


; ======================================================


code_AD1F:				
		mov	DPTR, #8Dh
		movx	A, @DPTR
		jz	code_AD28
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_AD28:				
		mov	DPTR, #8Fh
		movx	A, @DPTR
		jz	code_AD31
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_AD31:				
		mov	DPTR, #92h
		movx	A, @DPTR
		jz	code_AD3A
		mov	R7, #3
		ret
; ---------------------------------------------------------------------------

code_AD3A:				
		mov	DPTR, #93h
		movx	A, @DPTR
		jz	code_AD43
		mov	R7, #4
		ret
; ---------------------------------------------------------------------------

code_AD43:				
		mov	DPTR, #94h
		movx	A, @DPTR
		jz	code_AD4C
		mov	R7, #6
		ret
; ---------------------------------------------------------------------------

code_AD4C:				
		mov	DPTR, #96h
		movx	A, @DPTR
		jz	code_AD55
		mov	R7, #9
		ret
; ---------------------------------------------------------------------------

code_AD55:				
		mov	R7, #0
		ret
;  code_AD1F

; ---------------------------------------------------------------------------

code_AD58:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		clr	A
		cjne	A, RAM_14, code_AD83
		mov	A, RAM_13
		cjne	A, #2, code_AD83
		lcall	R3R2R1_GetACC_103D
		jnz	code_AD90
		lcall	code_CEE2
		mov	A, R7
		jnz	code_AD7B
		lcall	code_C971
		sjmp	code_AD7E
; ---------------------------------------------------------------------------

code_AD7B:				
		lcall	code_C5DC

code_AD7E:				
		mov	R7, #48h
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_AD83:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_88E6

code_AD90:				
		ret

; ======================================================


code_AD91:				
		mov	A, R7
		clr	C
		subb	A, #5
		jc	code_AD9A
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_AD9A:				
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		jnz	code_ADAD
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_ADAD:				
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Eh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		orl	A, R6
		jnz	code_ADC6
		mov	R7, #1
		sjmp	code_ADC8
; ---------------------------------------------------------------------------

code_ADC6:				
		mov	R7, #2

code_ADC8:				
		ret
;  code_AD91


; ======================================================


code_ADC9:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2Fh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #42h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #2
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #14h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #12h
		ljmp	code_C21A
;  code_ADC9


; ======================================================


code_AE01:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #0Eh
		lcall	code_C21A
		clr	A
		mov	DPTR, #0A6h
		movx	@DPTR, A
		mov	DPTR, #0A5h
		movx	@DPTR, A
		mov	DPTR, #8Dh
		movx	@DPTR, A
		mov	DPTR, #8Fh
		movx	@DPTR, A
		mov	DPTR, #92h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #96h
		movx	@DPTR, A
		mov	DPTR, #104h
		movx	@DPTR, A
		mov	DPTR, #0A2h
		movx	@DPTR, A
		mov	DPTR, #8Eh
		movx	@DPTR, A
		ret
;  code_AE01


; ======================================================


DS1302_AE39:				
		mov	C, EA
		clr	A
		rlc	A
		mov	DPTR, #273h
		movx	@DPTR, A
		clr	EA
		clr	A
		inc	DPTR
		movx	@DPTR, A

code_AE46:				
		mov	A, R7
		rrc	A
		mov	P1.3, C
		nop
		nop
		nop
		nop
		setb	P1.2
		nop
		nop
		nop
		nop
		clr	P1.2
		nop
		nop
		nop
		nop
		mov	A, R7
		clr	C
		rrc	A
		mov	R7, A
		mov	DPTR, #274h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #8, code_AE46
		
		mov	DPTR, #273h
		movx	A, @DPTR
		add	A, #0FFh
		mov	EA,C
		ret
;  DS1302_AE39


; ======================================================


code_AE71:				
		mov	DPTR, #163h
		movx	A, @DPTR
		jz	code_AE7F
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_AE7F:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_AE8B
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jz	code_AE93

code_AE8B:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_AE93:				
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_AEA0
		mov	DPTR, #0A1h
		mov	A, #1
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_AEA0:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		ret
;  code_AE71

; ---------------------------------------------------------------------------
		mov	DPTR, #2F6h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_AEB5
		mov	A, R7
		cjne	A, #4, code_AEBA

code_AEB5:				
		clr	A
		mov	R7, A
		lcall	code_75EB

code_AEBA:				
		mov	DPTR, #271h
		mov	A, #2
		movx	@DPTR, A

code_AEC0:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #5
		jnc	code_AEDE
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_AEC0
; ---------------------------------------------------------------------------

code_AEDE:				
		ret
; ---------------------------------------------------------------------------

code_AEDF:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #2, code_AF15
		lcall	code_A13F
		lcall	nullsub_10
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_AEF1:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_AF0F
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_AEF1
; ---------------------------------------------------------------------------

code_AF0F:				
		lcall	code_B163
		lcall	code_CBF3

code_AF15:				
		ret
; ---------------------------------------------------------------------------

code_AF16:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		clr	A
		cjne	A, RAM_14, code_AF3F
		mov	A, RAM_13
		cjne	A, #2, code_AF3F
		lcall	R3R2R1_GetACC_103D
		jnz	code_AF4C
		lcall	code_4E83
		mov	A, R7
		jz	code_AF4C
		lcall	code_4C59
		mov	A, R7
		jnz	code_AF4C
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_AF3F:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9

code_AF4C:				
		ret
; ---------------------------------------------------------------------------
		lcall	code_CC34
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_AF55:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_AF73
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_AF55
; ---------------------------------------------------------------------------

code_AF73:				
		lcall	code_B44B
		lcall	code_B47B
		mov	DPTR, #29h
		movx	A, @DPTR
		jnb	ACC.1, code_AF83
		anl	A, #0FDh
		movx	@DPTR, A

code_AF83:				
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C286

code_AF84:				
		mov	DPTR, #351h
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_AFB9
		mov	DPTR, #312h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #34Eh
		movx	A, @DPTR
		clr	C
		subb	A, R7
		jc	code_AF9F
		lcall	nullsub_2
		ljmp	code_C646
; ---------------------------------------------------------------------------

code_AF9F:				
		mov	DPTR, #34Eh
		movx	A, @DPTR
		add	A, #1Ch
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R5, A
		lcall	code_C7A6
		mov	DPTR, #34Eh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_AFB9:				
		ret
;  CHUNK	FOR code_C286

; ======================================================


code_AFBA:				
		mov	DPTR, #163h
		movx	A, @DPTR
		jz	code_AFC8
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0F7h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_AFC8:				
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_AFD4
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jz	code_AFDC

code_AFD4:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0DFh
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_AFDC:				
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_AFE8
		clr	A
		mov	DPTR, #0A1h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_AFE8:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #0BFh
		movx	@DPTR, A
		ret
;  code_AFBA


; ======================================================


code_AFF0:				
		lcall	code_8D80
		mov	DPTR, #2BBh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #376h
		movx	A, @DPTR
		xrl	A, R7
		jz	code_B00B
		mov	DPTR, #2BBh
		movx	A, @DPTR
		mov	DPTR, #376h
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B00B:				
		mov	DPTR, #377h
		movx	A, @DPTR
		setb	C
		subb	A, #0Eh
		jnc	code_B025
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0Eh, code_B025
		clr	A
		movx	@DPTR, A
		mov	DPTR, #376h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CA6F

code_B025:				
		ret
;  code_AFF0

; ---------------------------------------------------------------------------

code_B026:				
		mov	DPTR, #310h
		movx	A, @DPTR
		mov	R7, A
		jz	code_B030
		cjne	A, #2, code_B037

code_B030:				
		clr	A
		mov	DPTR, #302h
		movx	@DPTR, A
		sjmp	code_B059
; ---------------------------------------------------------------------------

code_B037:				
		mov	A, R7
		cjne	A, #1, code_B043
		mov	DPTR, #302h
		mov	A, #0Eh
		movx	@DPTR, A
		sjmp	code_B059
; ---------------------------------------------------------------------------

code_B043:				
		mov	A, R7
		cjne	A, #3, code_B04F
		mov	DPTR, #302h
		mov	A, #17h
		movx	@DPTR, A
		sjmp	code_B059
; ---------------------------------------------------------------------------

code_B04F:				
		mov	A, R7
		cjne	A, #4, code_B059
		mov	DPTR, #302h
		mov	A, #18h
		movx	@DPTR, A

code_B059:				
		ljmp	code_4B41

; ======================================================


code_B05C:				
		mov	DPTR, #3A4h
		movx	A, @DPTR
		jz	code_B091
		mov	DPTR, #3ABh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #0Ah
		jc	code_B08E
		clr	A
		movx	@DPTR, A
		mov	DPTR, #3A5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		setb	C
		subb	A, R7
		mov	A, R4
		subb	A, R6
		jnc	code_B08E
		mov	A, R5
		add	A, #0Ah
		mov	R7, A
		clr	A
		addc	A, R4
		mov	R6, A
		lcall	code_C26B

code_B08E:				
		lcall	code_CE2D

code_B091:				
		ret
;  code_B05C


; ======================================================


code_B092:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #67h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #3Ah
		lcall	code_C21A
		mov	DPTR, #54h
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #162h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #13Dh
		movx	@DPTR, A
		mov	DPTR, #97h
		movx	@DPTR, A
		mov	DPTR, #41h
		movx	@DPTR, A
		mov	DPTR, #0F1h
		inc	A
		movx	@DPTR, A
		mov	DPTR, #0A8h
		movx	@DPTR, A
		mov	DPTR, #0F7h
		mov	A, #0FFh
		movx	@DPTR, A
		ret
;  code_B092


; ======================================================


code_B0C7:				
		mov	RAM_14,	R5
		mov	RAM_11,	R3
		mov	RAM_12,	R2
		mov	RAM_13,	R1
		mov	A, RAM_14
		add	A, #0FEh
		mov	R5, A
		lcall	CRC16_R5TIME_9BA3
		mov	R4, #0
		mov	A, #0FEh
		add	A, RAM_14
		mov	DPL, A
		mov	A, R4
		addc	A, #0FFh
		mov	DPH, A
		mov	R3, RAM_11
		mov	R2, RAM_12
		mov	R1, RAM_13
		lcall	code_11C8
		cjne	A, RAM_7, code_B0F8
		mov	A, R6
		cjne	A, B, code_B0F8
		mov	R7, #1
		sjmp	code_B0FA
; ---------------------------------------------------------------------------

code_B0F8:				
		mov	R7, #0

code_B0FA:				
		ret
;  code_B0C7


; ======================================================


code_B0FB:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_B100:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_B11F
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0C0h
		movx	@DPTR, A
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B100
; ---------------------------------------------------------------------------

code_B11F:				
		lcall	code_C1C9
		lcall	code_8720
		mov	R7, #0D0h
		mov	R6, #7
		lcall	delay_C369
		
		ljmp	code_CBF3
;  code_B0FB

; ---------------------------------------------------------------------------

code_B12F:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		lcall	code_88E6
		clr	A
		cjne	A, RAM_14, code_B162
		mov	A, RAM_13
		cjne	A, #2, code_B162
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		lcall	R3R2R1_GetACC_103D
		jnz	code_B162
		lcall	code_CEE2
		mov	A, R7
		dec	A
		jnz	code_B15D
		lcall	code_CBBC
		lcall	code_9E13

code_B15D:				
		mov	R7, #5
		lcall	code_BBAC

code_B162:				
		ret

; ======================================================


code_B163:				
		lcall	code_7BCD
		lcall	code_B597
		lcall	code_ACE5
		lcall	code_CBBC
		lcall	ClearState_CE40
		lcall	IAP_program_A8A2
		lcall	code_A8E1
		lcall	code_A920
		lcall	code_9E13
		lcall	code_8FDB
		lcall	FLAG_SETB_CE7D
		lcall	nullsub_5
		lcall	code_CA7F
		lcall	code_CA0B
		lcall	code_CA1C
		lcall	code_70C4
		ljmp	code_CDAC
;  code_B163


; ======================================================


code_B196:				
		mov	DPTR, #0F4h
		movx	A, @DPTR
		jnz	code_B19E
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B19E:				
		mov	DPTR, #272h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #0F4h
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		movx	A, @DPTR
		jnz	code_B1C3
		mov	DPTR, #0B2h
		movx	A, @DPTR
		jz	code_B1C3
		
		clr	A
		movx	@DPTR, A
		
		lcall	ClearState_CE40
		
		lcall	IAP_program_A8A2
		
		mov	DPTR, #272h
		mov	A, R7
		movx	@DPTR, A
		
		lcall	FLAG_SETB_CE7D

code_B1C3:				
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		ret
;   


; ======================================================


code_B1C9:				
		mov	RAM_1E,	#0FFh
		mov	RAM_1F,	#6Fh
		mov	RAM_20,	#60h
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		lcall	code_A216
		setb	C
		mov	A, R7
		xrl	A, #80h
		subb	A, #80h
		jnc	code_B1E6
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_B1E6:				
		mov	DPTR, #135h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #1
		jc	code_B1F6
		mov	A, R7
		setb	C
		subb	A, #1Dh
		jc	code_B1F9

code_B1F6:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_B1F9:				
		mov	R7, #1
		ret
;  code_B1C9


; ======================================================


code_B1FC:				
		mov	A, R7
		clr	C
		subb	A, #5
		jc	code_B204
		sjmp	code_B215
; ---------------------------------------------------------------------------

code_B204:				
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		jnz	code_B21A

code_B215:				
		mov	R6, #0FFh
		mov	R7, #0FFh
		ret
; ---------------------------------------------------------------------------

code_B21A:				
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Eh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_B1FC


; ======================================================


code_B22E:				
		mov	A, R7
		clr	C
		subb	A, #0Ah
		jc	code_B237
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_B237:				
		mov	DPTR, #0B4h
		movx	A, @DPTR
		cjne	A, RAM_7, code_B241
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B241:				
		mov	DPTR, #0B4h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		rrc	A
		inc	A
		mov	R7, A
		lcall	code_7404
		mov	A, R7
		jnz	code_B254
		lcall	code_ADC9

code_B254:				
		lcall	code_A332
		lcall	code_A723
		lcall	code_8AA0
		mov	R7, #1
		ret
;  code_B22E


; ======================================================


code_B260:				
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jc	code_B273
		setb	C
		mov	A, R7
		subb	A, #0Fh
		mov	A, R6
		xrl	A, #80h
		subb	A, #0A7h
		jc	code_B276

code_B273:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_B276:				
		mov	DPTR, #89h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	ClearState_CE40
		lcall	code_A95F
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_B260


; ======================================================


code_B292:				
		clr	A
		mov	DPTR, #2C7h
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	@DPTR, A

code_B29B:				
		mov	DPTR, #2CEh
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, R7
		jnc	code_B2C3
		mov	DPTR, #2CDh
		movx	A, @DPTR
		mov	R7, A
		mov	A, R6
		add	A, R7
		add	A, #6Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #272h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B29B
; ---------------------------------------------------------------------------

code_B2C3:				
		ret
;  code_B292

; ---------------------------------------------------------------------------

code_B2C4:				
		mov	A, R7
		jnz	code_B2CA
		mov	A, R6
		xrl	A, #2

code_B2CA:				
		jnz	code_B2F5
		lcall	R3R2R1_GetACC_103D
		cjne	A, #1, code_B2F5
		mov	DPTR, #361h
		mov	A, #1Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #4
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h

		mov	DPTR, #sram_13B
		CLR	A
		mov	R4, A
		inc	DPTR
		CLR	A
		mov	R5, A

	;	mov	DPTR, #sram_13B
	;	movx	A, @DPTR
	;	mov	R4, A
	;	inc	DPTR		 		; 原版
	;	movx	A, @DPTR
	;	mov	R5, A

		mov	RAM_27,#4
		clr	A
		mov	RAM_28,A
		mov	RAM_29,A
		lcall	code_4161

code_B2F5:				
		ret
; ---------------------------------------------------------------------------
		mov	DPTR, #2F2h
		movx	A, @DPTR
		jz	code_B2FF
		lcall	code_C0EA

code_B2FF:				
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_B304:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_B322
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B304
; ---------------------------------------------------------------------------

code_B322:				
		lcall	code_B196
		ljmp	code_B47B

; ======================================================


code_B328:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_B32D:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #7
		jnc	code_B34B
		mov	A, #0FCh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #269h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B32D
; ---------------------------------------------------------------------------

code_B34B:				
		clr	A
		mov	DPTR, #103h
		movx	@DPTR, A
		mov	DPTR, #91h
		movx	@DPTR, A
		mov	DPTR, #85h
		movx	@DPTR, A
		ret
;  code_B328


; ======================================================


code_B359:				
		mov	DPTR, #103h
		movx	A, @DPTR
		cjne	A, RAM_7, code_B363
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B363:				
		mov	DPTR, #103h
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #91h
		movx	A, @DPTR
		jnz	code_B382
		lcall	ClearState_CE40
		lcall	code_A378
		mov	DPTR, #270h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B382:				
		mov	DPTR, #85h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_B359

; ---------------------------------------------------------------------------

code_B38A:				
		mov	RAM_13,	R6
		mov	RAM_14,	R7
		mov	RAM_15,	R3
		mov	RAM_16,	R2
		mov	RAM_17,	R1
		clr	A
		cjne	A, RAM_14, code_B3AD
		mov	A, RAM_13
		cjne	A, #2, code_B3AD
		lcall	R3R2R1_GetACC_103D
		jnz	code_B3A8
		lcall	UserInput_ToR6R7_C489
		lcall	code_C250

code_B3A8:				
		mov	R7, #5
		ljmp	code_BBAC
; ---------------------------------------------------------------------------

code_B3AD:				
		mov	R3, RAM_15
		mov	R2, RAM_16
		mov	R1, RAM_17
		mov	R7, RAM_14
		mov	R6, RAM_13
		lcall	code_5FB9
		ret
; ---------------------------------------------------------------------------

code_B3BB:				
		mov	RAM_10,	R5
		mov	DPTR, #351h
		movx	A, @DPTR
		cjne	A, #1, code_B3EA
		clr	A
		mov	DPTR, #350h
		movx	@DPTR, A
		mov	DPTR, #34Eh
		movx	A, @DPTR
		add	A, #1Ch
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #34Eh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #32h
		jc	code_B3EA
		lcall	nullsub_12
		lcall	code_C286

code_B3EA:				
		ret

; ======================================================


code_B3EB:				
		setb	P3.4
		clr	A
		mov	DPTR, #2BFh
		movx	@DPTR, A

code_B3F2:				
		mov	DPTR, #2BFh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #1Eh, code_B3F2
		mov	C, P3.2
		clr	A
		rlc	A
		mov	DPTR, #2BEh
		movx	@DPTR, A
		nop
		nop
		clr	P3.4
		clr	A
		inc	DPTR
		movx	@DPTR, A

code_B40B:				
		mov	DPTR, #2BFh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #14h, code_B40B
		mov	DPTR, #2BEh
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_B3EB


; ======================================================


code_B41B:				

; FUNCTION CHUNK AT 0000C9FA SIZE 00000011 BYTES

		lcall	code_C9E9
		lcall	code_A517
		lcall	code_4A1C
		mov	DPTR, #98h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_B43B
		dec	A
		jz	code_B440
		dec	A
		jz	code_B445
		add	A, #3
		jnz	code_B448
		lcall	code_6BEC
		sjmp	code_B448
; ---------------------------------------------------------------------------

code_B43B:				
		lcall	code_9816
		sjmp	code_B448
; ---------------------------------------------------------------------------

code_B440:				
		lcall	code_2084
		sjmp	code_B448
; ---------------------------------------------------------------------------

code_B445:				
		lcall	code_8D19

code_B448:				
		ljmp	code_C9FA
;  code_B41B


; ======================================================


code_B44B:				
		mov	DPTR, #2Eh
		movx	A, @DPTR
		jnz	code_B453
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B453:				
		mov	DPTR, #2Eh
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		movx	A, @DPTR
		jnz	code_B478
		mov	DPTR, #2Ch
		movx	A, @DPTR
		jz	code_B478
		clr	A
		movx	@DPTR, A
		lcall	ClearState_CE40
		lcall	code_6F66
		mov	DPTR, #272h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B478:				
		mov	R7, #1
		ret
;  code_B44B


; ======================================================


code_B47B:				
		mov	DPTR, #0ACh
		movx	A, @DPTR
		jnz	code_B483
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B483:				
		mov	DPTR, #0ACh
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		movx	A, @DPTR
		jnz	code_B4A8
		mov	DPTR, #0A7h
		movx	A, @DPTR
		jz	code_B4A8
		clr	A
		movx	@DPTR, A
		lcall	ClearState_CE40
		lcall	code_A920
		mov	DPTR, #272h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #272h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B4A8:				
		mov	R7, #1
		ret
;  code_B47B


; ======================================================


code_B4AB:				
		mov	DPTR, #0A6h
		movx	A, @DPTR
		jnz	code_B4B3
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B4B3:				
		mov	DPTR, #0A6h
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		movx	A, @DPTR
		jnz	code_B4D8
		mov	DPTR, #0A5h
		movx	A, @DPTR
		jz	code_B4D8
		clr	A
		movx	@DPTR, A
		lcall	ClearState_CE40
		lcall	code_8720
		mov	DPTR, #271h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B4D8:				
		mov	R7, #1
		ret
;  code_B4AB

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_BC7B

code_B4DB:				
		mov	DPTR, #91h
		movx	A, @DPTR
		jnz	code_B4E3
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B4E3:				
		mov	DPTR, #91h
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		movx	A, @DPTR
		jnz	code_B508
		mov	DPTR, #85h
		movx	A, @DPTR
		jz	code_B508
		clr	A
		movx	@DPTR, A
		lcall	ClearState_CE40
		lcall	code_A378
		mov	DPTR, #270h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #270h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B508:				
		mov	R7, #1
		ret
;  CHUNK	FOR code_BC7B

; ======================================================


code_B50B:				
		mov	DPTR, #357h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		rrc	A
		cpl	C
		mov	P1.0, C
		mov	A, R7
		mov	C, ACC.1
		cpl	C
		mov	P4.2, C
		mov	C, ACC.2
		cpl	C
		mov	P0.0, C
		mov	C, ACC.3
		cpl	C
		mov	P0.1, C
		mov	C, ACC.4
		cpl	C
		mov	P4.0, C
		mov	C, ACC.5
		cpl	C
		mov	P3.7, C
		mov	C, ACC.6
		cpl	C
		mov	P3.6, C
		rlc	A
		cpl	C
		mov	P3.5, C
		ret
;  code_B50B


; ======================================================


code_B53A:				
		lcall	code_C76D
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_B542:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		add	A, #99h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		mov	R5, A
		lcall	code_A0AF
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #7
		jc	code_B542
		clr	A
		mov	R7, A
		lcall	code_B359
		ljmp	code_B4DB
;  code_B53A


; ======================================================


code_B569:				
		mov	A, R7
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		add	A, ACC
		mov	R7, A
		mov	A, R6
		rlc	A
		mov	R6, A
		mov	DPTR, #0B4h
		movx	A, @DPTR
		mov	B, #3
		mul	AB
		add	A, #0B5h
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		lcall	code_135C
		mov	DPL, R7
		mov	DPH, R6
		lcall	code_11C8
		mov	R7, A
		mov	R6, B
		ret
;  code_B569


; ======================================================


code_B597:				
		clr	A
		mov	DPTR, #1E1h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1DDh
		lcall	code_130F
		addc	A, R4
		rl	A
		xchd	A, @R1
		inc	R2
		clr	A
		mov	DPTR, #1E3h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		mov	A, #7Fh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0FFh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #27h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		ret
;  code_B597


; ======================================================


code_B5C4:				
		mov	A, R7
		clr	C
		subb	A, #0
		jnc	code_B5CE
		clr	A
		mov	R7, A
		sjmp	code_B5D6
; ---------------------------------------------------------------------------

code_B5CE:				
		mov	A, R7
		setb	C
		subb	A, #1
		jc	code_B5D6
		mov	R7, #1

code_B5D6:				
		mov	DPTR, #360h
		mov	A, R7
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		jnz	code_B5E3
		clr	P3.3
		sjmp	code_B5E9
; ---------------------------------------------------------------------------

code_B5E3:				
		mov	A, R7
		cjne	A, #1, code_B5E9
		setb	P3.3

code_B5E9:				
		clr	A
		mov	DPTR, #35Ch
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_B5C4


; ======================================================


code_B5F1:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_B5F6:				
		mov	R7, #20h
		lcall	WhileSendR7_C882
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #28h
		jc	code_B5F6
		mov	R3, #0FFh
		mov	R2, #52h
		mov	R1, #9Eh
		mov	R5, #13h
		lcall	code_AC05
		mov	R7, #0Dh
		lcall	WhileSendR7_C882
		mov	R7, #0Ah
		ljmp	WhileSendR7_C882
;  code_B5F1


; ======================================================


code_B61C:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #2
		jz	code_B629
		mov	A, R7
		cjne	A, #4, code_B62D

code_B629:				
		clr	A
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B62D:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_B642
		mov	DPTR, #168h
		movx	A, @DPTR
		mov	R6, #0
		jz	code_B63F
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B63F:				
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_B642:				
		mov	R6, #0
		mov	R7, #3
		ret
;  code_B61C

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C7CC

code_B647:				
		mov	DPTR, #28h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		anl	A, #0FDh
		movx	@DPTR, A
		anl	A, #0FBh
		movx	@DPTR, A
		anl	A, #0F7h
		movx	@DPTR, A
		mov	DPTR, #94h
		movx	A, @DPTR
		jz	code_B667
		mov	DPTR, #28h
		movx	A, @DPTR
		anl	A, #0BFh
		movx	@DPTR, A
		anl	A, #7Fh
		movx	@DPTR, A

code_B667:				
		mov	DPTR, #28h
		movx	A, @DPTR
		anl	A, #0EFh
		movx	@DPTR, A
		anl	A, #0DFh
		movx	@DPTR, A
		ret
;  CHUNK	FOR code_C7CC

; ======================================================


code_B672:				
		mov	DPTR, #2F5h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #2D2h
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #38h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #73h
		movx	@DPTR, A
		mov	R7, #0Fh
		mov	R6, #27h
		lcall	code_A25D
		mov	DPTR, #2EFh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	R5, A
		lcall	code_A851
		ljmp	code_6D52
;  code_B672


; ======================================================


code_B69D:				
		mov	A, R7
		xrl	A, #1
		orl	A, R6
		jnz	code_B6AA
		mov	DPTR, #1ECh
		mov	A, #2
		sjmp	code_B6B5
; ---------------------------------------------------------------------------

code_B6AA:				
		mov	A, R7
		xrl	A, #2
		orl	A, R6
		jnz	code_B6B9
		mov	DPTR, #1ECh
		mov	A, #3

code_B6B5:				
		movx	@DPTR, A
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B6B9:				
		mov	A, R7
		orl	A, R6
		jnz	code_B6C4
		mov	DPTR, #1ECh
		inc	A
		movx	@DPTR, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_B6C4:				
		mov	R7, #0
		ret
;  code_B69D


; ======================================================


code_B6C7:				
		lcall	code_771F
		lcall	code_C8E1
		lcall	code_C8CF
		mov	DPTR, #0
		clr	A
		mov	B, #1
		lcall	code_1187
		clr	C
		mov	DPTR, #1
		movx	A, @DPTR
		subb	A, #0B8h
		mov	DPTR, #0
		movx	A, @DPTR
		subb	A, #0Bh
		jc	code_B6F0
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		lcall	code_B05C

code_B6F0:				
		ret
;  code_B6C7


; ======================================================


code_B6F1:				

; FUNCTION CHUNK AT 0000220C SIZE 0000023B BYTES
; FUNCTION CHUNK AT 000092D9 SIZE 0000005D BYTES
; FUNCTION CHUNK AT 0000BCE1 SIZE 00000022 BYTES

		mov	DPTR, #29h
		movx	A, @DPTR
		anl	A, #7Bh
		jz	code_B6FC
		ljmp	code_92D9
; ---------------------------------------------------------------------------

code_B6FC:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #2, code_B706
		ljmp	code_BCE1
; ---------------------------------------------------------------------------

code_B706:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_B710
		ljmp	code_220C
; ---------------------------------------------------------------------------

code_B710:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #4, code_B71A
		lcall	code_47C5

code_B71A:				
		ret
;  code_B6F1


; ======================================================


code_B71B:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jnz	code_B740
		mov	DPTR, #169h
		movx	A, @DPTR
		cjne	A, #0Bh, code_B740
		mov	DPTR, #41h
		movx	A, @DPTR
		mov	R5, A
		cjne	A, #1, code_B737
		mov	R6, #0
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B737:				
		mov	A, R5
		cjne	A, #2, code_B740
		mov	R6, #0
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_B740:				
		clr	A
		mov	R6, A
		mov	R7, A
		ret
;  code_B71B


; ======================================================


code_B744:				
		clr	A
		mov	DPTR, #269h
		movx	@DPTR, A

code_B749:				
		mov	DPTR, #269h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_B76B
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #269h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B749
; ---------------------------------------------------------------------------

code_B76B:				
		ret
;  code_B744


; ======================================================


code_B76C:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_B791
		clr	A
		mov	DPTR, #168h
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		cjne	A, #0Ah, code_B78E
		mov	DPTR, #1AEh
		movx	A, @DPTR
		jnz	code_B785
		inc	DPTR
		movx	A, @DPTR

code_B785:				
		jnz	code_B78E
		mov	DPTR, #0A4h
		movx	A, @DPTR
		anl	A, #0FCh
		movx	@DPTR, A

code_B78E:				
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B791:				
		mov	R7, #0
		ret
;  code_B76C


; ======================================================


code_B794:				
		mov	A, R7
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	RAM_27,	#4
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	RAM_28,	A
		clr	A
		mov	RAM_29,	A
		ljmp	code_4161
;  code_B794


; ======================================================


code_B7BC:				
		mov	DPTR, #26Fh
		mov	A, #1
		movx	@DPTR, A
;  code_B7BC


; ======================================================


code_B7C2:				
		mov	DPTR, #2FEh
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #0FFh, code_B7CE
		mov	R7, #0
		sjmp	code_B7D4
; ---------------------------------------------------------------------------

code_B7CE:				
		mov	A, R7
		mov	B, #0Ah
		mul	AB
		mov	R7, A

code_B7D4:				
		mov	DPTR, #301h
		movx	A, @DPTR
		mov	R6, A
		cjne	A, #0FFh, code_B7E0
		mov	R6, #0
		sjmp	code_B7E0
; ---------------------------------------------------------------------------

code_B7E0:				
		mov	A, R7
		add	A, R6
		mov	R7, A
		ret
;  code_B7C2


; ======================================================


code_B7E4:				
		mov	A, R7
		jz	code_B803
		mov	DPTR, #12Dh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #1DAh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_9616
		mov	DPTR, #1DAh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B803:				
		clr	A
		mov	DPTR, #1DAh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_B7E4


; ======================================================


code_B80B:				
		mov	DPTR, #89h
		mov	A, #22h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0B8h
		movx	@DPTR, A
		mov	RAM_1E,	#1
		mov	RAM_1F,	#0
		mov	RAM_20,	#86h
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		lcall	code_C411
		mov	DPTR, #8Bh
		mov	A, #27h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0Fh
		movx	@DPTR, A
		ret
;  code_B80B


; ======================================================


code_B832:				
		mov	DPTR, #163h
		movx	A, @DPTR
		jnz	code_B858
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_B858
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_B858
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_B851
		mov	DPTR, #0B3h
		mov	A, #1
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B851:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A

code_B858:				
		ret
;  code_B832

; ---------------------------------------------------------------------------

code_B859:				
		mov	DPTR, #2D0h
		movx	A, @DPTR
		add	A, #0DCh
		jz	code_B876
		dec	A
		jz	code_B873
		add	A, #0EEh
		jz	code_B879
		add	A, #0EEh
		jz	code_B87C
		add	A, #44h
		jnz	code_B87F
		ljmp	code_A187
; ---------------------------------------------------------------------------

code_B873:				
		ljmp	code_C905
; ---------------------------------------------------------------------------

code_B876:				
		ljmp	code_C235
; ---------------------------------------------------------------------------

code_B879:				
		ljmp	code_CDD4
; ---------------------------------------------------------------------------

code_B87C:				
		lcall	code_C95F

code_B87F:				
		ret

; ======================================================


code_B880:				
		clr	A
		mov	RAM_1E,	A
		mov	RAM_1F,	A
		mov	R3, #4
		mov	R5, #5
		mov	R7, #4

code_B88B:				
		mov	DPTR, #306h
		mov	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1C
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1D
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1E
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1F
		movx	@DPTR, A
		ret
;  code_B880


; ======================================================


code_B8A7:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #3Eh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #24h
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #0
		mov	R1, #55h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #9
		lcall	code_C21A
		clr	A
		mov	DPTR, #0ACh
		movx	@DPTR, A
		mov	DPTR, #0A7h
		movx	@DPTR, A
		ret
;  code_B8A7


; ======================================================


code_B8CD:				
		mov	DPTR, #163h
		movx	A, @DPTR
		jnz	code_B8F2
		mov	DPTR, #124h
		movx	A, @DPTR
		jnz	code_B8F2
		mov	DPTR, #0FBh
		movx	A, @DPTR
		jnz	code_B8F2
		mov	DPTR, #125h
		movx	A, @DPTR
		jz	code_B8EB
		clr	A
		mov	DPTR, #0B3h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B8EB:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A

code_B8F2:				
		ret
;  code_B8CD


; ======================================================


code_B8F3:				
		clr	P1.4
		clr	P1.2
		nop
		nop
		nop
		nop
		setb	P1.4
		nop
		nop
		nop
		nop
		mov	A, R7
		orl	A, #1
		mov	R7, A
		lcall	DS1302_AE39
		lcall	DS1302_A404
		mov	DPTR, #272h
		mov	A, R7
		movx	@DPTR, A
		clr	P1.4
		nop
		nop
		nop
		nop
		movx	A, @DPTR
		mov	R7, A
		ret
;  

; ---------------------------------------------------------------------------

code_B919:				
		mov	DPTR, #2F5h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #2D2h
		mov	A, #3
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #6Dh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #73h
		movx	@DPTR, A
		mov	DPTR, #89h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R5, A
		lcall	code_A851
		ljmp	code_6D52
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C863

code_B93F:				
		mov	DPTR, #351h
		movx	A, @DPTR
		cjne	A, #1, code_B963
		mov	DPTR, #34Eh
		movx	A, @DPTR
		jnz	code_B951
		mov	DPTR, #350h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B951:				
		mov	DPTR, #350h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #3
		jc	code_B963
		lcall	nullsub_12
		lcall	code_C286

code_B963:				
		ret
;  CHUNK	FOR code_C863

; ======================================================
;
;
;
BaudRate_B964:				
		orl	RESERVED008E, #15h
		
		mov	DPTR, #379h
		mov	A, R7
		movx	@DPTR, A
		dec	A
		jz	code_B97D		; if(par1==1)
		dec	A
		jz	code_B981		; else if(par1==2)
		dec	A
		jz	code_B985
		add	A, #3
		jnz	code_B988
		mov	BRT, #70h
		ret
; ---------------------------------------------------------------------------

code_B97D:				
		mov	BRT, #0B8h
		ret
; ---------------------------------------------------------------------------

code_B981:				
		mov	BRT, #0DCh
		ret
; ---------------------------------------------------------------------------

code_B985:				
		mov	BRT, #0EEh

code_B988:				
		ret
;  

; ---------------------------------------------------------------------------

code_B989:				
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_B98E:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_B9AD
		mov	A, #61h
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		mov	A, #0FFh
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B98E
; ---------------------------------------------------------------------------

code_B9AD:				
		ret

; ======================================================


code_B9AE:				

; FUNCTION CHUNK AT 00006534 SIZE 000000C1 BYTES
; FUNCTION CHUNK AT 00006776 SIZE 000000C0 BYTES
; FUNCTION CHUNK AT 00008BE0 SIZE 00000069 BYTES
; FUNCTION CHUNK AT 00009BF3 SIZE 0000004F BYTES

		mov	DPTR, #2F6h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_B9C6
		dec	A
		jz	code_B9C9
		dec	A
		jz	code_B9CC
		dec	A
		jz	code_B9CF
		add	A, #4
		jnz	code_B9D2
		ljmp	code_8BE0
; ---------------------------------------------------------------------------

code_B9C6:				
		ljmp	code_9BF3
; ---------------------------------------------------------------------------

code_B9C9:				
		ljmp	code_6534
; ---------------------------------------------------------------------------

code_B9CC:				
		ljmp	code_6776
; ---------------------------------------------------------------------------

code_B9CF:				
		lcall	code_C6D2

code_B9D2:				
		ret
;  code_B9AE


; ======================================================


code_B9D3:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_B9D8:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, #0Dh
		jnc	code_B9F5
		mov	A, R6
		mov	DPTR, #203Bh
		movc	A, @A+DPTR
		cjne	A, RAM_7, code_B9ED
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_B9ED:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B9D8
; ---------------------------------------------------------------------------

code_B9F5:				
		mov	R7, #0
		ret
;  code_B9D3


; ======================================================


code_B9F8:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_B9FD:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, #9
		jnc	code_BA1A
		mov	A, R6
		mov	DPTR, #2048h
		movc	A, @A+DPTR
		cjne	A, RAM_7, code_BA12
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BA12:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_B9FD
; ---------------------------------------------------------------------------

code_BA1A:				
		mov	R7, #0
		ret
;  code_B9F8


; ======================================================


code_BA1D:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_BA22:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, #16h
		jnc	code_BA3F
		mov	A, R6
		mov	DPTR, #2051h
		movc	A, @A+DPTR
		cjne	A, RAM_7, code_BA37
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BA37:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_BA22
; ---------------------------------------------------------------------------

code_BA3F:				
		mov	R7, #0
		ret
;  code_BA1D


; ======================================================


code_BA42:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_BA47:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, #1
		jnc	code_BA64
		mov	A, R6
		mov	DPTR, #2067h
		movc	A, @A+DPTR
		cjne	A, RAM_7, code_BA5C
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BA5C:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_BA47
; ---------------------------------------------------------------------------

code_BA64:				
		mov	R7, #0
		ret
;  code_BA42


; ======================================================


code_BA67:				
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_BA6C:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		clr	C
		subb	A, #1
		jnc	code_BA89
		mov	A, R6
		mov	DPTR, #2068h
		movc	A, @A+DPTR
		cjne	A, RAM_7, code_BA81
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BA81:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_BA6C
; ---------------------------------------------------------------------------

code_BA89:				
		mov	R7, #0
		ret
;  code_BA67

; ---------------------------------------------------------------------------

code_BA8C:				
		mov	DPTR, #2F5h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #2D2h
		inc	A
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #6Dh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #5Eh
		movx	@DPTR, A
		mov	DPTR, #8Bh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	A
		mov	R5, A
		lcall	code_A851
		ljmp	code_6D52

; ======================================================


USART_BAB1:				
		clr	A
		mov	DPTR, #318h
		movx	@DPTR, A

		mov	DPTR, #34Fh
		movx	@DPTR, A
		
		mov	R7, A
		lcall	USART_P30P31_P10P11_CB1A

		mov	R7, #2
		lcall	BaudRate_B964

		mov	R7, #8
		lcall	SM1_SM0_C459

		clr	A
		mov	R7, A
		lcall	IE4_CB29

		mov	R7, #1
		lcall	REN_CC00

		ljmp	Send_C983

; ---------------------------------------------------------------------------
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_BADA:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_BAF8
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_BADA
; ---------------------------------------------------------------------------

code_BAF8:				
		ret
; ---------------------------------------------------------------------------
		clr	A
		mov	DPTR, #271h
		movx	@DPTR, A

code_BAFE:				
		mov	DPTR, #271h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #6
		jnc	code_BB1C
		mov	A, #6Dh
		add	A, R7
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		mov	DPTR, #271h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_BAFE
; ---------------------------------------------------------------------------

code_BB1C:				
		ret
; ---------------------------------------------------------------------------

code_BB1D:				
		lcall	code_C899
		mov	DPTR, #361h
		mov	A, #38h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #58h
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #20h
		mov	R1, #6Fh
		clr	A
		mov	RAM_1D,	A
		mov	RAM_1E,	#2
		mov	RAM_1F,	#4
		mov	R5, #3
		lcall	code_BCC9
		ljmp	code_A449

; ======================================================


code_BB41:				
		mov	DPTR, #361h
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #79h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	DPTR, #3A7h
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	RAM_27,	#4
		mov	RAM_28,	#1
		clr	A
		mov	RAM_29,	A
		ljmp	code_4161
;  code_BB41


; ======================================================


code_BB65:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #0A4h
		mov	RAM_1E,#0
		mov	RAM_1F,#7
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #10h
		lcall	IAP_READ_9B02		; 0X12
		mov	A, R7
		jnz	code_BB7E
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_BB7E:				
		lcall	code_C03B
		mov	A, R7
		jnz	code_BB86
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_BB86:				
		mov	R7, #1
		ret
;  code_BB65


; ======================================================


code_BB89:				
		mov	DPTR, #31Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #0Ah
		jc	code_BBAB
		clr	A
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		cjne	A, #1, code_BBAB
		mov	DPTR, #319h
		movx	A, @DPTR
		setb	C
		subb	A, #0
		jc	code_BBAB
		lcall	code_CEA0
		lcall	code_C4B8

code_BBAB:				
		ret
;  code_BB89


; ======================================================


code_BBAC:				
		mov	RAM_18,	R7
		mov	DPTR, #2D0h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, RAM_18
		jz	code_BBCE
		mov	A, R7
		jz	code_BBC0
		lcall	code_C7CC
		lcall	code_7DF5

code_BBC0:				
		mov	DPTR, #2D0h
		mov	A, RAM_18
		movx	@DPTR, A
		jz	code_BBCE
		lcall	code_7683
		lcall	code_C7B9

code_BBCE:				
		ret
;  code_BBAC


; ======================================================


code_BBCF:				
		lcall	code_C7DF

code_BBD2:				
		mov	DPTR, #2F6h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		mov	R7, A
		cjne	A, #5, code_BBE3
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jz	code_BBD2

code_BBE3:				
		mov	A, R7
		clr	C
		subb	A, #6
		jnc	code_BBEF
		lcall	code_A2EB
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BBEF:				
		mov	R7, #0
		ret
;  code_BBCF

; ---------------------------------------------------------------------------

code_BBF2:				
		mov	DPTR, #361h
		mov	A, #38h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #5Eh
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	DPTR, #8Bh
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		mov	RAM_27,	#4
		clr	A
		mov	RAM_28,	A
		mov	RAM_29,	A
		ljmp	code_4161

; ======================================================


code_BC15:				
		lcall	code_A99E
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_BC36
		lcall	code_AD91
		mov	A, R7
		jz	code_BC36
		mov	DPTR, #0F7h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #0F7h
		mov	A, #0FFh
		movx	@DPTR, A

code_BC36:				
		ret
;  code_BC15


; ======================================================


code_BC37:				
		mov	A, R7
		clr	C
		subb	A, #1
		jc	code_BC43
		mov	A, R7
		setb	C
		subb	A, #1Dh
		jc	code_BC46

code_BC43:				
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_BC46:				
		mov	DPTR, #135h
		movx	A, @DPTR
		cjne	A, RAM_7, code_BC50
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BC50:				
		mov	DPTR, #135h
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret
;  code_BC37


; ======================================================


code_BC59:				
		mov	DPTR, #0A6h
		movx	A, @DPTR
		jnz	code_BC73
		lcall	ClearState_CE40
		lcall	code_8720
		mov	DPTR, #277h
		mov	A, R7
		movx	@DPTR, A
		lcall	FLAG_SETB_CE7D
		mov	DPTR, #277h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_BC73:				
		mov	DPTR, #0A5h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
;  code_BC59


; ======================================================


code_BC7B:				

; FUNCTION CHUNK AT 0000B4DB SIZE 00000030 BYTES

		lcall	code_C76D
		mov	DPTR, #103h
		movx	A, @DPTR
		setb	C
		subb	A, #96h
		jc	code_BC8A
		clr	A
		sjmp	code_BC96
; ---------------------------------------------------------------------------

code_BC8A:				
		mov	DPTR, #103h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #96h
		jnc	code_BC9A
		mov	A, R7
		inc	A

code_BC96:				
		mov	R7, A
		lcall	code_B359

code_BC9A:				
		ljmp	code_B4DB
;  code_BC7B

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_94A6

code_BC9D:				
		clr	A
		mov	DPTR, #0F8h
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_BCBE
		lcall	code_AD91
		mov	A, R7
		jz	code_BCBE
		mov	DPTR, #0F9h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #0F9h
		mov	A, #0FFh
		movx	@DPTR, A

code_BCBE:				
		ret
;  CHUNK	FOR code_94A6

; ======================================================


code_BCBF:				
		mov	RAM_1D,	A
		mov	RAM_1E,	#2
		mov	RAM_1F,	#4
		mov	R5, #2
;  code_BCBF


; ======================================================


code_BCC9:				
		mov	DPTR, #2C8h
		lcall	code_1365
		mov	DPTR, #2CBh
		mov	A, R5
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1D
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1E
		movx	@DPTR, A
		inc	DPTR
		mov	A, RAM_1F
		movx	@DPTR, A
		ret
;  code_BCC9

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B6F1

code_BCE1:				
		clr	A
		mov	DPTR, #36Dh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_BCF0
		inc	DPTR
		movx	A, @DPTR

code_BCF0:				
		jnz	code_BCF9
		mov	DPTR, #361h
		mov	A, #80h
		sjmp	code_BCFD
; ---------------------------------------------------------------------------

code_BCF9:				
		clr	A
		mov	DPTR, #361h

code_BCFD:				
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ljmp	code_9A0E
;  CHUNK	FOR code_B6F1

; ======================================================


code_BD03:				
		lcall	UserInput_ToR6R7_C489
		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_BD19
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_BD19:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_A59D
		ret
;  code_BD03


; ======================================================


code_BD25:				
		lcall	UserInput_ToR6R7_C489
		mov	DPTR, #26Fh
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		clr	C
		mov	A, R6
		xrl	A, #80h
		subb	A, #80h
		jnc	code_BD3B
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_BD3B:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_A5DE
		ret
;  code_BD25

; ---------------------------------------------------------------------------

code_BD47:				
		mov	DPTR, #361h
		mov	A, #38h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #54h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #63h
		mov	DPTR, #103h
		movx	A, @DPTR
		mov	R5, A
		mov	R4, #0
		mov	RAM_27,	#4
		clr	A
		mov	RAM_28,	A
		mov	RAM_29,	A
		ljmp	code_4161

; ======================================================


code_BD69:				
		lcall	code_C76D
		clr	A
		mov	DPTR, #26Fh
		movx	@DPTR, A

code_BD71:				
		mov	DPTR, #26Fh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #7
		jnc	code_BD88
		clr	A
		mov	R5, A
		lcall	code_A0AF
		mov	DPTR, #26Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		sjmp	code_BD71
; ---------------------------------------------------------------------------

code_BD88:				
		ljmp	code_B4DB
;  code_BD69


; ======================================================


code_BD8B:				
		lcall	code_C6FA
		mov	R7, #10h
		lcall	IAP_ERASE_CF27
		mov	A, R7
		jnz	code_BD98
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_BD98:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #0A4h
		mov	RAM_22,	#0
		mov	RAM_23,	#7
		clr	A
		mov	R5, A
		mov	R4, A
		mov	R7, #10h
		lcall	IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
		ret
;  code_BD8B


; ======================================================


code_BDAD:				
		setb	C
		mov	A, R7
		subb	A, #64h
		mov	A, R6
		subb	A, #0
		jc	code_BDB9
		mov	R7, #2
		ret
; ---------------------------------------------------------------------------

code_BDB9:				
		mov	A, R7
		add	A, R5
		mov	R7, A
		mov	A, R6
		addc	A, R4
		mov	R6, A
		setb	C
		mov	A, R7
		subb	A, #64h
		mov	A, R6
		subb	A, #0
		jc	code_BDCB
		mov	R7, #3
		ret
; ---------------------------------------------------------------------------

code_BDCB:				
		mov	R7, #0
		ret
;  code_BDAD


; ======================================================


code_BDCE:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0B4h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #3Dh
		lcall	code_C21A
		lcall	code_ADC9
		lcall	code_A723
		lcall	code_8AA0
		clr	A
		mov	DPTR, #2Eh
		movx	@DPTR, A
		mov	DPTR, #2Ch
		movx	@DPTR, A
		ret
;  code_BDCE

; ---------------------------------------------------------------------------

code_BDEF:				
		mov	R7, #0Fh
		mov	R6, #27h
	;	lcall	code_A25D
		lcall	code_CF6B			; change1
		mov	DPTR, #2C3h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #39h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #73h
		movx	@DPTR, A
		clr	A
		mov	R5, A
		lcall	code_A851
		ljmp	code_6D52
; ---------------------------------------------------------------------------

code_BE10:				
		mov	R7, #10h
		mov	R6, #27h
		lcall	code_A25D
	; 	lcall	test_02	  		; /10000
	 
		mov	DPTR, #ramdon1
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A

		mov	DPTR, #361h
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #73h
		movx	@DPTR, A
		clr	A
		mov	R5, A
		lcall	code_A851
		ljmp	code_6D52

; ======================================================


code_BE31:				
		clr	A
		mov	DPTR, #351h
		movx	@DPTR, A
		mov	DPTR, #34Eh
		movx	@DPTR, A
		mov	DPTR, #312h
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #1Ch
		mov	RAM_2E,	A
		mov	R5, #32h
		lcall	code_C21A
		clr	A
		mov	DPTR, #350h
		movx	@DPTR, A
		ret
;  code_BE31

; ---------------------------------------------------------------------------

code_BE51:				
		mov	DPTR, #304h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #0Eh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #71h
		movx	@DPTR, A
		mov	DPTR, #1E9h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R5, #3
		lcall	code_A851
		ljmp	code_6D52

; ======================================================


code_BE71:				
		mov	DPTR, #3A4h
		movx	A, @DPTR
		jz	code_BE8E
		inc	DPTR
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #3A8h
		movx	A, @DPTR
		subb	A, R7
		mov	DPTR, #3A7h
		movx	A, @DPTR
		subb	A, R6
		jc	code_BE8E
		mov	R7, #1
		sjmp	code_BE90
; ---------------------------------------------------------------------------

code_BE8E:				
		mov	R7, #0

code_BE90:				
		ret
;  code_BE71

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR 

code_BE91:				
		lcall	code_BE31

		clr	A
		mov	R7, A
		lcall	USART_P30P31_P10P11_CB1A

		mov	R7, #2
		lcall	BaudRate_B964
		mov	R7, #8
		lcall	SM1_SM0_C459
		mov	R7, #1
		lcall	IE4_CB29
		mov	R7, #1
		lcall	REN_CC00
		ljmp	code_C646
;  CHUNK	FOR 

; ======================================================


code_BEB0:				
		mov	DPTR, #1EBh
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_BECE
		lcall	code_AD91
		mov	A, R7
		jz	code_BECE
		mov	DPTR, #1EBh
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #1EBh
		mov	A, #0FFh
		movx	@DPTR, A

code_BECE:				
		ret
;  code_BEB0


; ======================================================


code_BECF:				
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		clr	C
		subb	A, #5
		jnc	code_BEED
		lcall	code_AD91
		mov	A, R7
		jz	code_BEED
		mov	DPTR, #54h
		movx	A, @DPTR
		mov	R7, A
		lcall	code_C4FD
		mov	DPTR, #54h
		mov	A, #0FFh
		movx	@DPTR, A

code_BEED:				
		ret
;  code_BECF

; ---------------------------------------------------------------------------

code_BEEE:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #2, code_BEF8
		ljmp	code_AAD3
; ---------------------------------------------------------------------------

code_BEF8:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_BF02
		ljmp	code_C1AE
; ---------------------------------------------------------------------------

code_BF02:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #4, code_BF0C
		lcall	code_C70E

code_BF0C:				
		ret
; ---------------------------------------------------------------------------

code_BF0D:				
		clr	A
		mov	DPTR, #304h
		movx	@DPTR, A
		mov	DPTR, #361h
		mov	A, #0Eh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #3Fh
		movx	@DPTR, A
		mov	DPTR, #1E5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R5, #3
		lcall	code_A851
		ljmp	code_6D52

; ======================================================


caculate_BF2C:				
		mov	RAM_19,R6
		mov	RAM_1A,R7
		mov	R3, #0
		mov	R2, #0
		mov	R1, #19h
		mov	R5, #2
		lcall	CRC16_R5TIME_9BA3
		mov	RAM_19,R6
		mov	RAM_1A,R7
		mov	R4, #27h
		mov	R5, #10h				; /10000
		lcall	DIV_10FC
		mov	R7, RAM_5
		mov	R6, RAM_4
		ret
;  

; ---------------------------------------------------------------------------

code_BF4B:				
		mov	RAM_E, R7
		mov	RAM_F, R5
		mov	DPTR, #353h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_BF61
		inc	A
		jnz	code_BF68
		mov	R5, RAM_F
		mov	R7, RAM_E
		ljmp	code_B3BB
; ---------------------------------------------------------------------------

code_BF61:				
		mov	R5, RAM_F
		mov	R7, RAM_E
		lcall	code_7E79

code_BF68:				
		ret

; ======================================================


code_BF69:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_BF75
		clr	A
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_BF75:				
		mov	A, R7
		add	A, ACC
		add	A, #87h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_BF69


; ======================================================


code_BF87:				
		mov	A, R7
		jz	code_BF8E
		mov	R6, #1
		sjmp	code_BF90
; ---------------------------------------------------------------------------

code_BF8E:				
		mov	R6, #0

code_BF90:				
		mov	R7, RAM_6
		mov	DPTR, #136h
		movx	A, @DPTR
		cjne	A, RAM_7, code_BF9C
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BF9C:				
		mov	DPTR, #136h
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret
;  code_BF87


; ======================================================


code_BFA5:				
		mov	A, R7
		jz	code_BFAC
		mov	R6, #1
		sjmp	code_BFAE
; ---------------------------------------------------------------------------

code_BFAC:				
		mov	R6, #0

code_BFAE:				
		mov	R7, RAM_6
		mov	DPTR, #137h
		movx	A, @DPTR
		cjne	A, RAM_7, code_BFBA
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BFBA:				
		mov	DPTR, #137h
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret
;  code_BFA5


; ======================================================


code_BFC3:				
		mov	A, R7
		jz	code_BFCA
		mov	R6, #1
		sjmp	code_BFCC
; ---------------------------------------------------------------------------

code_BFCA:				
		mov	R6, #0

code_BFCC:				
		mov	R7, RAM_6
		mov	DPTR, #138h
		movx	A, @DPTR
		cjne	A, RAM_7, code_BFD8
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BFD8:				
		mov	DPTR, #138h
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret
;  code_BFC3


; ======================================================


code_BFE1:				
		mov	A, R7
		jz	code_BFE8
		mov	R6, #1
		sjmp	code_BFEA
; ---------------------------------------------------------------------------

code_BFE8:				
		mov	R6, #0

code_BFEA:				
		mov	R7, RAM_6
		mov	DPTR, #139h
		movx	A, @DPTR
		cjne	A, RAM_7, code_BFF6
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_BFF6:				
		mov	DPTR, #139h
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret
;  code_BFE1


; ======================================================


DS1302_BFFF:				
		movx	@DPTR, A
 

DS1302_C000:				
		clr	A
		mov	R5, A
		mov	R7, #8Eh
 
DS1302_C004:				
		mov	R6, RAM_5
		clr	P1.2
		setb	P1.4
		nop
		nop
		nop
		nop
		lcall	DS1302_AE39
		mov	R7, RAM_6
		lcall	DS1302_AE39
		clr	P1.4
		nop
		nop
		nop
		nop
		ret
 


; ======================================================


code_C01D:				
		clr	A
		mov	RAM_3B,	A
		mov	R3, #1
		mov	R2, #1
		mov	R1, #0EDh
		mov	RAM_2E,	A
		mov	R5, #3Eh
		lcall	code_C21A
		mov	R3, #1
		mov	R2, #2
		mov	R1, #2Bh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #3Eh
		ljmp	code_C21A
;  code_C01D


; ======================================================


code_C03B:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #0A4h
		mov	R5, #5
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #3A9h
		movx	A, @DPTR
		cjne	A, RAM_6, code_C056
		inc	DPTR
		movx	A, @DPTR
		cjne	A, RAM_7, code_C056
		mov	R7, #1
		sjmp	code_C058
; ---------------------------------------------------------------------------

code_C056:				
		mov	R7, #0

code_C058:				
		ret
;  code_C03B


; ======================================================


code_C059:				
		mov	RAM_8, R7
		mov	DPTR, #353h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, RAM_8
		jz	code_C075
		mov	A, R7
		jz	code_C06A
		lcall	code_C2ED

code_C06A:				
		mov	DPTR, #353h
		mov	A, RAM_8
		movx	@DPTR, A
		jz	code_C075
		
		lcall	code_C2D4

code_C075:				
		ret
 

; ======================================================


code_C076:				
		lcall	code_C9B6
		clr	A
		mov	DPTR, #31Bh
		movx	@DPTR, A
		mov	R3, #1
		mov	R2, #3
		mov	R1, #13h
		mov	RAM_2E,	A
		mov	R5, #5
		lcall	code_C21A
		clr	A
		mov	DPTR, #319h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
 
; ---------------------------------------------------------------------------

code_C093:				
		lcall	code_C899
		mov	DPTR, #361h
		mov	A, #0Eh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #39h
		movx	@DPTR, A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	A
		mov	R7, A
		mov	R6, A
		lcall	code_A851
		ljmp	code_6D52
; ---------------------------------------------------------------------------

code_C0B0:				
		lcall	code_C899
		mov	DPTR, #361h
		mov	A, #0Eh
		movx	@DPTR, A
		inc	DPTR
		mov	A, #37h
		movx	@DPTR, A
		mov	DPTR, #1ACh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		clr	A
		mov	R7, A
		mov	R6, A
		lcall	code_A851
		ljmp	code_6D52

; ======================================================


code_C0CD:				
		mov	DPTR, #30Dh
		movx	A, @DPTR
		cjne	A, #1, code_C0DA
		lcall	code_A13F
		lcall	nullsub_10

code_C0DA:				
		mov	DPTR, #30Dh
		movx	A, @DPTR
		cjne	A, #2, code_C0E4
		lcall	code_CF2B

code_C0E4:				
		clr	A
		mov	DPTR, #30Dh
		movx	@DPTR, A
		ret
;  code_C0CD


; ======================================================


code_C0EA:				
		mov	DPTR, #2F2h
		movx	A, @DPTR
		cjne	A, #1, code_C0F7
		lcall	code_A13F
		lcall	nullsub_10

code_C0F7:				
		mov	DPTR, #2F2h
		movx	A, @DPTR
		cjne	A, #2, code_C101
		lcall	code_CF2B

code_C101:				
		clr	A
		mov	DPTR, #2F2h
		movx	@DPTR, A
		ret
;  code_C0EA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_CDAC

code_C107:				
		mov	DPTR, #399h
		movx	A, @DPTR
		xrl	A, R7
		jz	code_C123
		mov	A, R7
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		inc	DPTR
		movx	A, @DPTR
		mov	DPTR, #391h
		xch	A, R7
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_CD20
		lcall	code_CD2C

code_C123:				
		ret
;  CHUNK	FOR code_CDAC

; ======================================================


code_C124:				
		lcall	code_8B0C
		cjne	R7, #0FFh, code_C12E
		clr	A
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_C12E:				
		mov	A, R7
		add	A, ACC
		add	A, #0A2h
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_C124


; ======================================================


code_C140:				
		clr	P4.3
		mov	R7, #0C8h
		lcall	code_CD8E
		clr	P3.4
		mov	R7, #0Ah
		lcall	code_CD8E
		setb	P3.2
		mov	R7, #0Ah
		lcall	code_CD8E
		setb	P4.3
		mov	R7, #64h
		ljmp	code_CD8E
;  code_C140


; ======================================================


code_C15C:				
		mov	A, R7
		clr	C
		subb	A, #2
		jc	code_C165
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C165:				
		mov	DPTR, #13Ah
		movx	A, @DPTR
		cjne	A, RAM_7, code_C16F
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_C16F:				
		mov	DPTR, #13Ah
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret
;  code_C15C


; ======================================================


code_C178:				
		clr	A
		mov	DPTR, #26Bh
		movx	@DPTR, A

code_C17D:				
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	DPTR, #26Bh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #10h
		jc	code_C17D
		mov	R7, #0Dh
		ljmp	WhileSendR7_C882
;  code_C178


; ======================================================


code_C193:				
		mov	DPTR, #1BAh
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		orl	A, #0C0h
		mov	R5, A
		mov	A, R7
		mov	R2, #0
		cjne	A, RAM_5, code_C1AB
		mov	A, R2
		cjne	A, RAM_4, code_C1AB
		mov	R7, #1
		sjmp	code_C1AD
; ---------------------------------------------------------------------------

code_C1AB:				
		mov	R7, #0

code_C1AD:				
		ret
;  code_C193


; ======================================================


code_C1AE:				
		mov	DPTR, #98h
		movx	A, @DPTR
		mov	R6, A
		cjne	A, #2, code_C1B9
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_C1B9:				
		mov	A, R6
		xrl	A, #3
		jz	code_C1C1
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C1C1:				
		mov	R7, #2
		lcall	code_9D7A
		mov	R7, #1
		ret
;  code_C1AE


; ======================================================


code_C1C9:				
		lcall	code_C75A
		mov	RAM_24,	#0FFh
		mov	RAM_25,	#21h
		mov	RAM_26,	#0
		mov	RAM_27,	#0Eh
		mov	R3, #1
		mov	R2, #1
		mov	R1, #2Fh
		lcall	code_A9DC
		ljmp	code_B4AB
;  code_C1C9

; ---------------------------------------------------------------------------

code_C1E4:				
		mov	DPTR, #sram_13B
		movx	A, @DPTR
		cjne	A, RAM_6, code_C1F3
		inc	DPTR
		movx	A, @DPTR
		cjne	A, RAM_7, code_C1F3  	; if(==)
							; {
		mov	R7, #1
		ret					; }
; ---------------------------------------------------------------------------

code_C1F3:				
		mov	DPTR, #sram_13B
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_BC59
		ret

; ======================================================


code_C1FF:				
		mov	RAM_24,	#0FFh
		mov	RAM_25,	#22h
		mov	RAM_26,	#5
		mov	RAM_27,	#7
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0FCh
		lcall	code_A9DC
		clr	A
		mov	DPTR, #103h
		movx	@DPTR, A
		ret
;  code_C1FF


; ======================================================


code_C21A:				
		mov	A, R5
		setb	C
		subb	A, #0
		jc	code_C234
		mov	A, R5
		mov	R6, #0
		add	A, #0FFh
		mov	DPL, A
		mov	A, R6
		addc	A, #0FFh
		mov	DPH, A
		mov	A, RAM_2E
		lcall	code_10C8
		dec	R5
		sjmp	code_C21A
; ---------------------------------------------------------------------------

code_C234:				
		ret
;  code_C21A

; ---------------------------------------------------------------------------

code_C235:				
		mov	DPTR, #303h
		movx	A, @DPTR
		jz	code_C24F
		mov	DPTR, #2D3h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #64h
		jc	code_C24F
		clr	A
		movx	@DPTR, A
		lcall	code_C441
		lcall	code_2677

code_C24F:				
		ret

; ======================================================


code_C250:				
		mov	DPTR, #3A5h
		movx	A, @DPTR
		xrl	A, R6
		jnz	code_C25A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R7

code_C25A:				
		jz	code_C26A
		mov	DPTR, #3A5h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_CE2D
		lcall	code_BD8B

code_C26A:				
		ret
;  code_C250


; ======================================================


code_C26B:				
		mov	DPTR, #3A7h
		movx	A, @DPTR
		xrl	A, R6
		jnz	code_C275
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R7

code_C275:				
		jz	code_C285
		mov	DPTR, #3A7h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		lcall	code_CE2D
		lcall	code_BD8B

code_C285:				
		ret
;  code_C26B


; ======================================================


code_C286:				

; FUNCTION CHUNK AT 0000000E SIZE 00000015 BYTES
; FUNCTION CHUNK AT 0000AF84 SIZE 00000036 BYTES
; FUNCTION CHUNK AT 0000C851 SIZE 00000012 BYTES

		mov	DPTR, #351h
		mov	A, #2
		movx	@DPTR, A
		mov	DPTR, #351h
		movx	A, @DPTR
		cjne	A, #2, code_C29F
		lcall	code_2447
		mov	A, R7
		jz	code_C29C
		ljmp	code_E
; ---------------------------------------------------------------------------

code_C29C:				
		lcall	code_C646

code_C29F:				
		ret
;  code_C286

; ---------------------------------------------------------------------------

code_C2A0:				
		mov	DPTR, #361h
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #1Ch
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #20h
		mov	R1, #7Eh
		mov	DPTR, #3A4h
		movx	A, @DPTR
		lcall	code_BCBF
		ljmp	code_A449
; ---------------------------------------------------------------------------

code_C2BA:				
		mov	DPTR, #361h
		mov	A, #5Ch
		movx	@DPTR, A
		inc	DPTR
		mov	A, #6Dh
		movx	@DPTR, A
		mov	DPTR, #3A5h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		mov	R5, #1
		lcall	code_A851
		ljmp	code_6D52

; ======================================================


code_C2D4:				
		mov	DPTR, #353h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_C2E6
		dec	A
		jz	code_C2E9
		add	A, #2
		jnz	code_C2EC
		ljmp	code_BE91
; ---------------------------------------------------------------------------

code_C2E6:				
		ljmp	code_CB92
; ---------------------------------------------------------------------------

code_C2E9:				
		lcall	USART_BAB1

code_C2EC:				
		ret
;  


; ======================================================


code_C2ED:				

; FUNCTION CHUNK AT 0000CF1D SIZE 0000000A BYTES

		mov	DPTR, #353h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_C2FF
		dec	A
		jz	code_C302
		add	A, #2
		jnz	code_C305
		ljmp	code_CF1D
; ---------------------------------------------------------------------------

code_C2FF:				
		ljmp	code_CF22
; ---------------------------------------------------------------------------

code_C302:				
		lcall	code_CF18

code_C305:				
		ret
;  code_C2ED

; ---------------------------------------------------------------------------
 
code_C306:				
		mov	R7, #1Bh
		lcall	WhileSendR7_C882
		mov	R7, #40h
		lcall	WhileSendR7_C882
		mov	R7, #1Ch
		lcall	WhileSendR7_C882
		mov	R7, #69h
		lcall	WhileSendR7_C882
		mov	R7, #3
		ljmp	WhileSendR7_C882
 
; ======================================================


code_C31F:				
		mov	DPTR, #0F8h
		movx	A, @DPTR
		mov	DPTR, #0F2h
		jz	code_C330
		movx	A, @DPTR
		anl	A, #0BFh
		movx	@DPTR, A
		orl	A, #80h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_C330:				
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		anl	A, #7Fh
		movx	@DPTR, A
		ret
;  code_C31F


; ======================================================


code_C338:				
		mov	DPTR, #2D4h
		mov	A, #1
		movx	@DPTR, A
		mov	DPTR, #2DAh
		movx	A, @DPTR
		dec	A
		mov	DPTR, #2E7h
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ljmp	code_944A


; ======================================================


code_C351:				

		lcall	code_3297
		lcall	code_C4A1
		lcall	code_5EE8
		lcall	code_81F9
		lcall	code_9500
		lcall	code_4D70
		lcall	code_C4A1
		ljmp	code_3EC0
;  code_C351


; ======================================================


delay_C369:				
		mov	R5, RAM_7
		mov	R4, RAM_6

code_C36D:				
		setb	C
		mov	A, R5
		subb	A, #0
		mov	A, R4
		subb	A, #0
		jc	code_C380
		lcall	code_CBE6
		mov	A, R5
		dec	R5
		jnz	code_C36D
		dec	R4
		sjmp	code_C36D
; ---------------------------------------------------------------------------

code_C380:				
		ret



; ======================================================


code_C381:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #0A2h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #38h
		lcall	code_C21A
		clr	A
		mov	DPTR, #0F4h
		movx	@DPTR, A
		mov	DPTR, #0B2h
		movx	@DPTR, A
		ret
;  code_C381


; ======================================================


code_C399:				
		mov	R3, #1
		mov	R2, #1
		mov	R1, #0DDh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #0Eh
		lcall	code_C21A
		clr	A
		mov	DPTR, #0FAh
		movx	@DPTR, A
		mov	DPTR, #0F3h
		movx	@DPTR, A
		ret
;  code_C399


; ======================================================


code_C3B1:				
		mov	DPTR, #1EBh
		mov	A, #0FFh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #166h
		movx	@DPTR, A
		mov	DPTR, #0AFh
		movx	@DPTR, A
		mov	DPTR, #165h
		movx	@DPTR, A
		mov	DPTR, #0AEh
		movx	@DPTR, A
		ret
;  code_C3B1


; ======================================================


code_C3C9:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #86h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #7
		lcall	code_C21A
		clr	A
		mov	DPTR, #105h
		movx	@DPTR, A
		mov	DPTR, #1DCh
		movx	@DPTR, A
		ret
;  code_C3C9


; ======================================================


code_C3E1:				
		setb	C
		mov	DPTR, #8Ch
		movx	A, @DPTR
		subb	A, #0
		mov	DPTR, #8Bh
		movx	A, @DPTR
		xrl	A, #80h
		subb	A, #80h
		jc	code_C3F6
	;	mov	R7, #1
		mov	R7, #1     			; E7
		sjmp	code_C3F8
; ---------------------------------------------------------------------------

code_C3F6:				
	
	     	mov	R7, #1
code_C3F8:				
		ret
;  code_C3E1


; ======================================================


code_C3F9:				
		mov	RAM_1B,	R3
		mov	RAM_1C,	R2
		mov	RAM_1D,	R1
		mov	RAM_24,	R3
		mov	RAM_25,	R2
		mov	RAM_26,	R1
		mov	RAM_27,	#6
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		ljmp	code_A9DC
;  code_C3F9


; ======================================================


code_C411:				
		mov	RAM_1B,	R3
		mov	RAM_1C,	R2
		mov	RAM_1D,	R1
		mov	RAM_24,	R3
		mov	RAM_25,	R2
		mov	RAM_26,	R1
		mov	RAM_27,	#3
		mov	R3, RAM_1E
		mov	R2, RAM_1F
		mov	R1, RAM_20
		ljmp	code_A9DC
;  code_C411


; ======================================================


code_C429:				
		mov	RAM_9, R3
		mov	RAM_A, R2
		mov	RAM_B, R1
		mov	RAM_24,	R3
		mov	RAM_25,	R2
		mov	RAM_26,	R1
		mov	RAM_27,	#3
		mov	R3, RAM_C
		mov	R2, RAM_D
		mov	R1, RAM_E
		ljmp	code_A9DC
;  code_C429


; ======================================================


code_C441:				
		mov	R7, #80h
		lcall	code_B8F3
		lcall	code_CA2D
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		mov	DPTR, #3A1h
		movx	A, @DPTR
		xrl	A, R7
		jz	code_C458
		lcall	code_8B77

code_C458:				
		ret
;  code_C441


; ======================================================


SM1_SM0_C459:				
		mov	DPTR, #NineBits
		mov	A, R7
		movx	@DPTR, A
		cjne	R7, #8,code_C465
		clr	SCON.7
		setb	SCON.6

code_C465:				
		mov	DPTR, #NineBits
		movx	A, @DPTR
		cjne	A, #9, code_C470
		setb	SCON.7
		setb	SCON.6

code_C470:				
		ret
 

; ---------------------------------------------------------------------------
;
;
;
;
USART_Send_C471:				
		mov	DPTR, #NineBits
		movx	A, @DPTR
		cjne	A, #9, code_C481
		mov	A, R5
		jz	code_C47E
		setb	C
		sjmp	code_C47F
; ---------------------------------------------------------------------------
code_C47E:				
		clr	C
code_C47F:				
		mov	SCON.3, C

code_C481:				
		mov	SBUF, R7

code_C483:				
		jnb	TI, code_C483
		clr	TI
		ret

; ======================================================


UserInput_ToR6R7_C489:				
		mov	DPTR, #306h
		movx	A, @DPTR
		mov	R7, A
		add	A, #61h
		mov	R1, A
		clr	A
		addc	A, #3
		mov	R2, A
		mov	R3, #1
		inc	DPTR
		movx	A, @DPTR
		clr	C
		subb	A, R7
		inc	A
		mov	R5, A
		lcall	code_5085

		ret
 


; ======================================================


code_C4A1:				
		clr	A
		mov	DPTR, #26Ah
		movx	@DPTR, A

code_C4A6:				
		mov	R7, #2Dh
		lcall	WhileSendR7_C882
		mov	DPTR, #26Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #5Ah
		jc	code_C4A6
		ret
;  code_C4A1


; ======================================================


code_C4B8:				
		mov	R7, #1
		lcall	SM2_CC0D
		clr	P1.5
		nop
		nop
		nop
		nop
		nop
		clr	A
		mov	DPTR, #319h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		inc	A
		movx	@DPTR, A
		ret
;  code_C4B8


; ======================================================


code_C4CF:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #3
		jz	code_C4DB
		clr	A
		mov	R6, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_C4DB:				
		mov	DPTR, #167h
		movx	A, @DPTR
		add	A, #1
		mov	R7, A
		clr	A
		rlc	A
		mov	R6, A
		ret
;  code_C4CF


; ======================================================


code_C4E6:				
		mov	RAM_11,	R4
		mov	RAM_12,	R5
		lcall	code_8B0C
		cjne	R7, #0FFh, code_C4F3
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C4F3:				
		mov	R6, #0
		mov	R5, RAM_12
		mov	R4, RAM_11
		lcall	code_5AA7
		ret
;  code_C4E6


; ======================================================


code_C4FD:				
		mov	A, R7
		clr	C
		subb	A, #5
		jnc	code_C513
		mov	A, R7
		add	A, ACC
		add	A, ACC
		add	A, #7Dh
		mov	DPL, A
		clr	A
		addc	A, #3
		mov	DPH, A
		clr	A
		movx	@DPTR, A

code_C513:				
		ret
;  code_C4FD

; ---------------------------------------------------------------------------
;
;
;
main_C514:		

		clr	EA
		
		mov	R7, #0D0h
		mov	R6, #7
		lcall	delay_C369
		
		lcall	INIT_A067

code_C520:				
		mov	CCEN, #36h
		
		lcall	code_468A
	;	LJMP	MY_main
		
		lcall	code_CF32
		
		sjmp	code_C520


; ======================================================


code_C52B:				
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		mov	R7, A
		lcall	R3R2R1_GetACC_103D
		mov	R6, A
		mov	A, R7
		clr	C
		subb	A, R6
		jc	code_C53F
		mov	R7, #1
		sjmp	code_C541
; ---------------------------------------------------------------------------

code_C53F:				
		mov	R7, #0

code_C541:				
		ret
;  code_C52B


; ======================================================


code_C542:				
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		clr	C
		mov	DPTR, #12Eh
		movx	A, @DPTR
		subb	A, R7
		mov	R7, A
		mov	DPTR, #12Dh
		movx	A, @DPTR
		subb	A, R6
		mov	R6, A
		ret
;  code_C542


; ======================================================


code_C558:				
		jb	P3.2, code_C567
		jb	P3.2, code_C567
		jb	P3.2, code_C567
		jb	P3.2, code_C567
		jnb	P3.2, code_C56B

code_C567:				
		mov	R7, #1
		sjmp	code_C56D
; ---------------------------------------------------------------------------

code_C56B:				
		mov	R7, #0

code_C56D:				
		ret
;  code_C558


; ======================================================


code_C56E:				
		clr	A
		mov	DPTR, #28h
		movx	@DPTR, A
		mov	DPTR, #0F2h
		movx	@DPTR, A
		mov	DPTR, #0B0h
		movx	@DPTR, A
		mov	DPTR, #0A1h
		movx	@DPTR, A
		mov	DPTR, #0B3h
		movx	@DPTR, A
		ret
;  code_C56E


; ======================================================


code_C584:				
		mov	DPTR, #106h
		mov	A, #0FFh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #1A1h
		movx	@DPTR, A
		mov	DPTR, #0F5h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0A3h
		movx	@DPTR, A
		ret
;  code_C584


; ======================================================


code_C59A:				
		lcall	code_C76D
		mov	DPTR, #103h
		movx	A, @DPTR
		mov	R7, A
		setb	C
		subb	A, #0
		jc	code_C5AD
		mov	A, R7
		dec	A
		mov	R7, A
		lcall	code_B359

code_C5AD:				
		ljmp	code_B4DB
;  code_C59A

; ---------------------------------------------------------------------------

code_C5B0:				
		mov	DPTR, #136h
		movx	A, @DPTR
		jz	code_C5BD
		clr	A
		mov	DPTR, #30Eh
		movx	@DPTR, A
		sjmp	code_C5C3
; ---------------------------------------------------------------------------

code_C5BD:				
		mov	DPTR, #30Eh
		mov	A, #1
		movx	@DPTR, A

code_C5C3:				
		ljmp	code_4543
; ---------------------------------------------------------------------------

code_C5C6:				
		mov	DPTR, #361h
		mov	A, #39h
		movx	@DPTR, A
		inc	DPTR
		dec	A
		movx	@DPTR, A
		mov	R3, #0FFh
		mov	R2, #20h
		mov	R1, #78h
		clr	A
		lcall	code_BCBF
		ljmp	code_A449

; ======================================================


code_C5DC:				
		mov	DPTR, #3A4h
		movx	A, @DPTR
		xrl	A, #1
		jz	code_C5F1
		mov	DPTR, #3A4h
		mov	A, #1
		movx	@DPTR, A
		clr	A
		lcall	code_CE27
		lcall	code_BD8B

code_C5F1:				
		ret
;  code_C5DC

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_7E79

code_C5F2:				
		setb	P1.5
		nop
		nop
		nop
		nop
		nop
		mov	DPTR, #31Bh
		mov	A, #3
		movx	@DPTR, A
		clr	A
		mov	DPTR, #319h
		movx	@DPTR, A
		ljmp	code_9C42
;  CHUNK	FOR code_7E79

; ======================================================


code_C607:				
		mov	DPTR, #315h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #274h
		movx	@DPTR, A
		mov	DPTR, #316h
		movx	A, @DPTR
		mov	DPTR, #315h
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_C607

; ---------------------------------------------------------------------------

code_C61C:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #2, code_C630
		mov	DPTR, #1CCh
		movx	A, @DPTR
		jnz	code_C62B
		inc	DPTR
		movx	A, @DPTR

code_C62B:				
		jz	code_C630
		lcall	code_A7A3

code_C630:				
		ret

; ======================================================


code_C631:				
		mov	DPTR, #30Fh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #0Dh
		jnc	code_C643
		lcall	code_65F5
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_C643:				
		mov	R7, #0
		ret
;  code_C631


; ======================================================


code_C646:				
		clr	P1.5
		nop
		nop
		nop
		nop
		nop
		clr	A
		mov	DPTR, #34Eh
		movx	@DPTR, A
		mov	DPTR, #350h
		movx	@DPTR, A
		inc	DPTR
		inc	A
		movx	@DPTR, A
		ret
;  code_C646


; ======================================================


code_C65A:				
		mov	A, R7
		xrl	A, #3
		jz	code_C667
		mov	A, R7
		xrl	A, #6
		jz	code_C667
		cjne	R7, #10h, code_C66B

code_C667:				
		mov	R7, #1
		sjmp	code_C66D
; ---------------------------------------------------------------------------

code_C66B:				
		mov	R7, #0

code_C66D:				
		ret
;  code_C65A


; ======================================================


code_C66E:				
		mov	R7, #1
		lcall	USART_P30P31_P10P11_CB1A
		mov	R7, #2
		lcall	BaudRate_B964
		mov	R7, #9
		lcall	SM1_SM0_C459
		mov	R7, #1
		ljmp	IE4_CB29
;  code_C66E


; ======================================================


code_C682:				
		mov	DPTR, #31Bh
		mov	A, #2
		movx	@DPTR, A
		lcall	code_2CDC
		mov	DPTR, #26Fh
		mov	A, R7
		movx	@DPTR, A
		clr	A
		mov	DPTR, #31Bh
		movx	@DPTR, A
		ret
;  code_C682


; ======================================================


code_C696:				

; FUNCTION CHUNK AT 00008A32 SIZE 0000006E BYTES

		mov	R6, RAM_5
		mov	R5, RAM_7
		mov	R7, RAM_6
		clr	A
		mov	RAM_3A,	R7
		mov	RAM_39,	A
		mov	RAM_38,	A
		mov	RAM_37,	A
		mov	R7, #2
		ljmp	code_8A32
;  


; ======================================================


code_C6AA:				
		mov	DPTR, #1C6h
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		add	A, #5Dh
		mov	DPL, A
		mov	A, #6Fh
		addc	A, R6
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		mov	R7, A
		ret
;  code_C6AA

; ---------------------------------------------------------------------------

code_C6BE:				
		clr	A
		cjne	A, RAM_7, code_C6D1
		mov	A, R6
		cjne	A, #82h, code_C6D1
		lcall	R3R2R1_GetACC_103D
		clr	C
		subb	A, #0Ah
		jc	code_C6D1
		lcall	code_B0FB

code_C6D1:				
		ret

; ======================================================


code_C6D2:				
		mov	DPTR, #361h
		mov	A, #73h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #6
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_C6D2

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_9C90

code_C6E6:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #0A4h
		clr	A
		mov	RAM_2E,	A
		mov	R5, #7
		lcall	code_C21A
		clr	A
		mov	DPTR, #3ABh
		movx	@DPTR, A
		ret
;  CHUNK	FOR code_9C90

; ======================================================


code_C6FA:				
		mov	R3, #1
		mov	R2, #3
		mov	R1, #0A4h
		mov	R5, #5
		lcall	CRC16_R5TIME_9BA3
		mov	DPTR, #3A9h
		mov	A, R6
		movx	@DPTR, A
		inc	DPTR
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_C6FA


; ======================================================


code_C70E:				
		mov	DPTR, #98h
		movx	A, @DPTR
		xrl	A, #4
		jz	code_C719
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C719:				
		mov	R7, #2
		lcall	code_9D7A
		mov	R7, #1
		ret
;  code_C70E


; ======================================================


code_C721:				
		mov	DPTR, #0F4h
		movx	A, @DPTR
		cjne	A, #0FFh, code_C72B
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C72B:				
		mov	DPTR, #0F4h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #1
		ret
;  code_C721


; ======================================================


code_C734:				
		mov	DPTR, #2Eh
		movx	A, @DPTR
		cjne	A, #0FFh, code_C73E
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C73E:				
		mov	DPTR, #2Eh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #1
		ret
;  code_C734


; ======================================================


code_C747:				
		mov	DPTR, #0ACh
		movx	A, @DPTR
		cjne	A, #0FFh, code_C751
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C751:				
		mov	DPTR, #0ACh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #1
		ret
;  code_C747


; ======================================================


code_C75A:				
		mov	DPTR, #0A6h
		movx	A, @DPTR
		cjne	A, #0FFh, code_C764
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C764:				
		mov	DPTR, #0A6h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #1
		ret
;  code_C75A


; ======================================================


code_C76D:				
		mov	DPTR, #91h
		movx	A, @DPTR
		cjne	A, #0FFh, code_C777
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C777:				
		mov	DPTR, #91h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #1
		ret
;  code_C76D


; ======================================================


code_C780:				
		lcall	R3R2R1_GetACC_103D
		mov	R7, A
		xrl	A, #2
		jz	code_C790
		mov	A, R7
		xrl	A, #3
		jz	code_C790
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_C790:				
		mov	R7, #1
		ret
;  code_C780

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_CE27

code_C793:				
		lcall	code_BE71
		mov	A, R7
		mov	DPTR, #29h
		jz	code_C7A1
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_C7A1:				
		movx	A, @DPTR
		anl	A, #0BFh
		movx	@DPTR, A
		ret
;  CHUNK	FOR code_CE27

; ======================================================


code_C7A6:				
		mov	DPTR, #NineBits
		movx	A, @DPTR
		cjne	A, #9, code_C7B6
		mov	A, R5
		jz	code_C7B3
		setb	C
		sjmp	code_C7B4
; ---------------------------------------------------------------------------

code_C7B3:				
		clr	C

code_C7B4:				
		mov	SCON.3, C

code_C7B6:				
		mov	SBUF, R7
		ret
;  code_C7A6


; ======================================================


code_C7B9:				

; FUNCTION CHUNK AT 0000CF41 SIZE 00000003 BYTES

		mov	DPTR, #2D0h
		movx	A, @DPTR
		add	A, #0DBh
		jz	code_C7C8
		add	A, #20h
		jnz	code_C7CB
		ljmp	code_CF41
; ---------------------------------------------------------------------------

code_C7C8:				
		lcall	nullsub_6

code_C7CB:				
		ret
;  code_C7B9


; ======================================================


code_C7CC:				

; FUNCTION CHUNK AT 0000B647 SIZE 0000002B BYTES
; FUNCTION CHUNK AT 0000CF44 SIZE 00000003 BYTES

		mov	DPTR, #2D0h
		movx	A, @DPTR
		add	A, #0DBh
		jz	code_C7DB
		add	A, #20h
		jnz	code_C7DE
		ljmp	code_CF44
; ---------------------------------------------------------------------------

code_C7DB:				
		lcall	nullsub_7

code_C7DE:				
		ret
;  code_C7CC


; ======================================================


code_C7DF:				
		mov	DPTR, #2F6h
		movx	A, @DPTR
		mov	R7, A
		xrl	A, #3
		jz	code_C7EC
		mov	A, R7
		cjne	A, #4, code_C7F1

code_C7EC:				
		clr	A
		mov	R7, A
		lcall	code_75EB

code_C7F1:				
		ret
;  code_C7DF


; ======================================================


code_C7F2:				
		mov	DPTR, #363h
		mov	A, #73h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #50h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #54h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #78h
		movx	@DPTR, A
		ret
;  code_C7F2

; ---------------------------------------------------------------------------

code_C805:				
		clr	A
		cjne	A, RAM_7, code_C817
		mov	A, R6
		cjne	A, #2, code_C817
		lcall	R3R2R1_GetACC_103D
		jnz	code_C817
		mov	R7, #5
		lcall	code_BBAC

code_C817:				
		ret

; ======================================================


code_C818:				
		clr	A
		cjne	A, RAM_7, code_C82A
		mov	A, R6
		cjne	A, #2, code_C82A
		lcall	R3R2R1_GetACC_103D
		jnz	code_C82A
		mov	R7, #5
		lcall	code_BBAC

code_C82A:				
		ret
;  code_C818


; ======================================================


code_C82B:				
		clr	A
		mov	DPTR, #39Ah
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #391h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		lcall	code_CD20
		ljmp	code_CD2C
;  code_C82B


; ======================================================


code_C83E:				
		mov	DPTR, #3A4h
		mov	A, #1
		movx	@DPTR, A
		inc	DPTR
		clr	A
		movx	@DPTR, A
		inc	DPTR
		mov	A, #32h
		movx	@DPTR, A
		clr	A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_C83E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C286

code_C851:				
		mov	DPTR, #353h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_C85F
		inc	A
		jnz	code_C862
		ljmp	code_AF84
; ---------------------------------------------------------------------------

code_C85F:				
		lcall	code_9C42

code_C862:				
		ret
;  CHUNK	FOR code_C286

; ======================================================


code_C863:				

; FUNCTION CHUNK AT 0000B93F SIZE 00000025 BYTES

		mov	DPTR, #353h
		movx	A, @DPTR
		add	A, #0FEh
		jz	code_C871
		inc	A
		jnz	code_C874
		ljmp	code_B93F
; ---------------------------------------------------------------------------

code_C871:				
		lcall	code_BB89

code_C874:				
		ret
;  code_C863


; ======================================================


code_C875:				
		mov	DPTR, #19Bh
;  code_C875


; ======================================================


code_C878:				
		movx	A, @DPTR
		mov	B, #0Ah
		div	AB
		mov	A, B
		add	A, #30h
		mov	R7, A
;  code_C878


; ======================================================


WhileSendR7_C882:				


		clr	A
		mov	R5, A
		ljmp	USART_Send_C471
 

; ======================================================


code_C887:				
		mov	A, R7
		add	A, ACC
		add	A, #3Ch
		mov	DPL, A
		clr	A
		addc	A, #1
		mov	DPH, A
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_C887


; ======================================================


code_C899:				
		mov	DPTR, #90h
		movx	A, @DPTR
		clr	C
		subb	A, #0FFh
		jnc	code_C8A8
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_C8A8:				
		mov	R7, #0
		ret
;  code_C899

; ---------------------------------------------------------------------------

code_C8AB:				
		mov	DPTR, #90h
		movx	A, @DPTR
		setb	C
		subb	A, #0
		jc	code_C8BA
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------

code_C8BA:				
		mov	R7, #0
		ret

; ======================================================


code_C8BD:				
		mov	DPTR, #98h
		movx	A, @DPTR
		cjne	A, #3, code_C8CC
		mov	DPTR, #168h
		mov	A, #1
		movx	@DPTR, A
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_C8CC:				
		mov	R7, #0
		ret
;  code_C8BD


; ======================================================


code_C8CF:				
		mov	DPTR, #1DCh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		setb	C
		subb	A, #32h
		jc	code_C8E0
		clr	A
		movx	@DPTR, A
		lcall	code_7546

code_C8E0:				
		ret
;  code_C8CF


; ======================================================


code_C8E1:				
		mov	DPTR, #27h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #64h
		jc	code_C8F2
		clr	A
		movx	@DPTR, A
		lcall	code_CDA2

code_C8F2:				
		ret
;  code_C8E1


; ======================================================


code_C8F3:				
		mov	A, R7
		setb	C
		subb	A, #9
		jc	code_C904
		mov	A, R7
		mov	B, #0Ah
		div	AB
		mov	B, #6
		mul	AB
		add	A, R7
		mov	R7, A

code_C904:				
		ret
;  code_C8F3

; ---------------------------------------------------------------------------

code_C905:				
		mov	DPTR, #2F4h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #64h
		jc	code_C916
		clr	A
		movx	@DPTR, A
		lcall	code_B9AE

code_C916:				
		ret
; ---------------------------------------------------------------------------

code_C917:				
		clr	A
		mov	DPTR, #361h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	R5, A
		mov	R7, #0B3h
		mov	R6, #15h
		lcall	code_A851
		ljmp	code_6D52
; ---------------------------------------------------------------------------

code_C929:				
		clr	A
		mov	DPTR, #361h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	R5, A
		mov	R7, #0B3h
		mov	R6, #15h
		lcall	code_A851
		ljmp	code_6D52
; ---------------------------------------------------------------------------

code_C93B:				
		clr	A
		mov	DPTR, #2CFh
		movx	@DPTR, A
		mov	DPTR, #2F2h
		movx	@DPTR, A
		lcall	code_C747
		lcall	code_C721
		ljmp	code_CE48
; ---------------------------------------------------------------------------

code_C94D:				
		mov	DPTR, #2FCh
		mov	A, #0FFh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #2D2h
		movx	@DPTR, A
		mov	DPTR, #2F5h
		movx	@DPTR, A
		ljmp	code_CE50

; ======================================================


code_C95F:				
		mov	DPTR, #2F1h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		movx	A, @DPTR
		clr	C
		subb	A, #0FAh
		jc	code_C970
		clr	A
		movx	@DPTR, A
		lcall	code_BB41

code_C970:				
		ret
;  code_C95F


; ======================================================


code_C971:				
		mov	DPTR, #3A4h
		movx	A, @DPTR
		jz	code_C982
		clr	A
		mov	DPTR, #3A4h
		movx	@DPTR, A
		lcall	code_CE27
		lcall	code_BD8B

code_C982:				
		ret
 
; ---------------------------------------------------------------------------
;
;
;
Send_C983:				
		mov	DPTR, #318h
		movx	A, @DPTR
		dec	A
		jz	code_C990		; if(==1)
		inc	A
		jnz	code_C993		; else if(==0)
		ljmp	code_C306
; ---------------------------------------------------------------------------

code_C990:				
		lcall	nullsub_1

code_C993:				
		ret
 
; ======================================================


code_C994:				

; FUNCTION CHUNK AT 00007172 SIZE 000000A8 BYTES

		mov	DPTR, #318h
		movx	A, @DPTR
		dec	A
		jz	code_C9A1
		inc	A
		jnz	code_C9A4
		ljmp	code_7172
; ---------------------------------------------------------------------------

code_C9A1:				
		lcall	code_B5F1

code_C9A4:				
		ret
;  code_C994


; ======================================================


code_C9A5:				

; FUNCTION CHUNK AT 000042AD SIZE 0000014B BYTES

		mov	DPTR, #318h
		movx	A, @DPTR
		dec	A
		jz	code_C9B2
		inc	A
		jnz	code_C9B5
		ljmp	code_42AD
; ---------------------------------------------------------------------------

code_C9B2:				
		lcall	code_C351

code_C9B5:				
		ret
;  code_C9A5


; ======================================================


code_C9B6:				
		mov	DPTR, #sram_13B
		CLR	A
		mov	R4, A
		inc	DPTR
		CLR	A
		mov	R5, A

	;	mov	DPTR, #sram_13B
	;	movx	A, @DPTR
	;	mov	R4, A
	;	inc	DPTR		 		; 原版
	;	movx	A, @DPTR
	;	mov	R5, A

		mov	A, R4
		mov	R7, A
		mov	A, R5
		add	A, R7
		mov	DPTR, #352h
		movx	@DPTR, A
		ret
;  


; ======================================================


code_C9C7:				
		lcall	code_A863
		mov	DPTR, #317h
		movx	A, @DPTR
		cjne	A, RAM_7, code_C9D5
		mov	R7, #1
		sjmp	code_C9D7
; ---------------------------------------------------------------------------

code_C9D5:				
		mov	R7, #0

code_C9D7:				
		ret
;  code_C9C7

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_921C

code_C9D8:				
		mov	A, R6
		rlc	A
		subb	A, ACC
		mov	RAM_34,	R7
		mov	RAM_33,	R6
		mov	RAM_32,	A
		mov	RAM_31,	A
		mov	R7, #4
		ljmp	code_89C4
;  CHUNK	FOR code_921C

; ======================================================


code_C9E9:				
		mov	DPTR, #0ADh
		movx	A, @DPTR
		mov	DPTR, #0A4h
		movx	@DPTR, A
		mov	DPTR, #2Dh
		movx	A, @DPTR
		mov	DPTR, #0ADh
		movx	@DPTR, A
		ret
;  code_C9E9

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_B41B

code_C9FA:				
		lcall	code_94A6
		mov	DPTR, #0F2h
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #28h
		movx	A, @DPTR
		orl	A, R7
		mov	R7, A
		ljmp	code_B50B
;  CHUNK	FOR code_B41B

; ======================================================


code_CA0B:				
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jz	code_CA1B
		mov	DPTR, #1B6h
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CC9C

code_CA1B:				
		ret
;  code_CA0B


; ======================================================


code_CA1C:				
		mov	DPTR, #0A2h
		movx	A, @DPTR
		jz	code_CA2C
		mov	DPTR, #1B8h
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		lcall	code_CCA8

code_CA2C:				
		ret
;  code_CA1C


; ======================================================


code_CA2D:				
		mov	A, R7
		anl	A, #0F0h
		swap	A
		anl	A, #0Fh
		mov	B, #0Ah
		mul	AB
		mov	R6, A
		mov	A, R7
		anl	A, #0Fh
		add	A, R6
		mov	R7, A
		ret
;  code_CA2D


; ======================================================


code_CA3E:				
		lcall	code_C140
		clr	A
		mov	DPTR, #35Ch
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	R5, #1
		mov	R7, A
		mov	R6, A
		ljmp	code_C9D8
;  code_CA3E


; ======================================================


code_CA4F:				
		setb	C
		mov	A, R5
		subb	A, #0Fh
		mov	A, R4
		subb	A, #27h
		jc	code_CA5B
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_CA5B:				
		lcall	code_7AAA
		ret
;  code_CA4F


; ======================================================


code_CA5F:				
		setb	C
		mov	A, R5
		subb	A, #0Fh
		mov	A, R4
		subb	A, #27h
		jc	code_CA6B
		mov	R7, #0
		ret
; ---------------------------------------------------------------------------

code_CA6B:				
		lcall	code_7015
		ret
;  code_CA5F


; ======================================================


code_CA6F:				
		mov	R5, RAM_7
		clr	A
		mov	RAM_34,	A
		mov	RAM_33,	A
		mov	RAM_32,	A
		mov	RAM_31,	A
		mov	R7, #5
		ljmp	code_89C4
;  code_CA6F


; ======================================================


code_CA7F:				

; FUNCTION CHUNK AT 00009F8B SIZE 0000004A BYTES

		mov	R3, #1
		mov	R2, #1
		mov	R1, #7
		mov	DPTR, #1C4h
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R5, A
		ljmp	code_9F8B
;  code_CA7F


; ======================================================


IO_Init_CA8F:				
		mov	P2, #0FFh
		setb	P0.6
		setb	P0.7
		setb	P4.6
		setb	P4.1
		setb	P4.5
		setb	P4.4
		ret
 

; ======================================================


code_CA9F:				
		mov	A, R7
		setb	C
		subb	A, #0Fh
		jnc	code_CAAC
		mov	A, R7
		mov	DPTR, #0CAAFh
		movc	A, @A+DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------

code_CAAC:				
		mov	R7, #0
		ret
;  code_CA9F

; ---------------------------------------------------------------------------
		db  3Fh
		db    6
		db  5Bh
		db  4Fh
		db  66h
		db  6Dh
		db  7Dh
		db    7
		db  7Fh
		db  6Fh
		db  77h
		db  7Ch
		db  58h
		db  5Eh
		db  79h
		db  71h

; ======================================================


code_CABF:				
		mov	DPTR, #301h
		movx	A, @DPTR
		mov	DPTR, #2FEh
		movx	@DPTR, A
		mov	DPTR, #301h
		mov	A, R7
		movx	@DPTR, A
		ljmp	code_2677
;  code_CABF


; ======================================================


code_CACF:				
		clr	A
		mov	RAM_34,	A
		mov	RAM_33,	A
		mov	RAM_32,	A
		mov	RAM_31,	A
		mov	R5, A
		mov	R7, #1
		ljmp	code_89C4
;  code_CACF


; ======================================================


code_CADE:				
		clr	A
		mov	RAM_3A,	A
		mov	RAM_39,	A
		mov	RAM_38,	A
		mov	RAM_37,	A
		mov	R5, A
		mov	R7, #3
		ljmp	code_8A32
;  code_CADE


; ======================================================


code_CAED:				
		clr	A
		mov	RAM_34,	R7
		mov	RAM_33,	R6
		mov	RAM_32,	A
		mov	RAM_31,	A
		mov	R5, A
		mov	R7, #6
		ljmp	code_89C4
;  code_CAED


; ======================================================


code_CAFC:				
		clr	A
		mov	RAM_34,	R7
		mov	RAM_33,	R6
		mov	RAM_32,	A
		mov	RAM_31,	A
		mov	R5, A
		mov	R7, #7
		ljmp	code_89C4
;  code_CAFC


; ======================================================


IAP_IDLE_CB0B:				
		clr	A
		mov	IAP_CONTR, A
		mov	IAP_CMD, A
		mov	IAP_TRIG, A
		mov	IAP_ADDRH, #80h
		mov	IAP_ADDRL, A
		mov	IAP_DATA, A
		ret
 


; ======================================================


USART_P30P31_P10P11_CB1A:				
		mov	DPTR, #375h
		mov	A, R7
		movx	@DPTR, A
		jnz	code_CB25
		anl	RESERVED00A2, #7Fh
		ret
; ---------------------------------------------------------------------------

code_CB25:				
		orl	RESERVED00A2, #80h
		ret
;  USART_P30P31_P10P11_CB1A


; ======================================================


IE4_CB29:				
		mov	DPTR, #35Fh
		mov	A, R7
		movx	@DPTR, A
		jz	code_CB35
		setb	IE.4
		setb	IEN1.4
		ret
; ---------------------------------------------------------------------------

code_CB35:				
		clr	IE.4
		ret
;  IE4_CB29

; ---------------------------------------------------------------------------

code_CB38:				
		lcall	code_C7DF
		mov	DPTR, #2F6h
		mov	A, #1
		movx	@DPTR, A
		lcall	code_A2EB
		mov	R7, #1
		ret
; ---------------------------------------------------------------------------
		lcall	code_CDC4
		mov	A, R7
		jz	code_CB53
		lcall	code_A13F
		lcall	nullsub_10

code_CB53:				
		ljmp	code_C8AB
; ---------------------------------------------------------------------------
		lcall	code_CDC4
		mov	A, R7
		jz	code_CB62
		lcall	code_A13F
		lcall	nullsub_10

code_CB62:				
		ljmp	code_C8AB
; ---------------------------------------------------------------------------

code_CB65:				
		clr	A
		mov	DPTR, #302h
		movx	@DPTR, A
		mov	DPTR, #30Dh
		movx	@DPTR, A
		lcall	code_C721
		ljmp	code_B026
; ---------------------------------------------------------------------------
		lcall	code_CEDC
		mov	A, R7
		jz	code_CB80
		lcall	code_B292
		lcall	code_CF2E

code_CB80:				
		ljmp	code_C8AB

; ======================================================


code_CB83:				
		mov	DPTR, #5
		lcall	R3R2R1_GetACC_1056
		jnz	code_CB8F
		mov	R7, #1
		sjmp	code_CB91
; ---------------------------------------------------------------------------

code_CB8F:				
		mov	R7, #0

code_CB91:				
		ret
;  code_CB83

; ---------------------------------------------------------------------------
 
code_CB92:				
		lcall	code_C076
		lcall	code_C66E
		mov	R7, #1
		lcall	REN_CC00
		ljmp	code_C4B8
;  CHUNK	FOR 

; ======================================================


code_CBA0:				
		clr	A
		mov	DPTR, #2Dh
		movx	@DPTR, A
		mov	DPTR, #0ADh
		movx	@DPTR, A
		mov	DPTR, #0A4h
		movx	@DPTR, A
		ret
;  code_CBA0


; ======================================================


code_CBAE:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #5Fh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #26h
		ljmp	code_C21A
;  code_CBAE


; ======================================================


code_CBBC:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #5Fh
		clr	A
		mov	RAM_2E,	A
		mov	R5, #26h
		ljmp	code_C21A
;  code_CBBC

; ---------------------------------------------------------------------------
		mov	DPTR, #2F5h
		movx	A, @DPTR
		cjne	A, #1, code_CBD7
		lcall	code_A13F
		lcall	nullsub_10

code_CBD7:				
		ret
; ---------------------------------------------------------------------------

code_CBD8:				
		lcall	code_C899
		clr	A
		mov	DPTR, #30Fh
		movx	@DPTR, A
		lcall	code_C75A
		ljmp	code_CE58

; ======================================================


code_CBE6:				
		clr	A
		mov	R7, A

code_CBE8:				
		inc	R7
		cjne	R7, #0FAh, code_CBE8
		clr	A
		mov	R7, A

code_CBEE:				
		inc	R7
		cjne	R7, #0FAh, code_CBEE
		ret
;  code_CBE6


; ======================================================


code_CBF3:				
		clr	EA
		clr	A
		mov	R7, A
		lcall	code_B50B
		lcall	IO_Init_CA8F
		ljmp	RESET
 


; ======================================================


REN_CC00:				
		mov	DPTR, #354h
		mov	A, R7
		movx	@DPTR, A
		jz	code_CC0A
		setb	SCON.4
		ret
; ---------------------------------------------------------------------------

code_CC0A:				
		clr	SCON.4
		ret
;  REN_CC00


; ======================================================


SM2_CC0D:				
		mov	DPTR, #378h
		mov	A, R7
		movx	@DPTR, A
		jz	code_CC17
		setb	SCON.5
		ret
; ---------------------------------------------------------------------------

code_CC17:				
		clr	SCON.5
		ret
;  SM2_CC0D

; ---------------------------------------------------------------------------
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC26
		lcall	code_A13F
		lcall	nullsub_10

code_CC26:				
		ret
; ---------------------------------------------------------------------------
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC33
		lcall	code_A13F
		lcall	nullsub_10

code_CC33:				
		ret

; ======================================================


code_CC34:				
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC40
		lcall	code_A13F
		lcall	nullsub_10

code_CC40:				
		ret
;  code_CC34


; ======================================================


code_CC41:				
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC4D
		lcall	code_A13F
		lcall	nullsub_10

code_CC4D:				
		ret
;  code_CC41


; ======================================================


code_CC4E:				
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC5A
		lcall	code_A13F
		lcall	nullsub_10

code_CC5A:				
		ret
;  code_CC4E


; ======================================================


code_CC5B:				
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC67
		lcall	code_A13F
		lcall	nullsub_10

code_CC67:				
		ret
;  code_CC5B

; ---------------------------------------------------------------------------
		lcall	code_CDC4
		mov	A, R7
		jz	code_CC74
		lcall	code_A13F
		lcall	nullsub_10

code_CC74:				
		ret
; ---------------------------------------------------------------------------
		lcall	code_CF00
		mov	A, R7
		jz	code_CC81
		lcall	code_CEFA
		lcall	nullsub_11

code_CC81:				
		ret

; ======================================================


code_CC82:				
		lcall	code_CF00
		mov	A, R7
		jz	code_CC8E
		lcall	code_CEFA
		lcall	nullsub_11

code_CC8E:				
		ret
;  code_CC82

; ---------------------------------------------------------------------------
		lcall	code_CEDC
		mov	A, R7
		jz	code_CC9B
		lcall	code_B292
		lcall	code_CF2E

code_CC9B:				
		ret

; ======================================================


code_CC9C:				
		mov	A, R7
		jz	code_CCA2
		cjne	R7, #1,	code_CCA7

code_CCA2:				
		mov	DPTR, #318h
		mov	A, R7
		movx	@DPTR, A

code_CCA7:				
		ret
;  code_CC9C


; ======================================================


code_CCA8:				
		mov	A, R7
		jz	code_CCAE
		cjne	R7, #1,	code_CCB3

code_CCAE:				
		mov	DPTR, #34Fh
		mov	A, R7
		movx	@DPTR, A

code_CCB3:				
		ret
;  code_CCA8


; ======================================================


code_CCB4:				
		mov	DPTR, #169h
		mov	A, #0Ah
		movx	@DPTR, A
		clr	A
		mov	DPTR, #1ECh
		movx	@DPTR, A
		ret
;  code_CCB4


; ======================================================


code_CCC0:				
		clr	A
		mov	DPTR, #363h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_CCC0

; ---------------------------------------------------------------------------
		mov	DPTR, #30Dh
		movx	A, @DPTR
		jz	code_CCD5
		lcall	code_C0CD

code_CCD5:				
		ljmp	code_B196

; ======================================================


code_CCD8:				
		lcall	code_A13F
		lcall	nullsub_10
		clr	A
		mov	DPTR, #2F5h
		movx	@DPTR, A
		ret
;  code_CCD8


; ======================================================


code_CCE4:				
		lcall	code_A13F
		lcall	nullsub_10
		clr	A
		mov	DPTR, #2F5h
		movx	@DPTR, A
		ret
;  code_CCE4


; ======================================================


code_CCF0:				
		lcall	code_A13F
		lcall	nullsub_10
		clr	A
		mov	DPTR, #2F5h
		movx	@DPTR, A
		ret
;  code_CCF0

; ---------------------------------------------------------------------------

code_CCFC:				
		lcall	code_CDC0
		mov	A, R7
		jz	code_CD07
		mov	R7, RAM_5
		lcall	code_99BB

code_CD07:				
		ret
; ---------------------------------------------------------------------------
		lcall	code_CC5B
		lcall	code_B4AB
		lcall	code_CBF3
		ljmp	code_C8AB
; ---------------------------------------------------------------------------

code_CD14:				
		lcall	code_CDC0
		mov	A, R7
		jz	code_CD1F
		mov	R7, RAM_5
		lcall	code_99BB

code_CD1F:				
		ret

; ======================================================


code_CD20:				
		clr	A
		mov	DPTR, #397h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #394h
		movx	@DPTR, A
		ret
;  code_CD20


; ======================================================


code_CD2C:				
		clr	A
		mov	DPTR, #395h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #393h
		movx	@DPTR, A
		ret
;  code_CD2C


; ======================================================


code_CD38:				
		mov	DPTR, #0B1h
		movx	A, @DPTR
		mov	DPTR, #1A1h
		movx	@DPTR, A
		ljmp	code_AB87
;  code_CD38


; ======================================================


code_CD43:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		anl	A, #7Fh
		movx	@DPTR, A
		ret
;  code_CD43


; ======================================================


code_CD4E:				
		mov	DPTR, #0F2h
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		orl	A, #80h
		movx	@DPTR, A
		ret
;  code_CD4E

; ---------------------------------------------------------------------------

code_CD59:				
		mov	DPTR, #30Dh
		movx	A, @DPTR
		cjne	A, #1, code_CD63
		lcall	code_99BB

code_CD63:				
		ret
; ---------------------------------------------------------------------------

code_CD64:				
		mov	DPTR, #2F2h
		movx	A, @DPTR
		cjne	A, #1, code_CD6E
		lcall	code_99BB

code_CD6E:				
		ret
; ---------------------------------------------------------------------------

code_CD6F:				
		mov	DPTR, #2F5h
		movx	A, @DPTR
		cjne	A, #1, code_CD79
		lcall	code_99BB

code_CD79:				
		ret

; ======================================================


code_CD7A:				
		cjne	R7, #1,	code_CD81
		mov	R7, #1
		sjmp	code_CD83
; ---------------------------------------------------------------------------

code_CD81:				
		mov	R7, #0

code_CD83:				
		ret
;  code_CD7A

; ---------------------------------------------------------------------------
		db  41h
		db    3
		db  53h
		db    0
		db  42h
		db    0
		db    0
		db    0
		db    0
		db    0

; ======================================================


code_CD8E:				
		mov	A, R7
		setb	C
		subb	A, #0
		jc	code_CD97
		dec	R7
		sjmp	code_CD8E
; ---------------------------------------------------------------------------

code_CD97:				
		ret
;  code_CD8E


; ======================================================


code_CD98:				
		clr	A
		mov	DPTR, #0A9h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		ret
;  code_CD98


; ======================================================


code_CDA2:				
		mov	DPTR, #3A2h
		movx	A, @DPTR
		jz	code_CDAB
		lcall	code_C441

code_CDAB:				
		ret
;  code_CDA2


; ======================================================


code_CDAC:				

; FUNCTION CHUNK AT 0000C107 SIZE 0000001D BYTES

		mov	DPTR, #1CEh
		movx	A, @DPTR
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ljmp	code_C107
;  code_CDAC


; ======================================================


code_CDB6:				
		clr	A
		mov	DPTR, #0F8h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0FFh
		movx	@DPTR, A
		ret
;  code_CDB6


; ======================================================


code_CDC0:				
		mov	R5, RAM_7
		mov	R4, RAM_6
;  code_CDC0


; ======================================================


code_CDC4:				
		mov	DPTR, #305h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_CDC4


; ======================================================


code_CDCA:				
		mov	A, R7
		cpl	A
		mov	R7, A
		mov	DPTR, #28h
		movx	A, @DPTR
		anl	A, R7
		movx	@DPTR, A
		ret
;  code_CDCA

; ---------------------------------------------------------------------------

code_CDD4:				
		lcall	code_CF00
		mov	A, R7
		jz	code_CDDD
		lcall	code_8C49

code_CDDD:				
		ret

; ======================================================


code_CDDE:				
		clr	A
		mov	DPTR, #3ABh
		movx	@DPTR, A
		mov	R7, A
		mov	R6, A
		ljmp	code_C26B
;  code_CDDE


; ======================================================


code_CDE8:				
		clr	A
		mov	DPTR, #353h
		movx	@DPTR, A
		mov	R7, A
		ljmp	REN_CC00
;  code_CDE8


; ======================================================


code_CDF1:				
		lcall	code_A863
		mov	DPTR, #317h
		mov	A, R7
		movx	@DPTR, A
		ret
;  code_CDF1


; ======================================================


code_CDFA:				
		mov	DPTR, #1DAh
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_CDFA


; ======================================================


code_CE03:				
		mov	DPTR, #0ADh
		movx	A, @DPTR
		mov	DPTR, #0A4h
		movx	@DPTR, A
		ret
;  code_CE03

; ---------------------------------------------------------------------------

code_CE0C:				
		lcall	code_C734
		lcall	code_C747
		ljmp	code_C5B0
; ---------------------------------------------------------------------------
		lcall	code_A13F
		lcall	nullsub_10
		ljmp	code_C8AB

; ======================================================


code_CE1E:				
		mov	DPTR, #39Ah
		movx	A, @DPTR
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_CE1E


; ======================================================


code_CE27:				
		mov	DPTR, #3A7h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A

code_CE2D:				
		ljmp	code_C793
;  code_CE27


; ======================================================


code_CE30:				
		mov	DPTR, #357h
		movx	A, @DPTR
		mov	R7, A
		mov	R6, #0
		ret
;  code_CE30


; ======================================================


code_CE38:				
		clr	A
		mov	DPTR, #0B1h
		movx	@DPTR, A
		ljmp	code_A99E
;  code_CE38


; ======================================================
;
;
;
ClearState_CE40:				
		clr	A
		mov	DPTR, #EEPROM_DONE_35E
		movx	@DPTR, A
		
		ljmp	IO_Init_CA8F
 

; ---------------------------------------------------------------------------

code_CE48:				
		clr	A
		mov	DPTR, #2CFh
		movx	@DPTR, A
		ljmp	code_8955
; ---------------------------------------------------------------------------

code_CE50:				
		clr	A
		mov	DPTR, #2D2h
		movx	@DPTR, A
		ljmp	code_BBF2
; ---------------------------------------------------------------------------

code_CE58:				
		clr	A
		mov	DPTR, #30Fh
		movx	@DPTR, A
		ljmp	code_65F5

; ======================================================


code_CE60:				
		clr	A
		mov	DPTR, #2F1h
		movx	@DPTR, A
		ljmp	code_BB41
;  code_CE60


; ======================================================


code_CE68:				
		mov	RAM_11,	R4
		mov	RAM_12,	R5
		mov	R7, #0
		ret
;  code_CE68


; ======================================================


code_CE6F:				
		mov	RAM_11,	R4
		mov	RAM_12,	R5
		mov	R7, #1
		ret
;  code_CE6F


; ======================================================


code_CE76:				
		mov	DPTR, #169h
		mov	A, #0Ch
		movx	@DPTR, A
		ret
;  code_CE76


; ======================================================


FLAG_SETB_CE7D:				
		mov	DPTR, #EEPROM_DONE_35E
		mov	A, #1
		movx	@DPTR, A
		ret
 
; ---------------------------------------------------------------------------

code_CE84:				
		mov	RAM_10,	R6
		mov	RAM_11,	R7
		ljmp	code_B647

; ======================================================


code_CE8B:				
		mov	DPTR, #28h
		movx	A, @DPTR
		orl	A, R7
		movx	@DPTR, A
		ret
;  code_CE8B


; ======================================================


code_CE92:				
		lcall	UserInput_ToR6R7_C489
		lcall	code_903C
		ret
 

; ======================================================


code_CE99:				
		lcall	UserInput_ToR6R7_C489
		lcall	code_B260
		ret
 


; ======================================================


code_CEA0:				
		clr	A
		mov	DPTR, #31Bh
		movx	@DPTR, A
		ret
;  code_CEA0


; ======================================================


code_CEA6:				
		clr	A
		mov	DPTR, #31Bh
		movx	@DPTR, A
		ret

; ======================================================


code_CEAC:				
		clr	A
		mov	DPTR, #29h
		movx	@DPTR, A
		ret


; ---------------------------------------------------------------------------

code_CEB2:				
		mov	DPTR, #2Dh
		mov	A, R7
		movx	@DPTR, A
		ret

; ======================================================


code_CEB8:				
		clr	A
		mov	DPTR, #169h
		movx	@DPTR, A
		ret
;  code_CEB8


; ======================================================


code_CEBE:				
		clr	A
		mov	DPTR, #0B1h
		movx	@DPTR, A
		ret
;  code_CEBE


; ======================================================


code_CEC4:				
		clr	A
		mov	DPTR, #1ECh
		movx	@DPTR, A
		ret
;  code_CEC4


; ======================================================


code_CECA:				
		clr	A
		mov	DPTR, #0B4h
		movx	@DPTR, A
		ret
;  code_CECA


; ======================================================


code_CED0:				
		clr	A
		mov	DPTR, #27h
		movx	@DPTR, A
		ret
;  code_CED0


; ======================================================


code_CED6:				
		clr	A
		mov	DPTR, #2D0h
		movx	@DPTR, A
		ret
;  code_CED6


; ======================================================


code_CEDC:				
		mov	DPTR, #2C7h
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_CEDC


; ======================================================


code_CEE2:				
		mov	DPTR, #2CCh
		movx	A, @DPTR
		mov	R7, A
		ret
;  code_CEE2

; ---------------------------------------------------------------------------

code_CEE8:				
		lcall	code_C899
		ljmp	code_BF0D
; ---------------------------------------------------------------------------

code_CEEE:				
		lcall	code_CEF4
		ljmp	code_93EE

; ======================================================


code_CEF4:				
		clr	A
		mov	DPTR, #2D1h
		movx	@DPTR, A
		ret
;  code_CEF4


; ======================================================


code_CEFA:				
		clr	A
		mov	DPTR, #305h
		movx	@DPTR, A
		ret
;  code_CEFA


; ======================================================


code_CF00:				
		mov	DPTR, #2D4h
		movx	A, @DPTR
		mov	R7, A
		ret
; ---------------------------------------------------------------------------
		db  12h
		db 0A1h
		db  3Fh
		db    2
		db 0CFh
		db  67h
		db  12h
		db 0B2h
		db  92h
		db    2
		db 0CFh
		db  2Eh
		db  12h
		db 0A1h
		db  3Fh
		db    2
		db 0CFh
		db  67h

; ======================================================


code_CF18:				
		clr	A
		mov	R7, A
		ljmp	REN_CC00
;  code_CF18

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_C2ED

code_CF1D:				
		clr	A
		mov	R7, A
		ljmp	REN_CC00
; ---------------------------------------------------------------------------

code_CF22:				
		clr	A
		mov	R7, A
		ljmp	REN_CC00
;  CHUNK	FOR code_C2ED

; ======================================================
;
; 这是原版本
;
;IAP_ERASE_CF27:				
;		lcall	IAP_ERASE_8460
;		ret

; 下面是修改的版本
;
; 擦除扇区 强制返回1
;
IAP_ERASE_CF27:				
		MOV	R7,#1			; 强制返回1
		NOP
		ret
 


; ======================================================


code_CF2B:				
		lcall	code_B292

code_CF2E:				
		ret
;  code_CF2B


; ======================================================

; Attributes: thunk

code_CF2F:				
		ljmp	code_C140
;  code_CF2F


; ======================================================

; Attributes: thunk

code_CF32:				
		ljmp	code_B41B
 
; ---------------------------------------------------------------------------
 
code_CF35:				
		ljmp	code_C3B1
; ---------------------------------------------------------------------------

code_CF38:				
		ljmp	code_909C
 
; ======================================================

 
IAP_IDLE_CF3B:				
		ljmp	IAP_IDLE_CB0B
 

; ---------------------------------------------------------------------------

code_CF3E:				
		ljmp	code_CB38
; ---------------------------------------------------------------------------
 
code_CF41:				
		ljmp	code_B6F1
 
; ---------------------------------------------------------------------------
 
code_CF44:				
		ljmp	code_B647
 
; ---------------------------------------------------------------------------

code_CF47:				
		ljmp	code_99BB
; ---------------------------------------------------------------------------

code_CF4A:				
		ljmp	code_99BB
; ---------------------------------------------------------------------------

code_CF4D:				
		ljmp	code_99BB
; ---------------------------------------------------------------------------

code_CF50:				
		ljmp	code_99BB
; ---------------------------------------------------------------------------

code_CF53:				
		ljmp	code_99BB
; ---------------------------------------------------------------------------

code_CF56:				
		ljmp	code_99BB
; ---------------------------------------------------------------------------

code_CF59:				
		ljmp	code_99BB

; ======================================================
;
;
;
;
code_CF5C:				
		ljmp	code_99BB



; ======================================================


nullsub_1:                              
                ret
; ======================================================


nullsub_12:                             
                ret
; ======================================================


nullsub_2:                              
                ret
; ======================================================


nullsub_8:                              
                ret
; ======================================================


nullsub_9:                              
                ret
; ======================================================


nullsub_3:                              
                ret
; ======================================================


nullsub_4:                              
                ret
; ======================================================


nullsub_5:                              
                ret
; ======================================================


nullsub_10:                             
                ret
; ======================================================


nullsub_6:                              
                ret
; ======================================================
nullsub_7:                              
                ret
 

; ======================================================


nullsub_11:                             
                ret
; ======================================================
; ======================================================
; ======================================================
; ======================================================
; ======================================================
;
;
;
code_CF6B:
                inc     RAM_3C
                mov     A, RAM_3C
                clr     C
                subb    A, #0xA
                jc      code_CF77
                mov     RAM_3C, #0
code_CF77:                              
                mov     A, RAM_3C
                jnz     code_CF80
                mov     R6, #0x13
                mov     R7, #0xEF
                ret
code_CF80:                              
                ljmp    code_A25D
code_CF83:                              
               mov     A, R5
                jz      code_CF8B
                clr     A
                mov     RAM_3D, A
                sjmp    code_CFB7
code_CF8B:                              
                inc     RAM_3D
                mov     A, RAM_3D
                cjne    A, #4, code_CF95
                mov     RAM_3E, R7
                ret
code_CF95:                              
                cjne    A, #5, code_CFA3
                mov     A, R7
                anl     A, #7Fh
                mov     RAM_3F, A
                mov     A, R7
                anl     A, #80h
                mov     RAM_43, A
                ret
code_CFA3:                              
                cjne    A, #6, code_CFB7
                mov     RAM_40, R7
                lcall   code_CFBA
                mov     A, R7
                jnz     code_CFB0
                sjmp    code_CFB7
code_CFB0:                              
                mov     A, RAM_43
                lcall   code_75D6
                mov     R7, RAM_3E
code_CFB7:                              
                ljmp    code_C696
code_CFBA:                              
                mov     A, RAM_3F
                mov     R7, A
                mov     DPTR, #13Bh
                movx    A, @DPTR
                xrl     A, R7
                jnz     code_CFCF
                mov     A, RAM_40
                mov     R7, A
                inc     DPTR
                movx    A, @DPTR
                xrl     A, R7
                jnz     code_CFCF
                mov     R7, #1
                ret
code_CFCF:                              
                mov     R7, #0
                ret
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------
; ===========================================================
; ===========================================================
; ===========================================================
; =========================================================== 
; ===========================================================
; ===========================================================
;
;
;
;
;
//test_00:
//
//		clr	A
//		mov	R7, A
//		lcall	USART_P30P31_P10P11_CB1A
//
//		mov	R7, #2
//		lcall	BaudRate_B964
//
//		mov	R7, #8
//		lcall	SM1_SM0_C459
//
//		mov	R7, #0
//		lcall	IE4_CB29
//
//		mov	R7, #0
//		lcall	REN_CC00
//
//		lcall	UserInput_ToR6R7_C489
//
//		push	7

	
//		mov	dptr,#0x26f
//		movx	a,@dptr
//		mov	r7,a
//		lcall	WhileSendR7_C882
//		mov	dptr,#0x270
//		movx	a,@dptr
//		mov	r7,a
//		lcall	WhileSendR7_C882
//
//		mov	dptr,#0x13b
//		movx	a,@dptr
//		mov	r7,a
//		lcall	WhileSendR7_C882
//		mov	dptr,#0x13c
//		movx	a,@dptr
//		mov	r7,a
//		lcall	WhileSendR7_C882
//
//		POP	7
//		ret
; ------------------------------------------------------
;
;
;
test_02:
	;	clr	A
	;	mov	R7, A
	;	lcall	USART_P30P31_P10P11_CB1A

	;	mov	R7, #2
	;	lcall	BaudRate_B964

	;	mov	R7, #8
	;	lcall	SM1_SM0_C459

	;	mov	R7, #0
	;	lcall	IE4_CB29

	;	mov	R7, #0
	;	lcall	REN_CC00


	;	lcall	code_A25D

	;	push	7

	;	mov	r7,6
	;	lcall	WhileSendR7_C882
	;	pop	7
	;	lcall	WhileSendR7_C882
	;	ret
; -------------------------------------------
;
;
;
test_003:

; -------------------------------------------
; 
; 
; 
connect_0000:
	     	lcall	R4R5_Ramdon_CaculateToR6R7_7980

		mov	a,r6
		xrl	a,#0xaa
		mov	r6,a
		mov	a,r7
		xrl	a,#0xaa
		mov	r7,a

		ret
; ---------------------------------------------------------------
; -------------------------------------------------------------------
; -------------------------------------------------------------------



; ----------------------------------------
;
;
;
MY_main:
		mov	sp,#0x50			; 
		
		CLR	WP				; 
		lcall	USART_BAB1			; 波特率 初始化
		
		MOV	DPTR,#0X1A2			; 
		CLR	A				; 
LOOP_0004:						; 
		MOVX	@DPTR,A			; 
		INC	DPTR				; 
		INC	A				; 
		CJNE	A,#0X40,LOOP_0004		; 数据
		
		lcall	IAP_program_A8A2		; 将数据写入
		

		mov	R3, #1			; 
		mov	R2, #HIGH(0X1A2)		; 
		mov	R1, #LOW(0X1A2)		;
		mov	RAM_1E,#0			;
		mov	RAM_1F,#38h			;
		
	;	mov	R5, #1			; original
		mov	r5,#0
		mov	R4, #0			;
		
		mov	R7, #1
		lcall	IAP_READ_9B02		; 再将数据读出
	
loop_0003:
		mov	R7, #0xaa			;
		lcall	WhileSendR7_C882		; 
		mov	R7, #0x55			; 
		lcall	WhileSendR7_C882		; 
		

		
		MOV	R1,#0X40			; 
		MOV	DPTR,#0X1A2			; 
LOOP_0005:				
		MOVX	A,@DPTR			; 
		INC	DPTR				; 
		MOV	R7,A				; 
		PUSH	1				; 
		push	DPH
		PUSH	DPL
		lcall	WhileSendR7_C882	
		POP	DPL
		POP	DPH
		POP	1		
		DJNZ	R1,LOOP_0005
		
		ljmp	loop_0003
; ------------------------------------------------------------		
;
; 下面的程序 是C语言编写的  然后 转成汇编  移入这里
;
;
; 2023-8-20 都忘了是怎么操作的了
;


; ======================================================
; ======================================================
; ======================================================
; ======================================================
; ======================================================
; ======================================================
; ======================================================


		 
					
		clr	P1.2
		lcall	code_2C0
		clr	A
		mov	RAM_8, A
TF0_00:					
		clr	C
		mov	A, RAM_8
		subb	A, #80h
		mov	A, #80h
		subb	A, #80h
		jnc	code_28
		mov	A, #0
		add	A, RAM_8
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		mov	A, RAM_8
RI_TI:
		movx	@DPTR, A
		inc	RAM_8
		
		sjmp	TF0_00

; ---------------------------------------------------------------------------

code_28:				
		mov	R3, #1
		mov	R2, #0
		mov	R1, #0
		mov	RAM_D, #1
		clr	A
		mov	RAM_E, A
		mov	R5, #80h
		lcall	AT24C64_Write_Page_addr6r7_NumE_F3
		
		
		clr	A
		mov	RAM_8, A
code_3C:				
		clr	C
		mov	A, RAM_8
		subb	A, #80h
		mov	A, #80h
		subb	A, #80h
		jnc	code_58
		mov	A, #0
		add	A, RAM_8
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		clr	A
		movx	@DPTR, A
		inc	RAM_8
		sjmp	code_3C
; ---------------------------------------------------------------------------

code_58:				
		mov	RAM_E, #1
		mov	RAM_F, #0
		mov	RAM_10,#0
		mov	R3, #80h
		mov	R2, #0
		clr	A
		mov	R5, A
		mov	R7, #1
		mov	R6, A
		lcall	AT24C512_Sequential_Read_1DA

code_6D:				
		mov	R7, #0AAh
		lcall	SendByte_327
		mov	R7, #55h
		lcall	SendByte_327
		clr	A
		mov	RAM_8, A

code_7A:				
		clr	C
		mov	A, RAM_8
		subb	A, #80h
		mov	A, #80h
		subb	A, #80h
		jnc	code_6D
		mov	A, #0
		add	A, RAM_8
		mov	DPL, A
		clr	A
		addc	A, #0
		mov	DPH, A
		movx	A, @DPTR
		mov	R7, A
		lcall	SendByte_327
		inc	RAM_8
		sjmp	code_7A

; ======================================================


AT24C64_Current_Addr_Read_Byte_99:	

	;	mov	RAM_11,R6
	;	mov	RAM_12,R7
		
	;	mov	RAM_13,R3
	;	mov	RAM_14,R2
	;	mov	RAM_15,R1

		mov	RAM_1E,R6
		mov	RAM_1F,R7
		
		mov	RAM_19,R3
		mov	RAM_1A,R2
		mov	RAM_1B,R1
	
		lcall	code_2E6
		
		mov	R7, #0A1h
		lcall	I2C_Write_Byte_21A
		
		clr	A
		mov	RAM_1C,A
code_AE:				
		mov	A, RAM_1F
		add	A, #0FFh
		mov	R7, A
		mov	A, RAM_1E
		addc	A, #0FFh
		mov	R6, A
		clr	C
		mov	A, RAM_1C
		subb	A, R7
		clr	A
		subb	A, R6
		jnc	code_DA
		
		lcall	I2C_Read_Byte_242
		
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	DPL, RAM_1C
		mov	DPH, #0
		mov	A, R7
		lcall	A_ToR3R2R1_179
		lcall	I2C_Ack_305
		inc	RAM_1C
		sjmp	code_AE
; ---------------------------------------------------------------------------

code_DA:				
		lcall	I2C_Read_Byte_242
		mov	R3, RAM_19
		mov	R2, RAM_1A
		mov	R1, RAM_1B
		mov	DPL, RAM_1C
		mov	DPH, #0
		mov	A, R7
		lcall	A_ToR3R2R1_179
		lcall	code_31D
		ljmp	I2C_Stop_2D3
 


; ======================================================
;
;
; IAP_Write_R3R2R1Buff_r22r23time_r4r5offset_836D
;
;
;
;
AT24C64_Write_Page_addr6r7_NumE_F3:			
;
;
;
;
page_1C	equ 0x1C
offset_1D	equ 0x1D
	
		clr	wp
		
	;	mov	RAM_9, R3		; 
	;	mov	RAM_A, R2		; 
	;	mov	RAM_B, R1		; 
	;	mov	RAM_C, R5		; number
	
		mov	RAM_1F, R3		; 
		mov	RAM_20, R2		; 
		mov	RAM_21, R1		;
	;	mov	RAM_1E, R5		; number
		mov	page_1C,r7		; page
		mov	offset_1D,r5	; offset
	
		mov	A, page_1C
		add	A, #0FFh
		mov	R7, A
		clr	A
		addc	A, #0FFh
		mov	R3, RAM_7
		mov	R2, A
		mov	R6, A
		mov	A, R3			; (page-1)*128+offset;
		mov	R0, #7
code_10A:				
		clr	C
		rlc	A
		xch	A, R6
		rlc	A
		xch	A, R6
		djnz	R0, code_10A
		mov	R4, #0
		add	A, offset_1D
		mov	R3, A
		mov	A, R4
		addc	A, R6
		mov	R2, A
		lcall	I2C_Start_215
		mov	R7, RAM_2
		lcall	I2C_Write_Byte_21A
		mov	R7, RAM_3
		lcall	I2C_Write_Byte_21A

code_126:				
		mov	A, R4
		clr	C
	;	subb	A, RAM_C
		subb	A,RAM_23
		jnc	code_144
		
	;	mov	R3, RAM_9
	;	mov	R2, RAM_A
	;	mov	R1, RAM_B
		mov	R3, RAM_1F
		mov	R2, RAM_20
		mov	R1, RAM_21	
		mov	DPL, R4
		mov	DPH, #0
		lcall	R3R2R1_GetACC_14C
		mov	R7, A
		lcall	I2C_Write_Byte_21A
		lcall	I2C_Ack_305
		inc	R4
		sjmp	code_126
; ---------------------------------------------------------------------------

code_144:				
		lcall	I2C_Stop_2D3
		mov	R7, #32h
		lcall	Delay_100us_32F

		lcall	FLAG_SETB_CE7D		; 嵌入原来的

		mov	r7,#1				; 说明成功
		ret


; ======================================================


R3R2R1_GetACC_14C:			
		cjne	R3, #1,	code_15B
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		movx	A, @DPTR
		ret
; ---------------------------------------------------------------------------

code_15B:				
		jnc	code_163
		mov	A, R1
		add	A, DPL
		mov	R0, A
		mov	A, @R0
		ret
; ---------------------------------------------------------------------------

code_163:				
		cjne	R3, #0FEh, code_16C_00
		mov	A, R1
		add	A, DPL
		mov	R0, A
		movx	A, @R0
		ret
; ---------------------------------------------------------------------------

code_16C_00:				
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		clr	A
		movc	A, @A+DPTR
		ret
 

; ======================================================


A_ToR3R2R1_179:				
		mov	R0, A
		cjne	R3, #1,	code_18A
		mov	A, DPL
		add	A, R1
		mov	DPL, A
		mov	A, DPH
		addc	A, R2
		mov	DPH, A
		mov	A, R0
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_18A:				
		jnc	code_192
		mov	A, R1
		add	A, DPL
		xch	A, R0
		mov	@R0, A
		ret
; ---------------------------------------------------------------------------

code_192:				
		cjne	R3, #0FEh, code_19A
		mov	A, R1
		add	A, DPL
		xch	A, R0
		movx	@R0, A

code_19A:				
		ret
 

; ======================================================
;
;
;
AT24C512_fill_19B:
		clr	wp
		
		mov	r6,#0
		
		mov	A, R7
		add	A, #0FFh
		mov	R7, A
		mov	A, R6
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		mov	R0, #7
code_1A6:				
		clr	C
		rlc	A
		xch	A, R6
		rlc	A
		xch	A, R6
		djnz	R0, code_1A6
		mov	R3, A
		lcall	code_213
		mov	R7, RAM_2
		lcall	I2C_Write_Byte_21A
		mov	R7, RAM_3
		lcall	I2C_Write_Byte_21A
		clr	A
		mov	R4, A

code_1BD:				
		mov	A, R4
		clr	C
		subb	A, #80h
		mov	A, #80h
		subb	A, #80h
		jnc	code_1D2
		
		mov	R7, #0FFh
		lcall	I2C_Write_Byte_21A
		lcall	I2C_Ack_305
		inc	R4
		sjmp	code_1BD
; ---------------------------------------------------------------------------

code_1D2:				
		lcall	I2C_Stop_2D3
		
		mov	R7, #32h
		lcall	Delay_100us_32F
		
		lcall	FLAG_SETB_CE7D
		
		mov	r7,#1
		ret
 

; ======================================================
;
;
;
time_1E	equ 0x1e
time_1F	equ 0x1f
	
	
AT24C512_Sequential_Read_1DA:	

		clr	WP
		
		mov	RAM_19,r3
		mov	RAM_1A,r2
		mov	RAM_1B,r1
	;	mov	RAM_C, R2
	;	mov	RAM_D, R3
	;	mov	RAM_1E, R2
	;	mov	RAM_1F, R3		; time
		
		mov	r6,#0			; 
		
		mov	A, R7			; 
		add	A, #0FFh		; 
		mov	R7, A			;
		mov	A, R6			; page read
		addc	A, #0FFh
		mov	R6, A
		mov	A, R7
		mov	R0, #7
code_1E9:				
		clr	C
		rlc	A
		xch	A, R6
		rlc	A
		xch	A, R6
		djnz	R0, code_1E9
		
		mov	R4, #0
		add	A, R5
		mov	R7, A
		mov	A, R4
		addc	A, R6
		mov	R3, RAM_7
		mov	R2, A
		
		lcall	I2C_Start_215
		mov	R7, RAM_2
		lcall	I2C_Write_Byte_21A
		mov	R7, RAM_3
		lcall	I2C_Write_Byte_21A
		
	;	mov	R3, RAM_E
	;	mov	R2, RAM_F
	;	mov	R1, RAM_10
	;	mov	R7, RAM_D
	;	mov	R6, RAM_C
	
		mov	R3, RAM_19
		mov	R2, RAM_1A			; 
		mov	R1, RAM_1B
	


		mov	R7, RAM_1F			; number
		mov	R6, RAM_1E
		ljmp	AT24C64_Current_Addr_Read_Byte_99
 

; ======================================================


code_213:				
		mov	R2, RAM_6
; End of function code_213


; ======================================================


I2C_Start_215:				
		lcall	code_2E6
		
		
		mov	R7, #0A0h
; End of function I2C_Start_215


; ======================================================
;
;
;
I2C_Write_Byte_21A:			

		mov	R6, RAM_7
	;	mov	RAM_17,R6
		
		clr	A
		mov	R5, A
code_220:				
		mov	A, R5
		clr	C
		subb	A, #8
		mov	A, #80h
		subb	A, #80h
		jnc	code_23F
		
		mov	A, R6
		rlc	A
		mov	P1.4, C
		mov	A, R6
		add	A, ACC
		mov	R6, A
		lcall	code_2FE
		clr	P1.3
		mov	R7, #64h
		lcall	code_302
		inc	R5
		sjmp	code_220
; ---------------------------------------------------------------------------

code_23F:				
		ljmp	I2C_Get_Ack_2AA


; ======================================================


I2C_Read_Byte_242:				
		clr	A
		mov	R6, A
		setb	P1.4
		mov	R5, A

code_247:				
		mov	A, R5
		clr	C
		subb	A, #8
		mov	A, #80h
		subb	A, #80h
		jnc	code_268
		lcall	code_2FE
		mov	A, R6
		add	A, ACC
		mov	R6, A
		jnb	P1.4, code_25E
		orl	RAM_6, #1

code_25E:				
		clr	P1.3
		mov	R7, #64h
		lcall	code_302
		inc	R5
		sjmp	code_247
; ---------------------------------------------------------------------------

code_268:				
		mov	R7, RAM_6
		ret
 

; ======================================================


code_26B:
		mov	R3, RAM_7
		mov	R2, RAM_6
		mov	R4, RAM_5
		lcall	I2C_Start_215
		mov	R7, RAM_2
		lcall	I2C_Write_Byte_21A
		mov	R7, RAM_3
		lcall	I2C_Write_Byte_21A
		mov	R7, RAM_4
		lcall	I2C_Write_Byte_21A
		lcall	I2C_Stop_2D3
		mov	R7, #32h
		ljmp	Delay_100us_32F
; End of function code_26B


; ======================================================


code_28B:
		mov	R3, RAM_7
		lcall	code_213
		mov	R7, RAM_2
		lcall	I2C_Write_Byte_21A
		mov	R7, RAM_3
		lcall	I2C_Write_Byte_21A
		mov	R3, #0
		mov	R2, #0
		mov	R1, #18h
		mov	R7, #1
		mov	R6, #0
		lcall	AT24C64_Current_Addr_Read_Byte_99
		mov	R7, RAM_18
		ret
 
; ---------------------------------------------------------------------------
 
I2C_Get_Ack_2AA:				
		lcall	code_2F7
		mov	C, P1.4
		clr	A
		rlc	A
		mov	R6, A
		mov	R7, #64h
		lcall	code_302
		clr	P1.3
		mov	R7, #64h
		lcall	code_302
		mov	R7, A
		ret
 
; ======================================================


code_2C0:				
		anl	PCON, #7Fh
		mov	SCON, #50h
		orl	RESERVED008E, #4
		mov	0X9C, #0DCh
		orl	RESERVED008E, #1
		orl	RESERVED008E, #10h
		ret
; End of function code_2C0


; ======================================================


I2C_Stop_2D3:				
		clr	P1.4
		lcall	code_2F9
		setb	P1.4
		mov	R7, #64h
		lcall	code_302
		clr	P1.3
		mov	R7, #64h
		ljmp	code_302
 

; ======================================================


code_2E6_00:				
		lcall	code_2F7
		clr	P1.4
		mov	R7, #64h
		lcall	code_302
		clr	P1.3
		mov	R7, #64h
		ljmp	code_302
 


; ======================================================


code_2F7:				
		setb	P1.4



; ======================================================


code_2F9:				
		mov	R7, #64h
		lcall	code_302
 

; ======================================================


code_2FE:				
		setb	P1.3
		mov	R7, #64h
; End of function code_2FE


; ======================================================


code_302:				
		djnz	R7, code_302
		ret
; End of function code_302


; ======================================================


I2C_Ack_305:				
		clr	P1.4
		lcall	code_2F9
		clr	P1.3
		mov	R7, #64h
		ljmp	code_302
 


; ======================================================





; ======================================================


code_31D:				
		lcall	code_2F7
		clr	P1.3
		mov	R7, #64h
		ljmp	code_302
 


; ======================================================


SendByte_327:				
		clr	SCON.1
		mov	SBUF, R7

code_32B:				
		jnb	SCON.1,	code_32B
		ret
 
; ---------------------------------------------------------------------------
 
Delay_100us_32F:			
		djnz	R7, Delay_100us_32F
		ret
 
; ---------------------------------------------------------------------------
		end  
