INCLUDE Irvine32.inc
.code
print_length PROC
; Display the length of string_2.
	msg4	EQU	[ebp+12]
	string_2	EQU	[ebp+8]
	enter	0,0
	mov	edx, msg4
	call	WriteString
	INVOKE Str_length,string_2
	call	WriteDec
	call	Crlf
	leave
	ret	8
print_length ENDP
END