
include Irvine32.inc

.data
arrayD DWORD 1,2,3
.code
main proc
	mov eax , arrayD
	xchg eax, arrayD+8 
	call WriteDec

	mov eax , arrayD+4
	xchg eax , arrayD+8
	call WriteDec

	mov eax , arrayD+2
	xchg eax , arrayD+8
	call WriteDec

	invoke ExitProcess,0
main endp
end main