assume cs:code

    code segment
    start:
        mov ax,2000h
        mov ds,ax
        mov bx,1000h
        mov ax,[bx]
        mov cx,[bx+1]
        add cx,[bx+2]

    code ends

    end start
        