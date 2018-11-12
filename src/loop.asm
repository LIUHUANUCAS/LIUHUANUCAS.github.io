assume cs:codesg

codesg segment

	mov ax,2H
	mov cx,4
	s: add ax,ax
	loop s

	mov ax,4c00H
	int 21H

codesg ends
end
