.model small
.stack 100
.data

byteList DB 12, 4, 6, 8, 10, 12

.code
main proc
mov ax, @data
mov ds, ax
mov es, ax
mov dx, 0
mov cx, 6

lea si, byteList

loopStart: 
    mov bl, [si]
    add dl, bl

    inc si
    loop loopStart

   mov ax, dx
   call Print_Num


    ;exit
    mov ax,4c00h
    int 21h

main endp

Print_Num PROC

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

        ret      
Print_Num endp

end main
