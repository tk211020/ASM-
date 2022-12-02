INCLUDE	string.inc

.code
compare_strings PROC
; Compare string_1 to string_2.

	INVOKE Str_compare, ADDR string_1, ADDR string_2
	.IF ZERO?
	mov	edx,OFFSET msg1
	.ELSEIF CARRY?
	mov	edx,OFFSET msg2     ; string 1 is less than...
	.ELSE
	mov	edx,OFFSET msg3     ; string 2 is less than...
	.ENDIF
	call	WriteString
	call	Crlf

	ret
compare_strings  ENDP
END