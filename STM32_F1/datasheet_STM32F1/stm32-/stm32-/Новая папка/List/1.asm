
;CodeVisionAVR C Compiler V2.05.3 Standard
;(C) Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type                : ATmega16
;Program type             : Application
;Clock frequency          : 8,000000 MHz
;Memory model             : Small
;Optimize for             : Size
;(s)printf features       : int, width
;(s)scanf features        : int, width
;External RAM size        : 0
;Data Stack size          : 256 byte(s)
;Heap size                : 0 byte(s)
;Promote 'char' to 'int'  : Yes
;'char' is unsigned       : Yes
;8 bit enums              : Yes
;Global 'const' stored in FLASH     : No
;Enhanced function parameter passing: Yes
;Enhanced core instructions         : On
;Smart register allocation          : On
;Automatic register allocation      : On

	#pragma AVRPART ADMIN PART_NAME ATmega16
	#pragma AVRPART MEMORY PROG_FLASH 16384
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1119
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x045F
	.EQU __DSTACK_SIZE=0x0100
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __GETD1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X+
	LD   R22,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _rs_timer_cloc=R5
	.DEF _det_taym_cloc=R4
	.DEF _rs_wr_index=R7
	.DEF _rs_rd_index=R6
	.DEF _rs_counter=R9

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _usart_rx_isr
	JMP  0x00
	JMP  _usart_tx_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_tbl10_G100:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G100:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

;REGISTER BIT VARIABLES INITIALIZATION
__REG_BIT_VARS:
	.DW  0x0000

_0x23:
	.DB  0x1,0x2,0x1,0x2,0x1,0x2,0x1,0x2
	.DB  0x1,0x2

__GLOBAL_INI_TBL:
	.DW  0x01
	.DW  0x02
	.DW  __REG_BIT_VARS*2

	.DW  0x0A
	.DW  _test
	.DW  _0x23*2

_0xFFFFFFFF:
	.DW  0

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;DISABLE WATCHDOG
	LDI  R31,0x18
	OUT  WDTCR,R31
	OUT  WDTCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x160

	.CSEG
;#include <mega16.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;#include <delay.h>
;
;#include "mode_bus.c"
;/*
;
;MOD_BUS V 2.0
;
;
;// USART initialization
;// Communication Parameters: 8 Data, 1 Stop, No Parity
;// USART Receiver: On
;// USART Transmitter: On
;// USART Mode: Asynchronous
;// USART Baud Rate: 9600
;UCSRA=0x00;
;UCSRB=0xD8;
;UCSRC=0x86;
;UBRRH=0x00;
;UBRRL=0x33;
;
;*/
;
;
;#ifndef RXB8
;#define RXB8 1
;#endif
;
;#ifndef TXB8
;#define TXB8 0
;#endif
;
;#ifndef UPE
;#define UPE 2
;#endif
;
;#ifndef DOR
;#define DOR 3
;#endif
;
;#ifndef FE
;#define FE 4
;#endif
;
;#ifndef UDRE
;#define UDRE 5
;#endif
;
;#ifndef RXC
;#define RXC 7
;#endif
;
;#define FRAMING_ERROR (1<<FE)
;#define PARITY_ERROR (1<<UPE)
;#define DATA_OVERRUN (1<<DOR)
;#define DATA_REGISTER_EMPTY (1<<UDRE)
;#define RX_COMPLETE (1<<RXC)
;
;#define RS_485 PORTA.0
;
;#define timer_reset TCNT0 = 0
;#define timer_start TCCR0 = 0x05
;
;unsigned char rs_timer_cloc;
;unsigned char det_taym_cloc;
;
;// USART Receiver buffer
;#define RS_BUFFER_SIZE 40
;char rs_buffer[RS_BUFFER_SIZE];
;
;
;
;unsigned char rs_wr_index,rs_rd_index,rs_counter;
;
;bit rs_buffer_overflow;
;
;
;
;void rs_clear (void)
; 0000 0004 {

	.CSEG
_rs_clear:
;
;  rs_wr_index = 0;
	CLR  R7
;  rs_rd_index = 0;
	CLR  R6
;  rs_counter  = 0;
	CLR  R9
;
;}
	RET
