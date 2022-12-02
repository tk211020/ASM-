INCLUDE Irvine32.inc

.code
compare_strings PROC
; Compare string_1 to string_2.
	string_1	EQU	[ebp+24]
	string_2	EQU	[ebp+20]
	msg1	EQU	[ebp+16]
	msg2	EQU	[ebp+12]
	msg3	EQU	[ebp+8]

	enter	0,0
	INVOKE Str_compare,ADDR string_1,ADDR string_2
	.IF ZERO?
	mov	edx, msg1
	.ELSEIF CARRY?
	mov	edx, msg2     ; string 1 is less than...
	.ELSE
	mov	edx, msg3     ; string 2 is less than...
	.ENDIF
	call	WriteString
	call	Crlf
	leave
	ret	8
compare_strings  ENDP
END