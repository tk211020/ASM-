include Irvine32.inc
.data
ENTER_KEY =13
ErrorMsg BYTE	"Invalid input" , 0
FinMsg BYTE "Vaild input" , 0
.code
main proc

StateA:	;�Ĥ@���
		call	Getnext
		cmp		al,'0'
		je		StateB	
		call	IshDigit
		jz		StateD	
		call	pErrorMsg
		jmp		Quit

StateB:	;�ĤG��� 
		call	Getnext
		cmp		al,'x'
		je		StateC
		cmp		al,'X'
		je		StateC
		call	IshDigit
		jz		StateD
		call	pErrorMsg
		jmp		Quit
StateC:	;0x�wŪ��
		call	Getnext
		call	IshDigit	;�O�Ʀr�N�~��P�_
		jz		StateC
		cmp		al,ENTER_KEY	;��JENTER ����Finish
		je		Finish
		call	pErrorMsg
		jmp		Quit
StateD:	;�e���ҼƦr �P�_�̫ᬰh��H
		call	Getnext
		cmp		al,'h'
		je		Finish
		cmp		al,'H'
		je		Finish

		call	IshDigit	;�O�Ʀr�N�~��P�_
		jz		StateD

		cmp		al,ENTER_KEY	;��JENTER ����Quit (�S����Jh)
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