


WP	equ P1.2
SCL	equ P1.3
SDA	equ P1.4


//第一：开机版本由现在4.6改成6.8
//第二：确认+配置修改算法
//第三：配置-8888-确认-配置-LP随机码或者8888解锁这些修改算法
//四：配置-0000-确认，这个你看怎么改


sram_13B		equ 0x13B
ramdon1			equ 0x2ff
NineBits		EQU 0X355

EEPROM_DONE_35E		EQU 0X35E
; --------------------------------------
RAM_0 equ 0				
RAM_1 equ 1				
RAM_2 equ 2				
RAM_3 equ 3				
RAM_4 equ 4				
RAM_5 equ 5				
RAM_6 equ 6				
RAM_7 equ 7				
RAM_8 equ 8				
RAM_9 equ 9				
RAM_A equ 0Ah				
RAM_B equ 0Bh				
RAM_C equ 0Ch				
RAM_D equ 0Dh				
RAM_E equ 0Eh				
RAM_F equ 0Fh				
RAM_10 equ 10h				
RAM_11 equ 11h				
RAM_12 equ 12h				
RAM_13 equ 13h				
RAM_14 equ 14h				
RAM_15 equ 15h				
RAM_16 equ 16h				
RAM_17 equ 17h				
RAM_18 equ 18h				
RAM_19 equ 19h				
RAM_1A equ 1Ah				
RAM_1B equ 1Bh				
RAM_1C equ 1Ch				
RAM_1D equ 1Dh				
RAM_1E equ 1Eh				
RAM_1F equ 1Fh				
RAM_20 equ 20h				
RAM_21 equ 21h				
RAM_22 equ 22h				
RAM_23 equ 23h				
RAM_24 equ 24h				
RAM_25 equ 25h				
RAM_26 equ 26h				
RAM_27 equ 27h				
RAM_28 equ 28h				
RAM_29 equ 29h				




RAM_2E equ 2Eh				
RAM_2F equ 2Fh				
RAM_30 equ 30h				
RAM_31 equ 31h				
RAM_32 equ 32h				
RAM_33 equ 33h				
RAM_34 equ 34h				


RAM_37 equ 37h				
RAM_38 equ 38h				
RAM_39 equ 39h				
RAM_3A equ 3Ah				
RAM_3B equ 3Bh				
RAM_3C		EQU 0X3C
RAM_3D		EQU 0X3D
RAM_3E		EQU 0X3E
RAM_3F		EQU 0X3F
RAM_40		EQU 0X40
RAM_43		EQU 0X43
RAM_7E equ 7Eh				




; org 80h
;P0 equ 80h				
;SP equ 81h				
;DPL equ	82h				
;DPH equ	83h				
RESERVED0084 equ 84h
RESERVED0085 equ 85h
WDTREL equ 86h
;PCON equ 87h				
;TCON equ 88h				
;TMOD equ 89h				
;TL0 equ	8Ah				
;TL1 equ	8Bh
;TH0 equ	8Ch				
;TH1 equ	8Dh
RESERVED008E equ 8Eh			
RESERVED008F equ 8Fh
;P1 equ 90h				
RESERVED0091 equ 91h			
DPSEL equ 92h				
RESERVED0093 equ 93h			
RESERVED0094 equ 94h			
RESERVED0095 equ 95h			
RESERVED0096 equ 96h			
RESERVED0097 equ 97h
;SCON equ 98h				
;SBUF equ 99h				
IEN2 equ 9Ah
S1CON equ 9Bh
BRT equ 9Ch				
S1REL equ 9Dh
RESERVED009E equ 9Eh
RESERVED009F equ 9Fh
;P2 equ 0A0h				
RESERVED00A1 equ 0A1h
RESERVED00A2 equ 0A2h			
RESERVED00A3 equ 0A3h
RESERVED00A4 equ 0A4h
RESERVED00A5 equ 0A5h
RESERVED00A6 equ 0A6h
RESERVED00A7 equ 0A7h
;IE 			equ 0A8h				
IP0 equ	0A9h
S0RELL equ 0AAh
RESERVED00AB equ 0ABh
RESERVED00AC equ 0ACh
RESERVED00AD equ 0ADh
RESERVED00AE equ 0AEh
RESERVED00AF equ 0AFh
;P3 equ 0B0h				
RESERVED00B1 equ 0B1h			
RESERVED00B2 equ 0B2h			
RESERVED00B3 equ 0B3h			
RESERVED00B4 equ 0B4h			
 


IEN1 equ 0B8h				
 
 
 
 
 
 
S1RELH equ 0BBh				
 
P4 						equ 0C0h				
CCEN 					equ 0C1h		






IAP_DATA 			equ 0C2h				
IAP_ADDRH 		equ 0C3h				
IAP_ADDRL 		equ 0C4h				
IAP_CMD 			equ 0C5h				
IAP_TRIG 			equ 0C6h				
IAP_CONTR 		equ 0C7h			













 