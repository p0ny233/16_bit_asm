assume cs:code, ds:data, ss:stack
;编程，将 data 段中每个单词的前 4个 字母改为大写字母
	stack segment
		dw 0,0,0,0,0,0,0,0
	stack ends
	data segment
		db '1. display      '
		db '2. brows        '
		db '3. replace      '
		db '4. modify       '
	data ends
	
	code segment
		start:
			;初始化栈段
			mov ax, stack
			mov ss, ax
			mov sp,10h
			
			;初始化数据段
			mov ax, data
			mov ds, ax
			
			mov ax,0
			mov bx,0h
			
			mov cx,4
			
			
			s:
				push cx
				mov si,3
				mov cx, 4
				s0:
					
					mov al,[bx+si]
					and al,0dfh ; 0dfh = 11011111b
					mov [bx+si], al
					inc si
					
				loop s0
				
				add bx,10h
				pop cx
			
			loop s
			mov ax,4c00h
			int 21h
			
		code ends
	end start
			
			
			
			