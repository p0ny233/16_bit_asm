assume cs:code
	code segment
		start:
			mov al,7FH
			add al,2H

			mov ax,4c00h
			int 21h

			; �޷��� ������� CF = 0
			; �з��� �� OF = 1 

	code ends
end start

