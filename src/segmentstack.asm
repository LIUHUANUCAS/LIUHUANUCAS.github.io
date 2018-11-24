assume cs:codesg

codesg segment
; data segment 
dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
dw 0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H,0H
start:
	mov ax,cs
	mov ss,ax
	mov sp,30H
	mov bx,0
	mov cx,08H 

	s: 
		push cs:[bx]
		add bx,02H 
	loop s

	mov bx,0H 
	mov cx ,08H 
	
	s1 :
		pop cs:[bx]
		add bx,02H 
		loop s1

	mov ax,4c00H
	int 21H

codesg ends
end start 
