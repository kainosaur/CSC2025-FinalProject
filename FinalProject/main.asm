.386P
.model flat
extern _ExitProcess@4:near

; Our defined procedures
extern _atoi:near
extern _itoa:near
extern _readLine:near
extern _writeLine:near

.data
receivedInput DB 6 DUP(0)
numChar DD 0

.code
; Kain/ Isaac
;Name: Isaac Seyer
;Procedure: This function will take two user input positive integers with values less than 65000 (each) and return the result of the multiplication of those two numbers.
;Parameters: N/A
;Return:N/A
main PROC
	
	call _itoa
	call _writeLine

	;calling _readLine for the first input IS
	
	push offset numChar; pushes numChar as parameter 2 for readLine IS
	push offset receivedInput; pushes receivedInput as parameter 1 for readLine IS
	call _readLine
	add ESP, 8

	;calling _atoi for the first input IS

	push offset receivedInput; pushes receivedInput as parameter 1 for atoi IS
	call _atoi
	add ESP, 4

	push EAX
	call _ExitProcess@4

main ENDP
END
