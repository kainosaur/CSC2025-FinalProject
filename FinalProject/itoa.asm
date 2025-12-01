.386P
.model flat
public _itoa
.code
; Kain Dean
; Procedure: input value and base and write to a string.
; Parameters: 1) value to convert, 2) write pointer to make string, 3) base
; Return: N/A
_itoa PROC
	; Prologue
    push    ebp
    mov     ebp, esp
    push    esi
    push    edi
    push    ebx

	; itoa (in_num, out_str, in_base)
	mov eax, [ebp + 8]	; value
	mov edi, [ebp + 12]	; write pointer
	mov ecx, [ebp + 16]	; base

	mov esi, edi	; esi = start of buffer

	; Handle 0 edge case
	cmp eax, 0
	jne convert
	mov byte ptr [edi], '0'
	mov byte ptr [edi + 1], 0

	convert:
		mov edx, 0
		div ecx			; eax = quotient, edx = remainder
		add dl, '0'		; ascii conversion of num to char
		mov [edi], dl
		inc edi
		cmp eax, 0
		jne convert

	
	mov byte ptr [edi], 0 ; Add null byte to end of string

	dec edi ; points to last character

	; Reverse the string
	reverse_str:
		cmp esi, edi
		jge done
		mov al, [esi]
		mov ah, [edi]
		mov [esi], ah
		mov [edi], al
		inc esi
		dec edi
		jmp reverse_str

	done:
	mov eax, [ebp+12]	; return

	pop ebx
	pop edi
	pop esi
	mov esp, ebp
	pop ebp
	ret

_itoa ENDP
END