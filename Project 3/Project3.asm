;Melvin Moreno
;mem0282
;Melvin_Moreno.asm
;I received help from Matthew Freestone.

; This program add and subtracts 32-bit Integers

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    shift dword 2
    input byte 1,2,3,4,5,6,7,8
    output byte lengthof input dup(?)	
.code
    main proc
	mov eax, 0			;This loop will iterate length - shift times. 
	mov ebx, 0
	mov ecx, LENGTHOF input			;(this loop will place the 'non-wrapped' values)
	sub ecx, shift			;Start writing from input at shift
	mov edx, shift			;Start reading at 0
    l1:	
		mov al, input[ebx]			;Move the value from input into al
		mov output[edx], al			;Move the value from al into output
		inc ebx		;Increment the input index
		inc edx			;Increment the output index
    	loop l1

		mov ecx, shift			;This loop will iterate shift times
		mov edx, 0			;Start reading at index length - shift
		mov ebx, LENGTHOF input			;Start writing at index 0.  
		sub ebx, shift			;(this loop will place the 'wrapped' values)
    l2:	
	mov al, input[ebx]			;Move the value from input into al
	mov output[edx], al			;Move the value from al into output
	inc ebx			;Increment the input index
	inc edx			;Increment the output index
	loop l2

INVOKE ExitProcess,0
main ENDP
END main
