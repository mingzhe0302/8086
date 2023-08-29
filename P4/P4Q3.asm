.model small
.stack 100
.data

str1    DB "In English: $"
str2    DB "In Eggnglish: $"

input   DB "You like english and espresso, excellent ! $"
output  DB 50 DUP("0")
        DB "$"

.code
main proc

mov ax,@data
mov ds,ax
mov es,ax
mov ax,0h

; start

lea         dx,str1
call        PRINT_STR

lea         dx,input
call        PRINT_STR

lea         si,input
lea         di,output
strLoop:
            mov         al,[si]

            cmp         al,"$"
            je          strLoopEnd

            cmp         al,"e"
            je          addEgg?

            noAddEgg:
            mov         [di],al
            
            jmp         addEggEnd

            addEgg?:
                        mov         ah,[si-1]
                        cmp         ah," "
                        jne         noAddEgg

            addEgg:
                        mov         ah,"e"
                        mov         [di],ah
                        inc         di

                        mov         ah,"g"
                        mov         [di],ah
                        inc         di
                        mov         [di],ah
            addEggEnd:
            inc         si
            inc         di
            jmp         strLoop
strLoopEnd:

call        NEWLINE

lea         dx,str2
call        PRINT_STR

lea         dx,output
call        PRINT_STR

call        NEWLINE

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

                            pop    ax
                            pop    bx
                            pop    cx
                            pop    dx

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