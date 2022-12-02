INCLUDE Irvine32.inc
.data
	hint0 BYTE "Please enter 1~5 to choose mode",0Dh,0Ah
		  BYTE		"(1)輸入3個正整數並求其總和與平均",0Dh,0Ah
		  BYTE		"(2)輸入3個整數，求其反轉順序" ,0Dh,0Ah
		  BYTE		"(3)模擬大樂透遊戲" ,0Dh,0Ah
	 	  BYTE		"(4)模擬DAA指令" ,0Dh,0Ah
		  BYTE		"(5)結束" , 0Dh,0Ah,0
	hint1 BYTE "Please enter a postive integer", 0Dh,0Ah,0
	hint11 BYTE "the sum is:",0
	hint1a BYTE "the average is:",0
	hint2 BYTE "Please enter a integer", 0Dh,0Ah,0
	hint31 BYTE "The number of super lotto you choose are:" ,0
	hint32 BYTE "and special number is:"
	hint41 BYTE "enter first number:",0
	hint42 BYTE "enter second number:" ,0
	CF1 BYTE "CF=1",0
	CF0 BYTE "CF=0",0
	hint44 BYTE "Output:",0
	hinte BYTE "PLEASE ENTER CORRECT NUMBER!!",0
	hintb BYTE "BYEBYE",0
	arrayL BYTE 38 DUP(0)
	thesum DWORD 0
	arrayD DWORD 3 DUP(0)
.code
main PROC

top:	call CRLF
		mov edx,OFFSET hint0
		call WriteString
		call ReadDec
		cmp eax,1
		je P1
		cmp eax,2
		je P2
		cmp eax,3
		je P3
		cmp eax,4
		je P4
		cmp eax,5
		je P5
		mov edx,OFFSET hinte
		call WriteString
		jmp top
P1: call AddThree
	mov edx,OFFSET hint11
	call WriteDec
	call Ave
	call WriteDec
	call CRLF
	jmp top
P2:
	call RevThree
	jmp top
P3:
	call Lotto
	jmp top
P4:
	call mDAA
	jmp top
P5:
	mov edx,OFFSET hintb
	call WriteString
	exit
	
main ENDP


AddThree PROC
 
	mov edx,OFFSET hint1
	call WriteString
	call ReadDec
	call Crlf
	mov ebx,eax

	call WriteString
	call ReadDec
	call Crlf
	add eax,ebx
	mov thesum,eax

	call WriteString
	call ReadDec
	call Crlf
	add eax,thesum
	mov thesum,eax

	mov edx,OFFSET hint11
	call WriteString
	ret

AddThree ENDP

Ave  PROC
	call Crlf
	mov edx,OFFSET hint1a
	call WriteString

	mov edx,0
	mov eax,thesum
	mov ecx,3
	div ecx
	ret
Ave ENDP

RevThree PROC
	mov edx,OFFSET hint2
	call WriteString
	call ReadDec
	mov arrayD,eax

	mov edx,OFFSET hint2
	call WriteString
	call ReadDec
	mov arrayD+4,eax

	mov edx,OFFSET hint2
	call WriteString
	call ReadDec
	mov arrayD+8,eax
	
	mov eax , arrayD
	xchg eax, arrayD+8
	call WriteDec

	mov eax , arrayD+4
	call WriteDec

	mov eax , arrayD
	call WriteDec
	ret
RevThree ENDP

Lotto PROC
	call Randomize
	mov edx,OFFSET hint31
	call WriteString

	mov ecx,6
L1:	mov eax,49
	call RandomRange

	cmp arrayL[eax],1
	je L1
	mov arrayL[eax],1
	inc eax
	call WriteDec
	mov al," "
	call WriteChar
	loop L1
	call Crlf

	mov edx,OFFSET hint32
	call WriteString
	mov eax,49
	call RandomRange
	inc eax
	call WriteDec
	ret
Lotto ENDP

mDAA PROC
	clc
	mov edx,offset hint41
	call WriteString
	call ReadHex
	mov bl,al
	mov edx,offset hint42
	call WriteString
	call ReadHex
	add bl,al
	mov al,bl
	LAHF
	mov bh,ah
	and bh,10h
	mov bl,bh

	;daa
	mov dl,al
		and dl,0Fh
	.IF(dl>9)||(bl==16)
		add al,6
		mov bl,16
	.Else 
		mov bl,0
	.Endif
		mov dl,al
		and dl,0F0h
		.IF(dl>90h)||(bl==1)
		add al,60h
		mov bh,1
		.Else
		mov bh,0
		.Endif
	;daa over
	mov edx,OFFSET hint44
	call WriteString
	movzx eax,al
	call WriteHex
	call crlf
	AND ah,1
	jz NCF
	mov edx,OFFSET CF1
	call WriteString
	ret
NCF:
	mov edx,OFFSET CF0
	call WriteString
	ret
mDAA ENDP
END main