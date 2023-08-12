.model small
.data
    dividend db ?
    divisor db ?

    prmp_message1 db 'Please enter a dividend: ', '$'
    prmp_message2 db 'Please enter a divisor: ', '$'

    quotient db ?
    remainder db ?

    message db "Dividend: ", '$'
    message2 db "Divisor: ", '$'
    message3 db "Quotient: ", '$'
    message4 db "Remainder: ", '$'

    newline db 13, 10, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Store dividend
    lea dx, prmp_message1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21H                                     
    sub al, 30h                                   
    mov dividend, al                                     
                                            

    ; Display divisor
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, prmp_message2
    mov ah, 9
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov divisor, al

    ; Calculate quotient and remainder
    mov al, dividend
    mov ah, 0
    div divisor
    mov quotient, al
    mov remainder, ah

    ; Display quotient
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, message3
    mov ah, 9
    int 21h
    mov dl, quotient
    add dl, '0'
    mov ah, 2
    int 21h

    ; Display remainder
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, message4
    mov ah, 9
    int 21h
    mov dl, remainder
    add dl, '0'
    mov ah, 2
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp

end main
