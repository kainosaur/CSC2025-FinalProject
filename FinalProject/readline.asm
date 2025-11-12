.386P
.model flat
public _readLine
extern _ReadConsoleA@20: near
; Isaac
.code

;Name: Isaac Seyer
;Procedure: This function takes a location in memory meant to store a string as the first parameter, then takes a location in memory meant to store how many characters
;			were read, calls the external function ReadConsoleA@20 using the aforementioned parameters, then returns to the main function. 
;Parameters: 1) A memory location meant to store a string
;			2) A memory location meant to store an integer
;Return: N/A


_readLine PROC

	push EBP
	mov EBP, ESP

	mov EAX, [EBP + 16]; puts parameter 3 into EAX IS
	mov ECX, [EBP + 12]; puts parameter 2 into ECX IS
	mov EDX, [EBP + 8]; puts parameter 1 into EDX IS


	push 0
	push ECX; provides the address of numInputs for the function to put how many inputs it read IS
	push 5; the maximum number of inputs allowed. IS 
	push EDX; provides the address of string so the input can be received in the string array IS
	push EAX; provides the standard read handle

	call _ReadConsoleA@20

	mov ESP, EBP
	pop EBP
	ret 0
_readLine ENDP
END