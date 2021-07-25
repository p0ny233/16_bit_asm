; AF:辅助进位标志位。
; 1. 在字操作时，发生低字节 向 高字节进位或者借位
; 2. 在字节操作时，发生低4位 向 高4位进位或者借位
assume cs:code
	code segment
		start:
			;在字节操作时，发生低4位 向 高4位进位或者借位，
			;也就是看 低4位中的第一个比特位 进 1 
			mov al,0CH ; >> 1100
			add al,8H  ; >> 1000

			; 将 AF 标志位 置 0
			add ax,0

			; 在字操作时，只需要 低位字节的 发生低4位 向 高4位进位或者借位
			;
			mov ax,10CEH
			add ax,0030H
			
			
	code ends
end start
