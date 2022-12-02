INCLUDE Irvine32.inc

.code
upper_case PROC
; Convert string_1 to upper case.
	msg0	EQU	[ebp+12]
	string_1	EQU	[ebp+8]
	enter	0,0
	mov	edx, msg0
	call	WriteString
	INVOKE Str_ucase,string_1
	mov	edx,string_1
	call	WriteString
	call	Crlf
	leave
	ret	8
upper_case ENDP
END