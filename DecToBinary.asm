include Irvine32.inc

.data
	buffer BYTE 32 DUP(0),0
	hint1 BYTE "input a demical integer",0
	hint2 BYTE "binary:"
.code
main proc
	mov edx,OFFSET hint1
	call WriteString
	call crlf
	call ReadInt
	
	mov edx,OFFSET hint2
	call WriteString
	call DisBin
	call crlf
	mov edx,OFFSET buffer
	call WriteString
	invoke ExitProcess,0
main endp
	
DisBin PROC
	mov ecx,32
	mov esi,OFFSET buffer
	L1: shl eax,1
	mov BYTE PTR [esi],'0'
	jnc L2
	mov BYTE PTR [esi],'1'
	L2: inc esi
	loop L1
	ret
DisBin ENDP
end main