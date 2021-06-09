assume cs:code, ds:data, ss:stackdata
;测试使用 assume 关联相关的 段是否会自动执行标号的段地址】


    data segment
        dw 0,0,0,0,0,0,0,0 ; 16 byte
    data ends

    stackdata segment
        dw 0,0,0,0,0,0,0,0 ;16bytes
    stackdata ends

    code  segment
        mov ax, 0123h
        mov ax,4c00h
        int 21h

    
    code ends

end
