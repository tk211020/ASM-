INCLUDE	string.inc

.code
upper_case PROC
; Convert string_1 to upper case.

	mov	edx,OFFSET msg0
	call	WriteString
	INVOKE Str_ucase, ADDR string_1
	mov	edx,OFFSET string_1
	call	WriteString
	call	Crlf

	ret
upper_case ENDP
END