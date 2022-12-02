INCLUDE Irvine32.inc

.data
hint1 BYTE "please input a integer(1~11)"
hint2 BYTE "!=",0
.code
main proc
	mov ecx,0
	call ReadDec
	push eax
	call Factorial
	exit
main endp
Factorial PROC
	push ebp
	mov ebp,esp
	mov eax,[ebp+8]
	cmp eax,0
	ja L1
	mov eax,1
	jmp L2
L1: dec eax
	push eax
	call Factorial
ReturnFact:
	inc ecx
	push eax
	mov eax,ecx
	call WriteDec
	pop eax
	mov edx,OFFSET hint2
	call WriteString

	mov ebx,[ebp+8]
	mul ebx
	call WriteDec
	call crlf
L2: pop ebp
	ret 4
Factorial ENDP
end main