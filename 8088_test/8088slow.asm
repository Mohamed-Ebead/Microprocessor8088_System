;test8088.asm

.MODEL small                ;64K Max Size

;****************************
PORTA equ 20h
PORTB equ 40h
;****************************

.CODE
	
         ORG     0000h            ;Start of code	

init:    nop
 	 in al, PORTA            ; input a byte from PORTA  
         mov bl, al   	 

outport: not al
         out PORTB, al           ; output the byte to PORTB
	
	 mov dx, 0ffffh
delay:	 dec dx
	 jnz delay
	
	 inc bl
         mov al, bl
	 jmp outport
	
	 INT 3                  ;Halt
	
	 ORG	0FF0h         ;restart address (FFFF:0000)
 
startup: 
	nop
	cli                   ;disable interrupts
	jmp init              ;jump to the start of the program 

	end startup