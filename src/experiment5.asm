assume cs:codesg,ds:data,ss:stack

;data segment 
data segment 
	dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
data ends 

stack segment
	dw 0H,0H,0H,0H,0H,0H,0H,0H
stack ends 

; reverse data content
codesg segment
start:
	mov ax,stack
	mov ss,ax
	mov sp,16H

	mov ax,data
	mov ds,ax 

	push ds:[0]	
	push ds:[2]	
	pop ds:[0]	
	pop ds:[2]	
	
	mov ax,4c00H
	int 21H

codesg ends
end start 
