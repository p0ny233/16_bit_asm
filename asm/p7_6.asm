assume cs:code, ds:data
;使用 [bx+ idata] 的形式访问内存单元
    data segment
        db 'BaSiC' ;将字符串转大写
        db 'MinIX' ;将字符串转小写

    data ends

    code segment
        start:
            mov ax,data
            mov ds,ax
            mov bx,0

            mov cx,5h
            s: 
                mov al,[bx]
                and al,11011111b
                mov [bx],al

                mov al,[5+bx]
                or al, 00100000b
                mov [5+bx],al

                inc bx
            LOOP s

            mov ax,4c00h
            int 21h

        code ends
        end start



