.386P
.model flat
public _atoi
; Isaac
.code
;Name: Isaac Seyer
;Procedure: This function takes a parameter containing a location in memory which contains a string, iterates through that string and converts the string
;			into an integer stored in EAX
;Parameters: 1) a location in memory which contains a string
;Return: an integer stored in EAX
_atoi PROC
	push EBP
	mov EBP, ESP

	push EBX
	push ESI
	push EDI

	;Isaac - The following segment of code has largely been taken from my (Isaac's) previous AtoI project with changes in the registers used and how parameters
	; are accessed to fit the current project. 

	mov EBX, [EBP + 8]; Takes the first parameter as an input (in this case receivedInput) IS
	mov EAX, 0; Sets the value in EAX to 0 IS
	mov EDX, 0; Sets the value in EDX to 0 IS
	mov ECX, 10; Sets the value in ECX to 10 for future multiplication IS
	mov ESI, 0; ESI serves as the true flag for if numConversion has been passed through at all IS
	mov EDI, 0; EDI serves as the true flag for if numConversion has been passed through this loop IS
	;The following block of code checks if the input is within the range of 48-57 (inclusive), and if it is not 
	;sends the program past the number conversion and to the incrementing of the receivedInput pointer IS

	numApproach:mov EDI, 0; numConversions iterated through this loop = false IS
	cmp BYTE PTR [EBX], 48
	jl arrayIncrement
	cmp BYTE PTR [EBX], 57
	jg arrayIncrement
	
	
	numConversion: mov DL, BYTE PTR [EBX]; Takes the value at current receivedInput byte and copies it to EDX IS
	sub DL, 48; subtracts 48 from the value in EDX to convert it to an integer IS
	add EAX, EDX; Adds the integer in EDX to EAX IS
	mul ECX; multiplies EAX by ten to make room for more digits while setting EDX to 0 IS
	mov ESI, 1; iterated through at all = true IS
	mov EDI, 1; iterated through this loop = true IS

	arrayIncrement: inc EBX; increments the inputString address location IS

	cmp ESI, EDI; checks if the numConversion section has been iterated through previously and this loop IS
	jne Finish; jumps to finish if numConversion was not iterated through this loop and was previously iterated through IS

	cmp BYTE PTR[EBX], 0; Checks if the string has reached the null ptr IS
	jne numApproach; Jumps to num Approach if not at the null ptr IS

	Finish:
	div ECX; divides EAX by 10 to match the actual number

	pop EDI
	pop ESI
	pop EBX

	mov ESP, EBP
	pop EBP
	ret 0
_atoi ENDP
END