INCLUDE Irvine32.inc
INCLUDE macros.inc

BUFFER_SIZE = 501

.data
hint BYTE "Please enter 1~3 to choose mode",0Dh,0Ah
	 BYTE "(1)create file",0Dh,0Ah
	 BYTE "(2)read file" ,0Dh,0Ah
	 BYTE "(3)over the program" ,0Dh,0Ah,0
hinte BYTE "PLEASE ENTER CORRECT NUMBER!!",0
hintb BYTE "BYEBYE",0
buffer BYTE BUFFER_SIZE DUP(?)
filenameC     BYTE "output.txt",0

stringLength DWORD ?
bytesWritten DWORD ?
str1 BYTE "Cannot create file",0dh,0ah,0
str2 BYTE "Bytes written to file [output.txt]: ",0
str3 BYTE "Enter up to 500 characters and press "
     BYTE "[Enter]: ",0dh,0ah,0

	 
filenameR    BYTE 80 DUP(0)
fileHandle  HANDLE ?

.code
main PROC
top:	call CRLF
		mov edx,OFFSET hint
		call WriteString
		call ReadDec
		cmp eax,1
		je create
		cmp eax,2
		je read
		cmp eax,3
		je quit
		mov edx,OFFSET hinte
		call WriteString
		jmp top
create:
; Create a new text file.
	mov	edx,OFFSET filenameC
	call	CreateOutputFile
	mov	fileHandle,eax

; Check for errors.
	cmp	eax, INVALID_HANDLE_VALUE	; error found?
	jne	file_okC					; no: skip
	mov	edx,OFFSET str1			; display error
	call	WriteString
	jmp	top
file_okC:

; Ask the user to input a string.
	mov	edx,OFFSET str3		; "Enter up to ...."
	call	WriteString
	mov	ecx,BUFFER_SIZE		; Input a string
	mov	edx,OFFSET buffer
	call	ReadString
	mov	stringLength,eax		; counts chars entered

; Write the buffer to the output file.
	mov	eax,fileHandle
	mov	edx,OFFSET buffer
	mov	ecx,stringLength
	call	WriteToFile
	mov	bytesWritten,eax		; save return value
	mov	eax,fileHandle
	call	CloseFile
	
; Display the return value.
	mov	edx,OFFSET str2		; "Bytes written"
	call	WriteString
	mov	eax,bytesWritten
	call	WriteDec
	call	Crlf	
jmp top
;;;;;;;;;;;;;;;;;;;;;;;
read:
; Let user input a filename.
	mWrite "Enter an input filename: "
	mov	edx,OFFSET filenameR
	mov	ecx,SIZEOF filenameR
	call	ReadString

; Open the file for input.
	mov	edx,OFFSET filenameR
	call	OpenInputFile
	mov	fileHandle,eax

; Check for errors.
	cmp	eax,INVALID_HANDLE_VALUE		; error opening file?
	jne	file_okR				; no: skip
	mWrite <"Cannot open file",0dh,0ah>
	jmp	top						; and quit
file_okR:

; Read the file into a buffer.
	mov	edx,OFFSET buffer
	mov	ecx,BUFFER_SIZE
	call	ReadFromFile
	jnc	check_buffer_size			; error reading?
	mWrite "Error reading file. "		; yes: show error message
	call	WriteWindowsMsg
	jmp	close_file
	
check_buffer_size:
	cmp	eax,BUFFER_SIZE			; buffer large enough?
	jb	buf_size_ok				; yes
	mWrite <"Error: Buffer too small for the file",0dh,0ah>
	jmp	top						; and quit
	
buf_size_ok:	
	mov	buffer[eax],0		; insert null terminator
	mWrite "File size: "
	call	WriteDec			; display file size
	call	Crlf

; Display the buffer.
	mWrite <"Buffer:",0dh,0ah,0dh,0ah>
	mov	edx,OFFSET buffer	; display the buffer
	call	WriteString
	call	Crlf

close_file:
	mov	eax,fileHandle
	call	CloseFile
jmp top


quit:
	mov edx,OFFSET hintb
	call WriteString
	exit
main ENDP

END main