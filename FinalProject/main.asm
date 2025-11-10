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
;Procedure: This function will take two user input positive integers with values less than 65000 (each) and print the result of the multiplication of those
;two numbers to the console.
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

	mov EBX, EAX; puts the value of the first input into EBX for later multiplication IS


	;calling _readLine for the second input IS

	push offset numChar; readline is first called to reset the input buffer IS
	push offset receivedInput; then called again to get the user's input. IS
	call _readLine
	add ESP, 8

	push offset numChar; pushes numChar as parameter 2 for readLine IS
	push offset receivedInput; pushes receivedInput as parameter 1 for readLine IS
	call _readLine
	add ESP, 8

	;calling _atoi for the second input IS

	push offset receivedInput; pushes receivedInput as parameter 1 for atoi IS
	call _atoi
	add ESP, 4

	;performing multiplication between the two inputs

	mul EBX; multiplies EAX by EBX and stores the result in EAX (The result should never be large enough to overflow into EDX. If it does, that is a problem) ISxddddddddddddddddddd

	push EAX
	call _ExitProcess@4

main ENDP
END
