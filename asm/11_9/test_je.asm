; ���е�������ת��ָ��Ƕ�ת��

assume cs:code
	code segment
		start:
			; ���� je ��jump equal ��ָ��
			; �� ZF��־λ��ֵΪ 0 ����ʾ����������������ȵ�

				mov ax, 100
				mov bx,100
				cmp ax,	bx	; ����� zf = 1 
				je dest ; zf = 1 �Ż�����zf=1��ʾ������������һ����
			
				mov cx,0
				jcxz start

			dest:
				mov ax, 0
				mov bx, 0
				
					



			; �������û���κ�ָ��ȥ�ı� ZF ��־λ�ģ�
			; ZFĬ���� 0 �Ƿ������

			mov ax, 4c00H
			int 21H




	code ends

end start