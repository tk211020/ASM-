include Irvine32.inc
.data
ENTER_KEY =13
ErrorMsg BYTE	"Invalid input" , 0
FinMsg BYTE "Vaild input" , 0
.code
main proc

StateA:	;第一位數
		call	Getnext
		cmp		al,'0'
		je		StateB	
		call	IshDigit
		jz		StateD	
		call	pErrorMsg
		jmp		Quit

StateB:	;第二位數 
		call	Getnext
		cmp		al,'x'
		je		StateC
		cmp		al,'X'
		je		StateC
		call	IshDigit
		jz		StateD
		call	pErrorMsg
		jmp		Quit
StateC:	;0x已讀到
		call	Getnext
		call	IshDigit	;是數字就繼續判斷
		jz		StateC
		cmp		al,ENTER_KEY	;輸入ENTER 跳到Finish
		je		Finish
		call	pErrorMsg
		jmp		Quit
StateD:	;前面皆數字 判斷最後為h或H
		call	Getnext
		cmp		al,'h'
		je		Finish
		cmp		al,'H'
		je		Finish

		call	IshDigit	;是數字就繼續判斷
		jz		StateD

		cmp		al,ENTER_KEY	;輸入ENTER 跳到Quit (沒有輸入h)
		call	pErrorMsg
		jmp		Quit
		call	pErrorMsg
		jmp		Quit

		
Quit:
		call	Crlf
		exit
Finish:
		call	crlf
		mov	edx,OFFSET	FinMsg
		call	WriteString
		exit
main endp

IshDigit PROC
		cmp		al,'0' 
		jb		ID1
		cmp		al,'F' 
		ja		ID1
		test	ax,0 
		ID1:	
				ret
IshDigit ENDP

Getnext PROC
		call	ReadChar
		call	WriteChar
		ret
Getnext	ENDP

pErrorMsg PROC
		call	Crlf
		mov	edx,OFFSET	ErrorMsg
		call	WriteString
		ret
pErrorMsg ENDP
end main