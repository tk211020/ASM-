

INCLUDE String.inc

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

	INVOKE	trim_string,ADDR string_1,ADDR msg5
	INVOKE	upper_case,ADDR string_1,ADDR msg0
	INVOKE	compare_strings,ADDR string_1,ADDR string_2,ADDR msg1,ADDR msg2,ADDR msg3
	INVOKE	print_length,ADDR string_2,ADDR msg4

	exit
main ENDP



END main