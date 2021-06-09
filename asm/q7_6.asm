;编程，将 datasg 段中每个单词的头一个字母改为 大写字母
assume cs:code, ds:datasg
    datasg segment
        db '1. file         ' ;3
        db '2. edit         ' ;13
        db '3. search       ' ;23
        db '4. view         ' ;33
        db '5. options      ' ;43
        db '6. help         '
    datasg ends

    code segment
        start:
            mov ax, datasg
            mov ds,ax
            mov bx,3
            mov cx,6
            mov ax,0
            s:
                mov al,[bx]
                and al,11011111b
                mov [bx],al
                add bx,16
            loop s
            mov ax,4c00h
            int 21h
        code ends

    end start





