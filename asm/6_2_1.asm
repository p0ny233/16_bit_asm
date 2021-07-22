assume cs:code
      code segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
        dw 0,0,0,0,0,0,0,0
        start:
        mov ax, cs
        mov ds, ax
        mov ss,ax 
        mov sp,020h
        mov bx,0
        mov cx,08h
        push cs:[bx]
        add bx,2
        mov ax,4c00h
        int 21h
    code ends
end start