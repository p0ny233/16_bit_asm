; ��д����װ int 7ch �ж����̣�����Ϊ ��ʾһ����0 �������ַ���
; �ж����̰�װ�� 0:200 ��
; ������(dh)= �к� ��(dl)= �кţ� (cl)= ��ɫ��ds:si ָ���ַ����׵�ַ

assume cs:code , ds:data
	data segment
		db "Welcome to masm !",0 ; �� 0 �Ž�˫�����С���ʾ �ַ�0 ���ַ�0 ��ascii����32��ʮ������20
	data ends
	code segment
		start:
			; 1����װ�жϳ���
			mov ax,cs
			mov ds,ax
			mov si,offset do7ch
			mov ax,0
			mov es,ax
			mov di, 200h
			cld
			mov cx, offset do7cend - offset do7ch
			rep movsb

			; 2�������ж�������
			mov word ptr es:[7ch * 4 + 2],0
			mov word ptr es:[7ch * 4],200h

			; 3�����ݲ���ֵ
			mov dh,5
			mov dl,12
			mov ch,0

			mov cl,02h
			mov ax,data
			mov ds,ax
			mov si,0

			; 4�� �����ж�
			int 7ch
			mov ax,4c00h
			int 21h




		do7ch:

			mov ax,0b800h
			mov es,ax
			mov ax,0A0h
			mul dh
			
			mov di,ax
			mov ax,2
			mul dl
			add di,ax


			mov bl,cl
			s:
				mov ch,0
				mov cl,ds:[si]
				jcxz do7cret
				mov ch,bl
				mov es:[di],cx
				add di,2
				inc si

				jmp s


		do7cret:
			iret

		do7cend:
			nop


	code ends
end start