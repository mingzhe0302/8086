.model small
.stack 100h
.data

    data1 db 'MILK', '$'
    data2 db '****', '$'

    var1 db 'data1: ', '$'
    var2 db 'data2: ', '$'

    var3 db 'Initial content', '$'
    var4 db 'After Replacement', '$'
    var5 db 'After Reverse', '$'

	LEN db 04h

.code

    MAIN PROC

        ; Set up data segment
    MOV AX, @DATA
    MOV DS, AX

    MOV ES,AX      
    lea SI, data1
    lea DI, data2


    ;display initial content
    lea dx, var3
    mov ah, 09h
    int 21H
    
    call NEWLINE

    ;print "data1: MILK"
    mov ah, 09h
    lea dx, var1
    int 21H

    lea dx, data1
    int 21H

    call NEWLINE

    ;print "data2: ****"
    mov ah, 09h
    lea dx, var2
    int 21H

    lea dx, data2
    int 21h


    call NEWLINE
    call NEWLINE

    ;display after Replacement value
    lea dx, var4
    mov ah, 09h
    int 21H

    call NEWLINE
    
    mov ah, 09h
    lea dx, var1
    int 21H

    lea dx, data1
    int 21H

    call NEWLINE

    mov ah, 09h
    lea dx, var2
    int 21H
    CLD         ;clear direction flag
    mov ch, 00h
    mov cl, LEN
    rep movsb
    mov ah, 09h
    lea dx, data2
    int 21H

    call NEWLINE
    call NEWLINE

    ;load address of the string 
    lea dx, var5
    mov ah, 09h
    int 21H

    call NEWLINE

    lea dx, var1
    mov ah, 09h
    int 21H

    lea dx, data1
    mov ah, 09h
    int 21H

    call NEWLINE

    lea dx,var2
    mov ah, 09h
    int 21H

    call REVERSE
    lea dx, data1
    mov ah, 09h
    int 21h

        ;exit
        MOV AH, 4CH
        INT 21H

    MAIN ENDP

    REVERSE PROC
        ;load the offset of the string 
        mov si, offset data1

        ;count of characters of the string
        mov cx, 00h

        LOOP1:
        ;compare if this is the last character
        mov ax, [si]
        cmp al, '$'
        je LABEL1

        ;else put in the stack
        push [si]

        inc si
        inc cx

        jmp LOOP1

        LABEL1:
        ;again load the starting address of the string 
        mov si, offset data1

            LOOP2:
            ;if count not equal to 0
            cmp cx, 0
            je exit

            ;pop the top of stack
            pop dx

            ;make dh, 0
            xor dh, dh

            ;put the character of the reversed string 
            mov [si], dx

            ;increment si and decrement count 
            inc si
            dec cx

            jmp LOOP2

        EXIT:
        ;add $ to the end of the string 
        mov [si], '$ '
        ret

    REVERSE ENDP

    NEWLINE PROC
    
        mov ah, 02h
        mov dl, 0ah ;new line
        int 21H
        mov dl, 0dh ;linefeed
        int 21H

        ret         ;return to the calling mode



    NEWLINE ENDP

END MAIN