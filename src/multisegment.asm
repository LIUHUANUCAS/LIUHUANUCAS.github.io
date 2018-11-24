assume cs:codesg,ds:data,ss:stack

;data segment 
data segment 
	dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
data ends 

stack segment
	dw 0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H
stack ends 

; reverse data content
codesg segment
start:
	mov ax,stack
	mov ss,ax
	mov sp,20H

	mov ax,data
	mov ds,ax 

	; push to stack
	mov bx,0H
	mov cx,08H 
	s: 
		push [bx]
		add bx,02H 
	loop s

	mov bx,0H 
	mov cx ,08H 
	
	;pop from stack
	s1 :
		pop [bx]
		add bx,02H 
		loop s1
		
	mov ax,4c00H
	int 21H

codesg ends
end start 
