; ��ʮ������ʾ�� �Դ���

assume cs:code 
	data segment
		dw 12666
	data ends
	
	code segment
		start:
			mov ax,data
			mov ds,ax
			mov si,0

			mov ax,ds:[si]
			mov bx,0b800h
			mov es,bx
			mov di ,120
			call dtoc

			mov ax, 4c00h
			int 21h

			dtoc:
				;Դ������ ax ��
				mov cx,10
				div cx ; dx = ������ax =  ��

				add dl,30H
				mov es:[di],dl
				mov byte word ptr es:[di+1],2H
				sub di ,2

				mov cx,ax
				jcxz over_dtoc
				; div ָ�� 
				; 8λ���� ��Ĭ�ϵ�16λ�����������AX��
				; 16 λ �������������ĸ�16λ����� DX�У� �������ĵ�16λ�����AX��
				; 8λ�������̴���� AL �У� ��������� AH��
				; 16 λ�������̴���� AX �У� ��������� DX ��

				; 12666 / 10  �ĳ�������ʹ�� ax
				mov dx,0
				jmp dtoc		

			over_dtoc:
				ret	
	code ends
end start
