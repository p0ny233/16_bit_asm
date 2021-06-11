assume cs:code, ds:data
; 编程，将 data段中的每个单词都改为大写字母

	data segment
		db 'ibm             '
		db 'dec             '
		db 'dos             '
		db 'vax             '
	data ends
	
	code segment
		start:
			mov ax, data
			mov ds, ax
			mov bx,0
			mov cx, 4
			
			s:
				mov si,0 ; 每一次循环完之后需要初始化
				mov dx,cx
				mov cx,3 ;表示内层循环的次数
				s0:
					
					mov al,ds:[bx+si]
					and al,0dfh ;11011111b
					mov ds:[bx+si], al
					
					inc si
				loop s0
				
				
				;sub dx,1 这里不能使用指令让 循环次数减少，在loop 指令的时候自动减一
				mov cx,dx
				add bx,10h
				
			loop s
			
			mov ax, 4c00h
			int 21h
	code ends
	end start
	