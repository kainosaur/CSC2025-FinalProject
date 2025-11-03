.386P
.model flat
extern _ExitProcess@4:near

; Our defined procedures
extern _atoi:near
extern _itoa:near
extern _readLine:near
extern _writeLine:near

.data

.code
; Kain/ Isaac
main PROC
	call _atoi
	call _itoa
	call _readLine
	call _writeLine

	call _ExitProcess@4

main ENDP
END
