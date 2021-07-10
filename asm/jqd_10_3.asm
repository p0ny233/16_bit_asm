; 检测点 10.3
; debug 出来的结果和书上的不一致，因其 一开始 cs 的内容不一致；
; 本题 可以直接运算结果不需要debug



; 转移的 目的地址 在指令中的 call指令
; O76A:0003	9A09006A07	call 	O76A:0009

assume cs:code

	code segment
		start:
			mov ax,0
			call far ptr s
			; 执行 call 指令，会将 cs寄存器和IP寄存器的内容入栈，
			inc ax
			s:
				pop ax
				add ax,ax
				pop bx
				add ax,bx
				
			
	code ends
	
end start
