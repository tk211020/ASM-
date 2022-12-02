INCLUDE Irvine32.inc

.code
trim_string PROC
; Remove trailing characters from string_1.
	msg5	EQU	[ebp+12]
	string_1	EQU	[ebp+8]
	enter	0,0
	INVOKE Str_trim,string_1,'/'
	mov	edx, msg5
	call	WriteString
	mov	edx, string_1
	call	WriteString
	call	Crlf

	leave
	ret	8
trim_string ENDP
END