.model small
.stack 100
.data

str1    DB      "Green : 'G'"
        DB      10d
        DB      "Red   : 'R'" 
        DB      10d
        DB      "Blue  : 'B'"
        DB      10d 
        DB      "Please enter G, B, or R for font's color : $"

green   DB      "You choose green colour! $"
red     DB      "You choose red colour! $"
blue    DB      "You choose blue colour! $"


.code
main proc

mov ax,@data
mov ds,ax
mov ax,0h

; start

    lea         dx,str1
    call        PRINT_STR

    mov         ah,01h
    int         21h

    call        NEWLINE

    cmp         al,"G"
    je          greenSel

    cmp         al,"R"
    je          redSel

    cmp         al,"B"
    je          blueSel

    jmp         colourExit

    greenSel:
    xor         ax,ax
    mov         ah,09h
    mov         bx,00000010b
    int         10h

    lea         dx,green
    call        PRINT_STR
    jmp         colourExit

    redSel:
    xor         ax,ax
    mov         ah,09h
    mov         bx,00000100b
    int         10h

    lea         dx,red
    call        PRINT_STR
    jmp         colourExit

    blueSel:
    xor         ax,ax
    mov         ah,09h
    mov         bx,00000001b
    int         10h

    lea         dx,blue
    call        PRINT_STR
    jmp         colourExit

    colourExit:

    ;end

    mov ah,4ch
    int 21h

main endp

PRINT_STR       PROC
                        push    ax
                        mov     ah,09h
                        int     21h
                        pop    ax
                        ret
PRINT_STR       ENDP

PRINT_NUM       PROC                        ;print ax
                            push    ax
                            push    bx
                            push    cx
                            push    dx

                            mov     bx,0Ah      ;initalise divisor
                            mov     cx,0h
                            
                            divLoop:    
                                        xor     dx,dx       ;clear remainder
                                        div     bx
                                        push    dx          ;save remainder
                                        inc     cx          ;count looped number
                                        test    ax,ax       ;if ax != 0, continue
                                        jnz     divLoop

                            mov     ah,02h

                            printLoop:  
                                        pop     dx          ;get remainder
                                        add     dl,"0"
                                        int     21h         ;print
                                        loop    printLoop   ;loop until cx is zero (the number of times divLoop)

                            pop    dx
                            pop    cx
                            pop    bx
                            pop    ax

                            ret
PRINT_NUM       ENDP

PRINT_CHAR      PROC                                        ;print cjaracter of value in dl
                            push    ax
                            mov     ah,02h
                            int     21h
                            pop     ax
                            ret
PRINT_CHAR      ENDP

NEWLINE         PROC
                            push    dx
                            mov     dl,0Ah
                            call PRINT_CHAR
                            pop     dx
                            ret
NEWLINE         ENDP

end main