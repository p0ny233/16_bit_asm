assume cs:code
	code segment
		start:
		;mov ax,0
		;mov bx,0
		;mov al,1
		;mov bl,0FEH
		;add al,bl
		;
		;mov ax,1
		;mov bx,2
		;sub al,bl
		;
		;mov ax,1
		;mov bx,-1
		;sub al,bl

		; sub 指令 负 -  正 = 负，但结果是 正数，
		mov al,80H
		sub al,1

		xor ax,ax
		xor bx,bx


		; sub 指令 负 -  正 = 负，但结果是 正数，那么就溢出了
		mov ax,7fH
		mov bx,08FH
		sub bl,al




		mov ax,4c00H
		int 21H
code ends
end start
