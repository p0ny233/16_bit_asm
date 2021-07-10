; 转移地址在 寄存器 中的 call指令
; debug 的结果是 ax = 000Bh
assume cs:code
	code segment
		start:
			mov ax,6
			call ax
			inc ax
			mov bp,sp
			add ax,[bp]
	code ends
end start
