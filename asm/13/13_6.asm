; ����Ļ��5��12����ʾ3����׸�����˸��ɫ�� 'a'

; 1�������ù��λ��
; 2��Ȼ��������Ҫ��ʾ���ַ�
assume cs:code
	code segment
	
		start:
			mov ah,2  ; ָ�� 2 ���ӳ���
			mov bh,5  ; dh �д�� �к�
			mov bl,12 ; dl �д�� �к�

			int 10h

			
			; ָ�������ж������е� 9���ӳ���
			mov ah,9 ; ָ�� 9 ���ӳ���
			mov al, 'a'		; �ַ�
			mov bl,0cah		; �ַ�����
			mov bh,0		; �� 0 ҳ
			mov cx,3		; �ַ��ظ�����

			int 10h


			mov ax, 4c00h
			int 21h





	code ends

end start