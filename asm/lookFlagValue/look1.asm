; �鿴��־λȫ 0ʱ�� ��ֵ
assume cs:code, ss:stack

	stack segment
		db 32 dup(0)
	stack ends
	code segment
		start:
			mov ax,stack
			mov ss,ax
			mov sp,20H

			mov ax,1
			mov bx,2
			
			;���Խ� PF λ ��Ϊ 1 
			add ax,bx

			pushf ; ִ������֮��鿴 ջ������
			mov ax,1111H

			push ax ; Ϊ�˸��������ջ�е�����




			mov ax, 4c00h
			int 21h
	code ends

end start