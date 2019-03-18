assume cs:codesg,ds:data,ss:stacksg
;upcase latter to lowcase latter or revserse
;chara & 11011111B -> to upcase
;charb & ~(11011111B) -> to lowercase
;array first latter to upcase latter
stacksg segment
db 0,0,0,0,0,0,0,0
stacksg ends
data segment
db '1. display      '
db '2. brows        '
db '3. replace      '
db '4. modify       '
data ends

codesg segment
start:
	; init stack space
	mov ax,stacksg
	mov ss,ax
	mov sp,16

	mov ax,data
	mov ds,ax 
	mov bx,0
	mov cx,4
	out:
		push cx
		mov si,0
		mov cx,4
	inner:
		mov al,[bx+3+si];ds:[bx+si+3]-> a[i][3]
		and al,11011111B ; to upcase latter
		mov [bx+3+si] ,al
		inc si
		loop inner

		add bx,16 ; a[i+1]
		pop cx
		loop out

	mov ax,4c00H
	int 21H

codesg ends
end start 
