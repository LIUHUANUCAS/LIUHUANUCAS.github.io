assume cs:codesg

codesg segment

	mov ax,20H
	mov ds,ax
	mov bx,0H
	mov cx,40H
	s: mov [bx],bx
	inc bx
	loop s

	mov ax,4c00H
	int 21H

codesg ends
end
