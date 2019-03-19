assume cs:codesg

codesg segment
start:
	mov dx,1
	mov ax,86A1H
	mov bx,100
	div bx
	
	mov ax,1001
	mov bl,100
	div bl
	mov ax,4c00H
	int 21H

codesg ends
end start 