;
;interrupt [USART_RXC] void usart_rx_isr(void)
;{
_usart_rx_isr:
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
;char status,data;
;status=UCSRA;
	ST   -Y,R17
	ST   -Y,R16
;	status -> R17
;	data -> R16
	IN   R17,11
;data=UDR;
	IN   R16,12
;if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
	MOV  R30,R17
	ANDI R30,LOW(0x1C)
	BRNE _0x3
;   {
;   rs_buffer[rs_wr_index++]=data;
	MOV  R30,R7
	INC  R7
	LDI  R31,0
	SUBI R30,LOW(-_rs_buffer)
	SBCI R31,HIGH(-_rs_buffer)
	ST   Z,R16
;#if RS_BUFFER_SIZE == 256
;   // special case for receiver buffer size=256
;   if (++rs_counter == 0) rs_buffer_overflow=1;
;#else
;   if (rs_wr_index == RS_BUFFER_SIZE) rs_wr_index=0;
	LDI  R30,LOW(40)
	CP   R30,R7
	BRNE _0x4
	CLR  R7
;   if (++rs_counter == RS_BUFFER_SIZE)
_0x4:
	INC  R9
	LDI  R30,LOW(40)
	CP   R30,R9
	BRNE _0x5
;      {
;      rs_counter=0;
	CLR  R9
;      rs_buffer_overflow=1;
	SET
	BLD  R2,0
;      }
;#endif
;   }
_0x5:
;}
_0x3:
	LD   R16,Y+
	LD   R17,Y+
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	RETI
;
;
;
;
;#ifndef _DEBUG_TERMINAL_IO_
;// Get a character from the USART Receiver buffer
;#define _ALTERNATE_GETCHAR_
;
;
;#pragma used+
;char getchar(void)
;{
;char data;
;while (rs_counter==0);
;	data -> R17
;data=rs_buffer[rs_rd_index++];
;#if RS_BUFFER_SIZE != 256
;if (rs_rd_index == RS_BUFFER_SIZE) rs_rd_index=0;
;#endif
;#asm("cli")
;--rs_counter;
;#asm("sei")
;return data;
;}
;#pragma used-
;#endif
;
;
;
;
;
;interrupt [USART_TXC] void usart_tx_isr(void)
;{
_usart_tx_isr:
	ST   -Y,R0
	ST   -Y,R1
	ST   -Y,R15
	ST   -Y,R22
	ST   -Y,R23
	ST   -Y,R24
	ST   -Y,R25
	ST   -Y,R26
	ST   -Y,R27
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
;if (rs_counter)
	TST  R9
	BREQ _0xA
;   {
;   --rs_counter;
	DEC  R9
;   UDR=rs_buffer[rs_rd_index++];
	MOV  R30,R6
	INC  R6
	LDI  R31,0
	SUBI R30,LOW(-_rs_buffer)
	SBCI R31,HIGH(-_rs_buffer)
	LD   R30,Z
	OUT  0xC,R30
;#if RS_BUFFER_SIZE != 256
;   if (rs_rd_index == RS_BUFFER_SIZE) rs_rd_index=0;
	LDI  R30,LOW(40)
	CP   R30,R6
	BRNE _0xB
	CLR  R6
;#endif
;   }
_0xB:
;   else{ RS_485 = 0;
	RJMP _0xC
_0xA:
	CBI  0x1B,0
;         rs_clear();}
	RCALL _rs_clear
_0xC:
;}
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R27,Y+
	LD   R26,Y+
	LD   R25,Y+
	LD   R24,Y+
	LD   R23,Y+
	LD   R22,Y+
	LD   R15,Y+
	LD   R1,Y+
	LD   R0,Y+
	RETI
