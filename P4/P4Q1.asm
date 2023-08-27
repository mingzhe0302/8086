.MODEL small
.STACK 100
.DATA


listByte db 12, 29, -9, 5, -48, 20, 0

str1 db 'There are ', '$'
str2 db 'positive and ', '$'
str3 db ' negative values in the list', '$'

posNo db 0
negNo db 0

.code
MAIN PROC
mov ax,@data
mov ds,ax

    lea si, listByte

loopArr:

    mov al, [si]
    cmp al, 0
    

    jL NEGATIVE
    jG POSITIVE
    jmp EXIT
    

    NEGATIVE: 

        inc negNo
        inc si
        jmp loopArr

    POSITIVE:

        inc posNo
        inc si
        jmp loopArr

    EXIT: 
        lea dx, str1
        mov ah, 09h
        int 21H

        xor ax, ax
        mov al, posNo
        call Print_Num

        lea dx, str2 
        mov ah, 09h
        int 21h

        xor ax, ax
        mov al, negNo
        call Print_Num

        lea dx, str3
        mov ah, 09h
        int 21H

    ;exit
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
end main