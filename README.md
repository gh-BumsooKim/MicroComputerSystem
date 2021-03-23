# MicroComputerSystem

**중앙대학교 창의ICT공과대학 전자전기공학부 - 마이크로컴퓨터시스템**

ARM MircroProcesser Core Assembly Language with Raspi 4B

```Assembly
		AREA	HelloW, CODE, READONLY
SWI_WriteC		EQU	&0
SWI_Exit		EQU	&11
		ENRTY
START		ADR	r1, TEXT
LOOP		LDRB	r0, [r1], #1
		CM	r0, #0
		SWINE	SWI_WriteC
		BNE	LOOP
		SWI	SWI_Exit
TEXT		=	"Hello World",&0a,&0d,0
		END
```
