; ��̣����� 1EF0001000H + 2010001EF0H ��������� ax(���16λ) + bx(�θ�16λ) + cx(��16λ)
assume cs:code
	code segment
		start:
			
			mov cx,1000H
			mov bx,0F000H
			mov ax,001EH

			add cx,1EF0H
			adc bx,1000H
			adc ax,0020H

			mov ax,4c00H
			int 21H
	code ends

end start


