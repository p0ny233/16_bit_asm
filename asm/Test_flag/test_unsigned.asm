assume cs:code
	code segment
		start:
			; ������ �з������㣬OF=1 ��ʾ����� CF=0
			; ������ �޷������㣬OF=1 �����壬 CF=0 δ���

			mov al,7FH
			add al,2H

			mov ax,4c00h
			int 21h

	code ends
end start

