; ���0�� �жϵĴ������
; div���㣬���ǽ�������ݿ��̫�󣬴治�������ж�
assume cs:code, ds:data

	code segment

		data segment
			db "divide error!"
		data ends

		start:


			;��װ �жϳ��� �� 0000:0200H �ڴ���
			mov ax,cs
			mov ds,ax
			mov si,offset do0

			; ds:[si] ָ�� do0 �жϳ���
			; es:[di] ָ�� Ŀ���ڴ��ַ

			mov ax,0
			mov es,ax
			mov di,0200H


			mov cx,offset do0end - offset do0
			rep movsb

			; �����ж�����
			mov word ptr es:[0 * 4],0200H
			mov word ptr es:[0 * 4 + 2],0

			; �����ж�
			mov ax,1000H
			mov bx,1H

			div bl ; �������� 0 ���ж�

		do0:
			; 1. ��ʾ�ַ�������ʾ����

			; 1.1 ��ʼ���Ĵ�����λ �ַ�����λ��
			mov ax,data
			mov ds,ax
			mov si,0

			; ��ʼ���Ĵ���ָ�� �Դ�
			mov ax, 0b800H
			mov es,ax
			mov di,190H
			mov cx,13



			; �����ѭ���޷�ʹ�� rep ָ�������棬����Ϊ�ַ�����������
			s:
				;ѭ����ȡ
				mov ah,2H ; ��λ���ַ�����
				mov al,ds:[si]

				mov es:[di], ax
				inc si
				add di,2
			loop s 

			mov ax, 4c00h
			int 21h

		do0end: 
			nop
	code ends
	
end start