; ��̣�����0���ж�
; ����0���жϳ��򣺽� �ַ��� ��ʾ����Ļ��
assume cs:code, ds:data

	data segment
		db "overflow!"
	data ends
	code segment
		start:
			; �� do0 ����Ĵ������� 0000��0200 ��
			mov ax, cs
			mov ds,ax
			
			;mov ax,do0
			;mov si,ax
			; �������п��Ը���Ϊ����һ�У�
			mov si, offset do0

			mov ax,0
			mov es,ax
			mov di,0200H  ; 0000 : 0200
			mov es:[0],di ; ƫ�Ƶ�ַ
			mov es:[2],ax


			

			; ���ϳ�ʼ�� �����Ĵ�����ָ��

			mov cx, offset do0ends - offset do0
			rep movsb ; DF ��־λΪ0  ���ӵ͵���
			mov ax,1000H
			mov bx,190H

			div bl


			;���� �ж�����
			


		do0:
			; ��ʾ�ַ��� "overflow!"�� д���Դ�
			; һ�� 80 ���ַ���һ�� 160���ֽ�

			mov bx,0b800H
			mov es,bx
			mov di,0190H ; ����д��

			mov bx,data
			mov ds,bx
			mov si,0

			mov cx,9
				s:
					mov al,ds:[si]
					mov ah,00000010B
					mov es:[di] , ax

					inc si
					add di,2
				loop s

			

			mov ax,4c00h
			int 21H
		do0ends:

	code ends


end start
			