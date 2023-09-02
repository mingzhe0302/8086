.MODEL SMALL
.STACK 100H
.DATA
    
    msg1             db      "Enter a word: $"
    msg2             db      "The second character is $"

   output            db     20
                     db     ?
                     db     20 dup("$")


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    MOV AX, 0H

        lea         dx, msg1
        mov         ah, 09h
        int         21h

        ;read string
        lea         dx, output
        mov         ax, 0ah
        int         21h

        call NEWLINE

        lea         dx, msg2
        mov         ah, 09h
        int         21h

        mov         dl, output + 2 + 1
        call        PRINT_CHAR

MAIN ENDP


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

PRINT_CHAR      PROC                                        ;print cjaracter of value in dl
                            push    ax
                            mov     ah,02h
                            int     21h
                            pop     ax
                            ret
PRINT_CHAR      ENDP
END MAIN
