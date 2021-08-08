; 测试 ：触发内中断 
assume cs:code
	code segment
		start:
			mov ax,1000H
			mov bh,1
			div bh ; // cs:ip发生改变

			mov ax,1000H
			mov ax,4c00H
			int 21H


			
	code ends
end start
