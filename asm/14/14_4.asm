; ����Ļ�м���ʾ��ǰ���·�
; ��ȡ CMOS RAM �е�ʱ����Ϣ������ BCD �� ��ŵģ���������ʱ����Ҫ��������4λ


assume cs:code
	code segment
		start:

			mov ax,0b800h
			mov es,ax
			mov di,2500



			mov al,8
			out 70h,al
			in al,71h
			mov ah,al
			mov cl,4
			shr ah,cl

			; +30h �պ��� ���ֵ�ascii��
			add ah,30h
			add al,30h
			
			mov es:[di], ah ; ��ʾ�·ݵ�ʮλ
			add di,2
			mov es:[di], al ; ��ʾ�·ݵĸ�λ

			mov ax,4c00h
			int 21h


	code ends

end start
