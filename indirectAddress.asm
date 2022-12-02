INCLUDE Irvine32.inc

.data
title1 BYTE "source:" ,0
title2 BYTE "target:" ,0
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP(0)
.code
main PROC
	mov esi, OFFSET source
	mov edi, OFFSET target
	mov ecx,SIZEOF source
	L1:
		mov al,[esi]
		mov [edi], al
		inc esi
		inc edi
		loop L1 	

		mov edx,OFFSET title1
		call WriteString
		mov edx,OFFSET source
		call WriteString
		call Crlf
		mov edx,OFFSET title2
		call WriteString
		mov edx,OFFSET target
		call WriteString

		
		invoke ExitProcess,0
main endp
end main