assume cs:code
	code segment
		start:
		; 8001H > ‭1000 0000 0000 0001‬
		; 执行第一条 add 指令后 ，SF 的位值才会改变，因为 最高位是 1
			mov ax, 8001H
			add ax,1


		; 7001H > ‭0111 0000 0000 0001‬
		; 执行第一条 add 指令后 ，SF 的位值不会改变，因为 最高位是 0
			mov ax, 7001H
			add ax,1
	code ends
end start
