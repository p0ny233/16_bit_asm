assume cs:code, ds:data

	data segment
		db 'Welcome to masm !',0 ; 18 ���ֽ�[ ���� 0 ]
	data ends
	stack segment
		db 30 dup (0)
	stack ends
	
	code segment
		start:
			mov dh,0 ; ��
			mov dl,30 ; ��
			mov cl,2 ; ��ɫ
			
			mov ax,data
			mov ds,ax
			mov si,0
			
			mov ax, stack
			mov ss,ax
			mov sp,30h
			
			call show_str
			mov ax,4c00h
			int 21h
			
			
			
		show_str:
			push ds
			push cx
			; 1. �ж��ַ��Ƿ����
			mov ch,0
			mov cl,ds:[si]
			jcxz over ; �ַ�������������� over
			
			; 2. ���������ַ���ջ
			push cx
			
			
			; �˷����� ���׵�ַ
			mov al,0A0H
			mul dh
			push ax
			
			
			
			; �˷������е�ַ
			mov al,2H
			mul dl
			push ax
			
			
			pop di ; ��
			pop bx ; ��
			
			
			; �Դ�Ķε�ַ
			mov ax,0b800H
			mov ds,ax
			
			pop ax ; �ַ�
			pop cx
			mov ah,cl
			
			mov ds:[bx][di],ax
			inc dl
			inc si
			; add di,2
			pop ds
			jmp show_str
		over:
			pop ax
			pop bx
			ret
	code ends		
	
end start
