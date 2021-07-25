; 编程：计算 1EF000H + 201000H，结果存放在  ax(高16位) 和  bx(低16位)
assume cs:code
	code segment
		start:

		; 写法一：
			mov ax,0F000H
			mov bx,1000H
			add bx,ax ; CF位溢出
			
			mov ax, 001EH
			adc ax, 0020H

			xor ax,ax
			xor bx,bx


		; 写法二：
			mov bx,0F000H
			mov ax,001EH
			add bx,1000H
			adc ax,0020H



			mov ax,4c00H
			int 21H
	code ends
end start


			
