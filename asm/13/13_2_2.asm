; ��д����װ�ж� 7ch ���ж�����
; ���ܣ���һ��ȫ�� ��ĸ���� 0 ��β���ַ�����ת��Ϊ ��д
; ������ds:si ָ�� �ַ������׵�ַ
; Ӧ�þ�������data ���е��ַ���ת��Ϊ ��д
;

assume cs:code , ds:data
	data segment
		db "conversation",0
	data ends

	code segment

		start:




			; ��װ�жϳ���
			mov ax,0
			mov es,ax
			mov di,200h
			mov ax,cs
			mov ds,ax
			mov si,offset do7c; do7c �Ǵ�����еı�� �����ݶεı�ţ����� offset

			mov cx,offset do7cend - offset do7c
			rep movsb

			; ��������; ƫ�Ƶ�ַ
			mov word ptr es:[7ch * 4],200H 
			mov word ptr es:[7ch * 4 + 2] , 0

			int 7ch
		
			mov ax,1111h
			mov ax,4c00h
			int 21h



				; ��д�жϳ���
			do7c:
				mov cx,13
				mov si,0
				mov ax,data ; �εı�ţ����� offset
				mov ds,ax
				s:
					mov bx,cx
					mov ch,0
					mov cl,ds:[si]
					jz cx_is_zero ; cx Ϊ 0 ��
					mov ax,cx
					; 1101 1111 > DF
					and byte ptr ds:[si],011011111B
					inc si
					mov cx,bx
				loop s

				iret

				cx_is_zero:
					mov ax,2222h

					mov ax,4c00h
					int 21h

			do7cend:nop
		
	code ends

end start




		
