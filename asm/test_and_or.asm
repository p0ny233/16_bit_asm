assume cs:code , ds:data
	data segment
		dw 3412H
	data ends
	code segment
		
		start:

			mov dx, data

			mov ds,dx

			;mov ax,ds:[0] ; ax = 1234H
			;and ax,ds:[0]

			; ���� add ����subָ��ĸ�ʽ
			
			add byte ptr ds:[0],byte ptr ds:[0] ;д������

			mov ax,4c00h
			int 21H
	code ends
end start

			