
INCLUDE string.inc

.code

main PROC
	INVOKE	trim_string
	INVOKE	upper_case
	INVOKE	compare_strings	
	INVOKE	print_length

	exit
main ENDP
END main