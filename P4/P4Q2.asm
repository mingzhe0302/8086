.model small
.stack 100h
.data

firstLetter db 'A', '$'
msg1 db 'Do you want to continue printing (y/n)?', '$'
errorMsg db 'Please enter y or n only', '$'


.code 
MAIN PROC
mov ax, @DATA
mov ds, ax

    mov dl, [firstLetter]
    mov ah, 02h
    int 21h 

    call NEWLINE


L1:
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h

    cmp al, 'y'
    je charInc

    cmp al, 'n'
    je NO

    jmp ErrMsg
    

charInc:
    mov dl, [firstLetter]
    inc dl
    mov [firstLetter], dl

    call NEWLINE

    mov dl, [firstLetter]
    mov ah, 02h
    int 21h

    call NEWLINE

    jmp L1


ErrMsg: 

    call NEWLINE 
    
    lea dx, errorMsg
    mov ah, 09h
    int 21h

    call NEWLINE

    jmp L1

    ;exit
    NO:
    mov ah, 4Ch
    int 21h

MAIN endp

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



END MAIN