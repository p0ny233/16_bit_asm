assume cs:code,ds:data,ss:stack

data segment
		db	'1975','1976','1977','1978','1979','1980','1981','1982','1983'
		db	'1984','1985','1986','1987','1988','1989','1990','1991','1992'
		db	'1993','1994','1995'
		;�����Ǳ�ʾ21���21���ַ��� year


		dd	16,22,382,1356,2390,8000,16000,24486,50065,9749,14047,19751
		dd	34598,59082,80353,11830,18430,27590,37530,46490,59370
		;�����Ǳ�ʾ21�깫˾�������21��dword����	sum

		dw	3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
		dw	1154,1443,1525,1780
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		mov si,0
		mov ax, 0b800h
		mov es,ax
		mov di,0
		mov bx,10
		call show_year
		mov ax,4c00h
		int 21h


		show_year:
	
			mov al, byte ptr ds:[si]
			; �Դ��λ�ã�
			mov es:[di], al


			add di,160
			inc si
			jmp show_year




		


		mov bx,ds:[si] ; Դ�����͵�bx


	
code ends

end start