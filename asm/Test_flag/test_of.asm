assume cs:code
	code segment
		start:


			;mov ax, 8000H
			;mov bx,0FFFFH
			;
			;add ax,bx
			;
			;
			;; sub ָ�� �� -  �� = ����������� ��������ô�������
			;mov ax,7fH
			;mov bx,08FH
			;sub bl,al

			; add �� + �� = ������������� ��������ô�������
			;mov al,80H
			;mov bl,0EFH
			;add al,bl

			sub al, bl



			mov ax,4c00H
			int 21H

			
	code ends
end start
