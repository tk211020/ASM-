TITLE Reversing a String          (RevStr.asm)

; This program reverses a string.

INCLUDE Irvine32.inc

.data
aName BYTE 50 DUP(0)
bytecount DWORD ?

.code
main PROC

; Push the name on the stack.
	mov edx,OFFSET aName
	mov ecx,SIZEOF aName
	call ReadString
	mov bytecount,eax
	mov	ecx,bytecount
	mov	esi,0


L1:	movzx eax,aName[esi]	; get character
	push	eax				; push on stack
	inc	esi
	loop L1

; Pop the name from the stack, in reverse,
; and store in the aName array.

	mov	ecx,bytecount
	mov	esi,0

L2:	pop eax				; get character
	mov	aName[esi],al		; store in string
	inc	esi
	loop L2

; Display the name.

	mov  edx,OFFSET aName
	call Writestring
	call Crlf

	exit
main ENDP
END main