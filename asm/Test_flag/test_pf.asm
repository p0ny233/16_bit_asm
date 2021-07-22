assume cs:code
	code segment
		start:
			;add ax,1
			;add ax,1
			;add ax,1
			
			;mov ax,8192
			; 8192 》20 00 H
			; 二进制 : ‭0010 0000 0000 0000
			;add ax,1
			; 测试 PF 奇偶标志位 ，执行 add 指令后的二进制：
			; 0010 0000 0000 0001    有两个 bit位为 1 ，但是 PF 值还是不变
			; 说明 PF 只是受 低 8 位 的影响【不管操作一个字还是一个字节，都要看后面的8个bit】

			; 操作一个字时，根据低字节 每一个比特位 为 1 的数量，
			; 数量为 偶数包括0，PF位就为1，奇数PF位就为0
			;mov ax, 2
			;add ax, 1
			;sub ax,ax

			
			; 操作一个字节时，根据整体的 每一个比特位 为 1 的数量，
			; 数量为 偶数包括0，PF位就为1，奇数PF位就为0
			mov al,2h
			add al,1h

			mov ax,4c00h
			int 21h



	code ends

end start