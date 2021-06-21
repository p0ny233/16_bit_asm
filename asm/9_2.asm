assume cs:code
;编程，利用 jcxz 指令，实现在内存2000h 段中查找第一个值为 0 的字节
;找到后，将它的偏移地址存储在dx中
; jcxz 指令的作用: 执行到 jcxz指令，判断 cx 中的内容是否为0，
; 为0 则跳转，不为0则往下执行
	code segment
		start:
			mov ax,2000h
			mov ds,ax
			mov bx,0
			s:
				
			; 第一种写法
				; mov cl,ds:[bx]
				; jcxz ok
				; mov cx,0
				; inc bx
				
			;第二种写法:
				mov cx,0
				mov cl,ds:[bx]
				jcxz ok
				inc bx
					
			;第三种写法:
				; mov cl,ds:[bx]
				; mov ch,0
				; jcxz ok
				; inc bx
				
			jmp s
				
			ok:
				mov dx,bx
				mov ax,4c00h
				int 21h
			
		
	code ends
	
	end start
