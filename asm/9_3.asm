assume cs:code
;编程，利用 loop 指令，实现在内存 2000h 段中查找第一个值为 0 的字节
;找到将它的偏移地址存储在 dx 中
	code segment
		start:
			mov ax,2000h
			mov ds,ax
			mov bx,0
			
			s:
				mov cl,ds:[bx]
				mov ch,0
				inc cx
				inc bx
			loop s
			
			ok:
				dec bx
				mov dx,bx
				mov ax,4c00h
				
				int 21h
	code ends
	end start
	