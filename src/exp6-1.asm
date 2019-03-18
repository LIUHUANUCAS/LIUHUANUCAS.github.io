assume cs:codesg,ds:data
;upcase latter to lowcase latter or revserse
;chara & 11011111B -> to upcase
;charb & ~(11011111B) -> to lowercase
data segment
db 'BaSiC'
db 'iNfOrMaTiOn'
data ends

codesg segment
start:
	mov ax,data
	mov ds,ax
	mov bx,0
	mov cx,5
	s:
		mov al,[bx]
		and al,11011111B
		mov [bx],al
		inc bx
		loop s 
	mov bx,5
	mov cx,11
	s0:
		mov al,[bx]
		or al,00100000B
		mov [bx],al
		inc bx
		loop s0
	mov ax,4c00H
	int 21H

codesg ends
end start 
