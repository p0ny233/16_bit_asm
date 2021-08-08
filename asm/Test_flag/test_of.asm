assume cs:code
	code segment
		start:


			;mov ax, 8000H
			;mov bx,0FFFFH
			;
			;add ax,bx
			;
			;
			;; sub 指令 负 -  正 = 负，但结果是 正数，那么就溢出了
			;mov ax,7fH
			;mov bx,08FH
			;sub bl,al

			; add 负 + 负 = 负数，但结果是 正数，那么就溢出了
			;mov al,80H
			;mov bl,0EFH
			;add al,bl

			sub al, bl



			mov ax,4c00H
			int 21H

			
	code ends
end start
