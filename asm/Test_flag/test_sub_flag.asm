assume cs:code
	code segment
		start:
		mov ax,0
		mov bx,0
		mov al,1
		mov bl,0FEH
		add al,bl

		mov ax,1
		mov bx,2
		sub al,bl

		mov ax,1
		mov bx,-1
		sub al,bl


		mov ax,4c00H
		int 21H
code ends
end start
