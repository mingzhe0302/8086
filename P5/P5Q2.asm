.model small
.stack 100
.data

str1    DB      "Enter secret word: $"
str2    DB      "Enter encryption key (1-9): $"
str3    DB      "The encrypted key is $"

secretWord DB   20 DUP("$")

key     DB      ?

encryptedWord   DB      20 DUP("$")

buffer  DB  20
        DB  ?
        DB  20 DUP("$")

.code
main proc

mov ax,@data
mov ds,ax
mov ax,0h

; start
call    NEWLINE

lea     dx,str1
call    PRINT_STR

lea     dx,buffer
mov     ah,0Ah
int     21h

call    NEWLINE

lea     dx,str2
call    PRINT_STR

mov     ah,01h
int     21h
sub     al,48d
mov     [key], al

lea     si,buffer+2     ;
lea     di,encryptedWord
mov     cl,[buffer+1]
encryptionLoop:
        mov     al,[si]
        
        cmp     al,"$"
        je      encryptionLoopExit

        add     al,[key]

        mov     [di],al

        inc     si
        inc     di
        loop    encryptionLoop
encryptionLoopExit:

call    NEWLINE

lea     dx,str3
call    PRINT_STR

lea     dx,encryptedWord
call    PRINT_STR

call    NEWLINE

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
