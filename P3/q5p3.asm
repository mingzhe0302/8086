.MODEL small
.STACK 100
.DATA

valueList db 1,1
          db 50 dup(0)


.code
MAIN PROC
mov ax,@data
mov ds,ax



    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx

    mov cx, 6d
    lea si, valueList
    add si, 3d         ;start from 3rd element



loopStart: 

    xor bx, bx

    mov ah, [si - 2]
    mov al, [si - 1]

    add bl, al
    add bl, ah

    mov [si], bl       

    inc si
    

    xor ax, ax 
    mov al, bl

    call Print_Num
    call NEWLINE


    loop loopStart

    mov ah,4ch
    int 21h

main endp

Print_Num PROC

    push cx
    mov bx, 0010d
    xor cx, cx   ;clear cx

loopRemainder:

        xor dx, dx       ;clear dx after and before loop
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz loopRemainder

printLoop: 
        pop dx
        add dx, 48d
        mov ah, 02h
        int 21h
        loop printLoop 

        pop cx
        ret      
Print_Num endp

NEWLINE         PROC
                        push    ax
                        push    dx
                        mov     dl,10d
                        mov     ah,02h
                        int     21h
                        pop     dx
                        pop     ax
                        ret
NEWLINE         ENDP

end main