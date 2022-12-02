INCLUDE	string.inc

.code
print_length PROC
; Display the length of string_2.

	mov	edx,OFFSET msg4
	call	WriteString
	INVOKE Str_length, ADDR string_2
	call	WriteDec
	call	Crlf

	ret
print_length ENDP
END