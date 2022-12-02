INCLUDE Irvine32.inc
.data
num1	DWORD	1
num2	DWORD	0
.code
main PROC
	push 20
	call Fibonacci 
	call Crlf
	exit
main ENDP

Fibonacci PROC
	push ebp
	mov  ebp,esp
	mov  eax,[ebp+8]
	cmp  eax,0
	ja   L1	
	mov  eax,1
	jmp  L2
L1:dec  eax
	push eax	
	call Fibonacci
ReturnFact:
	mov  ebx,num2   
	add  num1,ebx          	
	mov  eax,num1
	call WriteDec
	call Crlf
	mov num1,ebx
	mov num2,eax

L2:	pop  ebp
	ret  4	
Fibonacci ENDP

END main