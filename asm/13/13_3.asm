; �� 7ch �ж�������� loopָ��Ĺ���
; loop ָ��
; Ӧ�þ���������Ļ�м���ʾ 80 �� "!"

assume cs:code
	code segment
		start:
			
			; 1����װ�жϳ���
			mov ax,0;
			mov es,ax
			mov ax,200h
			mov di,ax
			mov ax,cs
			mov ds,ax
			mov si,offset do7ch
			mov cx,offset do7end - offset do7ch
			rep movsb




			; 2������������
			mov word ptr es:[7ch * 4],200h ; ƫ����
			mov word ptr es:[7ch * 4 + 2],0h ; �ε�ַ


			; 3�������ж�ǰ push ���úõ� ѭ������

			int 7ch
			mov ax,4c00h
			int 21h



			do7ch:
				; ��ʼ��Ŀ���ڴ��ַ
				mov ax, 0b800h;
				mov es,ax;
				mov ax,0A0H
				mov di,ax


		        mov cx, 80 ; ѭ������
				mov ah,20h ; �ַ���ɫ����ɫ
				mov al,	33 ; ����һ����̾��


				s:
					mov bx,cx

					mov es:[di], ax

					dec bx
					mov cx , bx
					add di,2

					jcxz do7end ; ��ת�ж�
					dec bx
					
					jmp s

				do7n:
					iret

				do7end:
					nop




				
				

				
				
				








			
	code ends