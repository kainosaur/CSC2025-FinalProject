.386P
.model flat
extern _ExitProcess@4:near

; Our defined procedures
extern _atoi:near
extern _itoa:near
extern _readLine:near
extern _writeLine:near
extern _GetStdHandle@4: near

.data
receivedInput DB 6 DUP(0)
outputString DB 11 DUP(?)
written DW ?
numChar DD 0
readHandle DD 0
writeHandle DD 0

.code
; Kain/ Isaac
;Name: Isaac Seyer
;Procedure: This function will take two user input positive integers with values less than 65000 (each) and print the result of the multiplication of those
;two numbers to the console.
;Parameters: N/A
;Return:N/A
main PROC

	push -11; parameter to get the write console handle from _GetStdHandle@4 KD
	call _GetStdHandle@4; retrieves write console handle place in EAX KD
	mov writeHandle, EAX

	push -10; this is the parameter which will get a read only handle from _GetStdHandle@4 IS
	call _GetStdHandle@4; stores the handle in EAX IS
	mov readHandle, EAX

	;calling _readLine for the first input IS
	
	push readHandle; pushes the value in readHandle as parameter 3 for readline IS
	push offset numChar; pushes numChar as parameter 2 for readLine IS
	push offset receivedInput; pushes receivedInput as parameter 1 for readLine IS
	call _readLine
	add ESP, 12



	;calling _atoi for the first input IS

	push offset receivedInput; pushes receivedInput as parameter 1 for atoi IS
	call _atoi
	add ESP, 4

	mov EBX, EAX; puts the value of the first input into EBX for later multiplication IS


	;calling _readLine for the second input IS

	push readHandle; pushes the value in readHandle as parameter 3 for readline IS
	push offset numChar; readline is first called to reset the input buffer IS
	push offset receivedInput; then called again to get the user's input. IS
	call _readLine
	add ESP, 12

	push readHandle; pushes the value in readHandle as parameter 3 for readline IS
	push offset numChar; pushes numChar as parameter 2 for readLine IS
	push offset receivedInput; pushes receivedInput as parameter 1 for readLine IS
	call _readLine
	add ESP, 12

	;calling _atoi for the second input IS

	push offset receivedInput; pushes receivedInput as parameter 1 for atoi IS
	call _atoi
	add ESP, 4

	;performing multiplication between the two inputs

	mul EBX; multiplies EAX by EBX and stores the result in EAX (The result should never be large enough to overflow into EDX. If it does, that is a problem) IS

	; Calling itoa function KD
	push 10			; base input
	push OFFSET outputString	; where the new itoa string will ive
	push eax		;the num to convert to string
	call _itoa
	add esp, 12

	; Calling write line with the num acquired from itoa KD
	push writeHandle   
	push OFFSET outputString
	push LENGTHOF outputString
	push OFFSET written
	call _writeLine
	add esp, 16

	push 0
	call _ExitProcess@4

main ENDP
END
