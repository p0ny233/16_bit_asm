; ��д��Ӧ�ó�����õ��ж�����
; ��д����װ 7ch ���ж�����
; ���ܣ���һ word �����ݵ�ƽ��
; ������(ax) = Ҫ���������
; ����ֵ��dx��ax �д�Ž���ĸ�16λ�͵�16λ
; Ӧ�þ����� �� 2 * 3456^2

assume cs:code
	code segment
		start:
			mov ax,3456
			mov bx,cs
			mov ds,bx
			mov si,offset do7c
			mov es,di
			mov di,200h
			CLD ; DF  ��λ
			mov cx,offset do7cend - offset do7c
			rep movsb
			; ��װ����

			; �����ж�����
			mov word ptr es:[4 * 7ch], 200H
			mov word ptr es:[4 * 7ch + 2], 0H

			int 7ch

			mov ax,4c00h
			int 21h



			; ��д 7ch�жϳ���
			do7c:
				mul ax
				; �õ� ƽ���Ľ����ƽ���Ľ������Ҫȥ����2
				mov bx,dx
				mov cx,2

				mul cx
				add bx,dx ; ֻ��Ҫ��λ�Ľ���͵�λ�Ľ�λ��ӵļ���
				mov si,ax
				
				; ��λ�˷�
				mov ax,bx
				mul cx
				mov dx,ax
				mov ax,si
				iret

			do7cend:nop

	code ends

end start

