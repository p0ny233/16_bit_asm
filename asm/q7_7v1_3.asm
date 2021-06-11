assume cs:code,ds:datasg
;q7_7v1_1   >>> 使用 一个 空闲寄存器 暂存 cx寄存器的值
;q7_7v1_2   >>> 使用 程序内的一个字节大小的 内存空间 暂存 cx寄存器的值
;q7_7v1_3   >>> 使用 一段内存空间当前栈空间， 使用栈空间暂存 cx寄存器的值

	datasg segment
		db 'ibm             '
		db 'dec             '
		db 'dos             '
		db 'vax             '
		db '                '
	datasg ends

	code segment
		start:
			mov ax, datasg
			mov ds, ax
			mov cx, 4
			; 初始化栈空间
			mov ss, ax
			mov sp,50h
			s:
				push cx
				mov ax,0
				mov si,0
				mov cx,3
				s0:
					
					mov al,[bx+si]
					and al,0dfh
					mov [bx+si],al
					inc si
				
				loop s0
				add bx,10h
				pop cx
				
			loop s
			mov ax,4c00h
			int 21h
			
		code ends
	end start
			


			
			
			
	