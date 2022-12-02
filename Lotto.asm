INCLUDE  Irvine32.inc

.data
	hint1 BYTE "The number of super lotto you choose are:" ,0
	hint2 BYTE "and special number is:"
	array BYTE 38 DUP(0)

.code
main proc
	call Randomize
	mov edx,OFFSET hint1
	call WriteString
	call ran1

	mov edx,OFFSET hint2
	call WriteString
	call ran2
	invoke ExitProcess,0
main endp

ran1 PROC
	mov ecx,6
L1:	mov eax,38
	call RandomRange

	cmp array[eax],1
	je L1
	mov array[eax],1
	inc eax
	call WriteDec
	mov al," "
	call WriteChar
	loop L1
	call Crlf
	ret		
ran1 ENDP

ran2 PROC
	mov eax,8
	call RandomRange
	inc eax
	call WriteDec
	ret
ran2 ENDP
 
end main