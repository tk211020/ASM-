INCLUDE string.inc

.code
trim_string PROC
; Remove trailing characters from string_1.

	INVOKE Str_trim, ADDR string_1,'/'
	mov	edx,OFFSET msg5
	call	WriteString
	mov	edx,OFFSET string_1
	call	WriteString
	call	Crlf

	ret
trim_string ENDP
END