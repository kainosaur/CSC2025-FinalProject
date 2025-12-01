.386P
.model flat
public _writeLine
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
; Kain
.code
; Kain Dean
; Procedure: writes to console a sting provided. Uses WriteConsole from winapi.
; Parameters: 1) msg offset, 2) msg length, 3) msg arg, 4) write handle
; return: N/A
_writeLine PROC

	; Prologue
	push ebp
	mov ebp, esp
	sub esp, 6

	mov eax, [ebp + 8]		;msg offset
	mov edx, [ebp + 12]		;msg length
	mov edi, [ebp + 16]		;msg arg
	mov ebx, [ebp + 20]		;handle arg

	; WriteConsole(handle, &msg[0], numCharsToWrite, &written, 0) KD
	push 0
	push eax
	push edx
	push edi
	push ebx
	call _WriteConsoleA@20
	mov eax, 1


	; epilogue
	mov esp, ebp
	pop ebp
	ret 0

_writeLine ENDP
END