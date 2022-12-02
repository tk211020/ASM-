; AddTwoSum.asm - Chapter 3 example.

include Irvine32.inc

.data
sum dword 0
messg1 byte "Please enter first number: ", 0
messg2 byte  "Please enter first number: ", 0
messg3 byte  "The sum is: "
.code
main proc
	mov edx, offset messg1
	call WriteString
	call ReadDec
	call Crlf
	mov ebx, eax
	
	mov edx, offset messg2
	call WriteString
	call ReadDec
	call Crlf
	
	add eax, ebx
	mov sum,eax

	mov edx, offset messg3
	call WriteString
	call WriteDec
	call Crlf
	

	invoke ExitProcess,0
main endp
end main