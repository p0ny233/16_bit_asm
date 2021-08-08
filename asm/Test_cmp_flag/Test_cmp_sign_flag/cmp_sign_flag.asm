; cmp 指令 相当于 sub 指令，但是不同之处就是 仅仅是 运算的结果 影响了标志位寄存器
; 运算的结果是不保存的

; 以下运算都是有符号运算

assume cs:code
	code segment
		start:
			
			; 实际结果只是 SF 表示正负数
			; 逻辑上的结果需要 SF 和 OF 位 同时表示才知道那个大那个小



			; 正 - 负 = 正，但是结果是 负数的，所以溢出
			mov al,7FH
			mov bl,80H
			cmp al,bl
			; 实际结果是 FF，溢出，SF位 =  1，OF = 1 
			; 小 - 大 的结果是 负数的，但是
			; 又因为溢出了，逻辑上的结果是 大 - 小。
			; 所以 (al) > (bl)


			; 负 - 正 = 负，但是结果是 正数的，所以溢出
			mov al,80H
			mov bl,1H
			cmp al,bl
			; 实际结果是  7F ，溢出，SF位 =  0，OF = 1 
			; 大 - 小 的结果是 正数的，但是
			; 又因为溢出了，逻辑上的结果是  小 - 大。
			; 所以 (al) < (bl)

			

			mov ax,4c00h
			int 21H
			




	code ends

end start