;
;#ifndef _DEBUG_TERMINAL_IO_
;// Write a character to the USART Transmitter buffer
;#define _ALTERNATE_PUTCHAR_
;
;
;
;
;
;#pragma used+
;void putchar(char c)
;{
;while (rs_counter == RS_BUFFER_SIZE);
;	c -> Y+0
;#asm("cli")
;if (rs_counter || ((UCSRA & DATA_REGISTER_EMPTY)==0))
;   {
;   rs_buffer[rs_wr_index++]=c;
;#if RS_BUFFER_SIZE != 256
;   if (rs_wr_index == RS_BUFFER_SIZE) rs_wr_index=0;
;#endif
;   ++rs_counter;
;   }
;else
;   UDR=c;
;#asm("sei")
;}
;#pragma used-
;#endif
;
;#pragma used+
;
;
;
;
;
;void timer (unsigned char argumet_timer)
;{
; timer_reset;
;	argumet_timer -> Y+0
; rs_timer_cloc = argumet_timer;
; det_taym_cloc = 0;
; timer_start;
;
;}
;
;
;unsigned int CRCode(unsigned char * crc_point, unsigned char length)
;{
_CRCode:
;    unsigned char j, flag;
;    unsigned int  crc = 0xFFFF;
;
;    while(length--)
	ST   -Y,R26
	CALL __SAVELOCR4
;	*crc_point -> Y+5
;	length -> Y+4
;	j -> R17
;	flag -> R16
;	crc -> R18,R19
	__GETWRN 18,19,-1
_0x17:
	LDD  R30,Y+4
	SUBI R30,LOW(1)
	STD  Y+4,R30
	SUBI R30,-LOW(1)
	BREQ _0x19
;    {
;        crc ^= *crc_point++;
	LDD  R26,Y+5
	LDD  R27,Y+5+1
	LD   R30,X+
	STD  Y+5,R26
	STD  Y+5+1,R27
	LDI  R31,0
	__EORWRR 18,19,30,31
;        for (j = 0; j < 8; j++)
	LDI  R17,LOW(0)
_0x1B:
	CPI  R17,8
	BRSH _0x1C
;        {
;            flag = (unsigned char)(crc & 0x0001);
	MOV  R30,R18
	ANDI R30,LOW(0x1)
	MOV  R16,R30
;            crc >>= 1;
	LSR  R19
	ROR  R18
;            if (flag > 0)
	CPI  R16,1
	BRLO _0x1D
;                crc ^= 0xA001;
	LDI  R30,LOW(40961)
	LDI  R31,HIGH(40961)
	__EORWRR 18,19,30,31
;        }
_0x1D:
	SUBI R17,-1
	RJMP _0x1B
_0x1C:
;    }
	RJMP _0x17
_0x19:
;    return crc;
	MOVW R30,R18
	CALL __LOADLOCR4
	ADIW R28,7
	RET
; }
;
;
; void transmit_rs (unsigned char rs_id, unsigned char rs_func, unsigned int rs_adr, unsigned int rs_colvo,)
; {
;
; rs_buffer[0] = rs_id;
;	rs_id -> Y+5
;	rs_func -> Y+4
;	rs_adr -> Y+2
;	rs_colvo -> Y+0
; rs_buffer[1] = rs_func;
; rs_buffer[2] = rs_adr >> 8;
; rs_buffer[3] = rs_adr ;
; rs_buffer[4] = rs_colvo >> 8;
; rs_buffer[5] = rs_colvo ;
;
;// rs_buffer[7] = CRCode(rs_buffer, 6);  >> 8;
;// rs_buffer[6] = CRCode(rs_buffer, 6);
;
; rs_buffer[6]= (CRCode(rs_buffer, 6) & 0x00FF);
; rs_buffer[7]= (CRCode(rs_buffer, 6) >>8);
;
; rs_counter = 7;
;
; rs_rd_index ++;
;
; RS_485 = 1;
;
; UDR = rs_id;
;
; }
;
; void transmit_rs_pac (unsigned char rs_id, unsigned char rs_func, unsigned int rs_adr, unsigned int rs_colvo, unsigned char * data_point, unsigned char data_length )
; {
_transmit_rs_pac:
;
; unsigned char i;
;
; rs_buffer[0] = rs_id;
	ST   -Y,R26
	ST   -Y,R17
;	rs_id -> Y+9
;	rs_func -> Y+8
;	rs_adr -> Y+6
;	rs_colvo -> Y+4
;	*data_point -> Y+2
;	data_length -> Y+1
;	i -> R17
	LDD  R30,Y+9
	STS  _rs_buffer,R30
; rs_buffer[1] = rs_func;
	LDD  R30,Y+8
	__PUTB1MN _rs_buffer,1
; rs_buffer[2] = rs_adr >> 8;
	LDD  R30,Y+7
	__PUTB1MN _rs_buffer,2
; rs_buffer[3] = rs_adr ;
	LDD  R30,Y+6
	__PUTB1MN _rs_buffer,3
; rs_buffer[4] = rs_colvo >> 8;
	LDD  R30,Y+5
	__PUTB1MN _rs_buffer,4
; rs_buffer[5] = rs_colvo ;
	LDD  R30,Y+4
	__PUTB1MN _rs_buffer,5
;
;    for(i = 0; i == data_length ;i++)
	LDI  R17,LOW(0)
_0x21:
	LDD  R30,Y+1
	CP   R30,R17
	BRNE _0x22
;   {
;   rs_buffer[6+i] = * data_point++;
	CALL SUBOPT_0x0
	__ADDW1MN _rs_buffer,6
	MOVW R0,R30
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	LD   R30,X+
	STD  Y+2,R26
	STD  Y+2+1,R27
	MOVW R26,R0
	ST   X,R30
;   }
	SUBI R17,-1
	RJMP _0x21
_0x22:
;    rs_buffer[7+i] = (CRCode(rs_buffer, (6+i)) & 0x00FF);
	CALL SUBOPT_0x0
	__ADDW1MN _rs_buffer,7
	PUSH R31
	PUSH R30
	CALL SUBOPT_0x1
	POP  R26
	POP  R27
	ST   X,R30
;    rs_buffer[8+i] = (CRCode(rs_buffer, (6+i)) >> 8);
	CALL SUBOPT_0x0
	__ADDW1MN _rs_buffer,8
	PUSH R31
	PUSH R30
	CALL SUBOPT_0x1
	MOV  R30,R31
	LDI  R31,0
	POP  R26
	POP  R27
	ST   X,R30
;
;    rs_counter = (10+i);
	MOV  R30,R17
	SUBI R30,-LOW(10)
	MOV  R9,R30
;    rs_rd_index ++;
	INC  R6
;    UDR = rs_id;
	LDD  R30,Y+9
	OUT  0xC,R30
;   // putchar(
; }
	LDD  R17,Y+0
	ADIW R28,10
	RET
