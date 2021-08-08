; 所有的有条件转移指令都是短转移

assume cs:code
	code segment
		start:
			; 测试 je 【jump equal 】指令
			; 当 ZF标志位的值为 0 ，表示两个操作数都是相等的

				mov ax, 100
				mov bx,100
				cmp ax,	bx	; 结果令 zf = 1 
				je dest ; zf = 1 才会跳，zf=1表示两个操作数是一样的
			
				mov cx,0
				jcxz start

			dest:
				mov ax, 0
				mov bx, 0
				
					



			; 测试如果没有任何指令去改变 ZF 标志位的，
			; ZF默认是 0 是否会跳？

			mov ax, 4c00H
			int 21H




	code ends

end start