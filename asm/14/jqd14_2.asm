; 编程，用 加法 和 移位指令计算 (ax) = (ax) * 10
; 提示：(ax) * 10 = (ax)*2 + (ax)*8
assume cs:code
	code segment
		start:
			mov ax,cs
			mov cl,3
			shl ax,1
			mov bx,ax
			shl bx,cl
			mov ax,bx


			mov ax,4c00h
			int 21h
			
	code ends
end start