;
;#pragma used-
;
;#asm("sei")
	sei
;
;#include <stdio.h>
;
;//unsigned char test[10] = {1,2,3,4,5,6,7,8,9,0};
;unsigned char test[10] = {1,2,1,2,1,2,1,2,1,2};

	.DSEG
;
;void main(void)
; 0000 000C {

	.CSEG
_main:
; 0000 000D // Declare your local variables here
; 0000 000E 
; 0000 000F // Input/Output Ports initialization
; 0000 0010 // Port A initialization
; 0000 0011 // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
; 0000 0012 // State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
; 0000 0013 PORTA=0x00;
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0000 0014 DDRA=0xFF;
	LDI  R30,LOW(255)
	OUT  0x1A,R30
; 0000 0015 
; 0000 0016 // Port B initialization
; 0000 0017 // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
; 0000 0018 // State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
; 0000 0019 PORTB=0x00;
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 001A DDRB=0x00;
	OUT  0x17,R30
; 0000 001B 
; 0000 001C // Port C initialization
; 0000 001D // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
; 0000 001E // State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
; 0000 001F PORTC=0x00;
	OUT  0x15,R30
; 0000 0020 DDRC=0x00;
	OUT  0x14,R30
; 0000 0021 
; 0000 0022 // Port D initialization
; 0000 0023 // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
; 0000 0024 // State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
; 0000 0025 PORTD=0x00;
	OUT  0x12,R30
; 0000 0026 DDRD=0x00;
	OUT  0x11,R30
; 0000 0027 
; 0000 0028 // Timer/Counter 0 initialization
; 0000 0029 // Clock source: System Clock
; 0000 002A // Clock value: Timer 0 Stopped
; 0000 002B // Mode: Normal top=0xFF
; 0000 002C // OC0 output: Disconnected
; 0000 002D TCCR0=0x00;
	OUT  0x33,R30
; 0000 002E TCNT0=0x00;
	OUT  0x32,R30
; 0000 002F OCR0=0x00;
	OUT  0x3C,R30
; 0000 0030 
; 0000 0031 // Timer/Counter 1 initialization
; 0000 0032 // Clock source: System Clock
; 0000 0033 // Clock value: Timer1 Stopped
; 0000 0034 // Mode: Normal top=0xFFFF
; 0000 0035 // OC1A output: Discon.
; 0000 0036 // OC1B output: Discon.
; 0000 0037 // Noise Canceler: Off
; 0000 0038 // Input Capture on Falling Edge
; 0000 0039 // Timer1 Overflow Interrupt: Off
; 0000 003A // Input Capture Interrupt: Off
; 0000 003B // Compare A Match Interrupt: Off
; 0000 003C // Compare B Match Interrupt: Off
; 0000 003D TCCR1A=0x00;
	OUT  0x2F,R30
; 0000 003E TCCR1B=0x00;
	OUT  0x2E,R30
; 0000 003F TCNT1H=0x00;
	OUT  0x2D,R30
; 0000 0040 TCNT1L=0x00;
	OUT  0x2C,R30
; 0000 0041 ICR1H=0x00;
	OUT  0x27,R30
; 0000 0042 ICR1L=0x00;
	OUT  0x26,R30
; 0000 0043 OCR1AH=0x00;
	OUT  0x2B,R30
; 0000 0044 OCR1AL=0x00;
	OUT  0x2A,R30
; 0000 0045 OCR1BH=0x00;
	OUT  0x29,R30
; 0000 0046 OCR1BL=0x00;
	OUT  0x28,R30
; 0000 0047 
; 0000 0048 // Timer/Counter 2 initialization
; 0000 0049 // Clock source: System Clock
; 0000 004A // Clock value: Timer2 Stopped
; 0000 004B // Mode: Normal top=0xFF
; 0000 004C // OC2 output: Disconnected
; 0000 004D ASSR=0x00;
	OUT  0x22,R30
; 0000 004E TCCR2=0x00;
	OUT  0x25,R30
; 0000 004F TCNT2=0x00;
	OUT  0x24,R30
; 0000 0050 OCR2=0x00;
	OUT  0x23,R30
; 0000 0051 
; 0000 0052 // External Interrupt(s) initialization
; 0000 0053 // INT0: Off
; 0000 0054 // INT1: Off
; 0000 0055 // INT2: Off
; 0000 0056 MCUCR=0x00;
	OUT  0x35,R30
; 0000 0057 MCUCSR=0x00;
	OUT  0x34,R30
; 0000 0058 
; 0000 0059 // Timer(s)/Counter(s) Interrupt(s) initialization
; 0000 005A TIMSK=0x00;
	OUT  0x39,R30
; 0000 005B 
; 0000 005C // USART initialization
; 0000 005D // Communication Parameters: 8 Data, 1 Stop, No Parity
; 0000 005E // USART Receiver: On
; 0000 005F // USART Transmitter: On
; 0000 0060 // USART Mode: Asynchronous
; 0000 0061 // USART Baud Rate: 9600
; 0000 0062 UCSRA=0x00;
	OUT  0xB,R30
; 0000 0063 UCSRB=0xD8;
	LDI  R30,LOW(216)
	OUT  0xA,R30
; 0000 0064 UCSRC=0x86;
	LDI  R30,LOW(134)
	OUT  0x20,R30
; 0000 0065 UBRRH=0x00;
	LDI  R30,LOW(0)
	OUT  0x20,R30
; 0000 0066 UBRRL=0x33;
	LDI  R30,LOW(51)
	OUT  0x9,R30
; 0000 0067 
; 0000 0068 // Analog Comparator initialization
; 0000 0069 // Analog Comparator: Off
; 0000 006A // Analog Comparator Input Capture by Timer/Counter 1: Off
; 0000 006B ACSR=0x80;
	LDI  R30,LOW(128)
	OUT  0x8,R30
; 0000 006C SFIOR=0x00;
	LDI  R30,LOW(0)
	OUT  0x30,R30
; 0000 006D 
; 0000 006E // ADC initialization
; 0000 006F // ADC disabled
; 0000 0070 ADCSRA=0x00;
	OUT  0x6,R30
; 0000 0071 
; 0000 0072 // SPI initialization
; 0000 0073 // SPI disabled
; 0000 0074 SPCR=0x00;
	OUT  0xD,R30
; 0000 0075 
; 0000 0076 // TWI initialization
; 0000 0077 // TWI disabled
; 0000 0078 TWCR=0x00;
	OUT  0x36,R30
; 0000 0079 
; 0000 007A #asm("sei")
	sei
; 0000 007B 
; 0000 007C 
; 0000 007D while (1)
; 0000 007E       {
; 0000 007F       transmit_rs_pac(1,3,0,10,test,10);
	LDI  R30,LOW(1)
	ST   -Y,R30
	LDI  R30,LOW(3)
	ST   -Y,R30
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	ST   -Y,R31
	ST   -Y,R30
	LDI  R30,LOW(10)
	LDI  R31,HIGH(10)
	ST   -Y,R31
	ST   -Y,R30
	LDI  R30,LOW(_test)
	LDI  R31,HIGH(_test)
	ST   -Y,R31
	ST   -Y,R30
	LDI  R26,LOW(10)
	RCALL _transmit_rs_pac
; 0000 0080       //delay_ms(1000);
; 0000 0081       while (1){}
_0x27:
	RJMP _0x27
; 0000 0082       }
; 0000 0083 }
_0x2A:
	RJMP _0x2A
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG

	.CSEG

	.CSEG

	.DSEG
_rs_buffer:
	.BYTE 0x28
_test:
	.BYTE 0xA

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x0:
	MOV  R30,R17
	LDI  R31,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x1:
	LDI  R30,LOW(_rs_buffer)
	LDI  R31,HIGH(_rs_buffer)
	ST   -Y,R31
	ST   -Y,R30
	MOV  R26,R17
	SUBI R26,-LOW(6)
	JMP  _CRCode


	.CSEG
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

;END OF CODE MARKER
__END_OF_CODE:
