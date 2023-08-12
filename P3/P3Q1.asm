.model small
.stack 100h
.data
	
    data1 db 'MILK', '$'
    data2 db 4 dup ('*'), '$'

    var1 db 'data1: ', '$'
    var2 db 'data2: ', '$'

    var3 db 'Initial content', '$'
    var4 db 'After Replacement', '$'

	len db 04h
.code


MAIN PROC                               
    ; Set up data segment
    MOV AX, @DATA
    MOV DS, AX

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
    mov cl, len
    rep movsb

    mov ah, 09h
    lea dx, data2
    int 21H

	;exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP                               

NEWLINE PROC
    mov ah, 02h
    mov dl, 0ah ;new line
    int 21H
    mov dl, 0dh ;linefeed
    int 21H

    ret         ;return to the calling mode

NEWLINE ENDP


END MAIN