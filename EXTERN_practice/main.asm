TITLE String Library Demo	(StringDemo.asm)

; This program demonstrates the string-handling procedures in 
; the book's link library.

INCLUDE Irvine32.inc
EXTERN	trim_string@0:PROC
EXTERN	upper_case@0:PROC
EXTERN	compare_strings@0:PROC
EXTERN	print_length@0:PROC

trim_string	EQU	trim_string@0
upper_case	EQU	upper_case@0
compare_strings	EQU	compare_strings@0
print_length	EQU	print_length@0

.data
string_1 BYTE "abcde////",0
string_2 BYTE "ABCDE",0
msg0     BYTE "string_1 in upper case: ",0
msg1     BYTE "string1 and string2 are equal",0
msg2     BYTE "string_1 is less than string_2",0
msg3     BYTE "string_2 is less than string_1",0
msg4     BYTE "Length of string_2 is ",0
msg5     BYTE "string_1 after trimming: ",0
.code

main PROC
	call	Clrscr

	push	OFFSET msg5
	push	OFFSET string_1
	call	trim_string

	push	OFFSET msg0
	push	OFFSET string_1
	call	upper_case

	push	LENGTHOF string_1
	push	LENGTHOF string_2
	push	OFFSET msg1
	push	OFFSET msg2
	push	OFFSET msg3
	call	compare_strings	

	push	OFFSET msg4
	push	OFFSET string_2
	call	print_length

	exit
main ENDP
END main