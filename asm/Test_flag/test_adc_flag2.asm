; ��̣����� 1EF000H + 201000H����������  ax(��16λ) ��  bx(��16λ)
assume cs:code
	code segment
		start:

		; д��һ��
			mov ax,0F000H
			mov bx,1000H
			add bx,ax ; CFλ���
			
			mov ax, 001EH
			adc ax, 0020H

			xor ax,ax
			xor bx,bx


		; д������
			mov bx,0F000H
			mov ax,001EH
			add bx,1000H
			adc ax,0020H



			mov ax,4c00H
			int 21H
	code ends
end start


			
