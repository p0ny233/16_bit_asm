; ��̣�����Ļ�� 5 �� 12�� ��ʾ�ַ��� "Welcome to masm!"

; 1�����ù���λ��
; 2��������ʾ���ַ�

assume cs:code, ds:data
	data segment
		db "Welcome to masm!$"
	data ends

	code segment
		start:
			mov ah,2	; ָ���жϵ� 2�� �ӳ���
			mov bh ,0	; ָ��ҳ��
			mov dh,5	; dh �д�� �к�
			mov dl,12	; dl �д�� �к�
			int 10h


			mov ax,data

			; ds:dx �� ָ���ַ�����ַ
			mov ds,ax
			mov dx,0
			mov bl,0cah
			mov ah,9	; ָ���жϵ� 9 ���ӳ���
			int 21h


			mov ax,4c00h
			int 21h
	code ends
end start
