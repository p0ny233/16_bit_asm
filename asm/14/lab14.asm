; ��̣��� " ��/��/�� ʱ:��:�� " �ĸ�ʽ����ʾ��ǰ�����ڡ�ʱ��
assume cs:code,ds:data
	data segment
		db 0,0,"/",0,0,"/",0,0,     0,0,":",0,0,":",0,0 ;01, 34 ,67,      89, bc ,ef
		db 9h,8h,7h,  4h,2h,0h
	data ends
	code segment
		start:
			;
			mov ax,data
			mov ds,ax
			mov si,10h ; ��Ҫ��ȡ�ĵ�Ԫ
			mov di,0h
			mov bl,2fh
			call converdate

			mov si,13h
			mov di,8h
			mov bl,3ah
			call convertime

			mov si,0
			mov ax,0b800h
			mov es,ax
			mov di,160*12+40
			mov cx,10h
			mov ah,2

			s:
				mov al,ds:[si]
				mov es:[di],ax
				add di,2
				inc si
			loop s
				

			mov ax,4c00h
			int 21h

			converdate:

				mov al,ds:[si]	; 70h ��Ԫ��
				out 70h,al		; ѡ��Ҫ��ȡ�ĵ�Ԫ
				in al, 71h		; ��ȡ���ݵ� al 

				mov ah,al
				mov cl ,4
				shr ah,cl
				add ah,30h
				mov ds:[di], ah
				inc di
			

				and al,0fh
				add al,30h
				mov ds:[di], al
				inc si
				add di,2
				cmp bl,ds:[di-1] ;
				jz converdate 
				ret

			convertime:
				mov al,ds:[si]	; 70h ��Ԫ��
				out 70h,al		; ѡ��Ҫ��ȡ�ĵ�Ԫ
				in al, 71h		; ��ȡ���ݵ� al 

				mov ah,al
				mov cl ,4
				shr ah,cl
				add ah,30h
				mov ds:[di], ah
				inc di
			

				and al,0fh
				add al,30h
				mov ds:[di], al
				add di,2
				inc si
				cmp bl,ds:[di-1] ;����Ⱦ��˳��������
				
				jz convertime 
				ret


	code ends
end start