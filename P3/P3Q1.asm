.MODEL SMALL
.STACK 100H
.DATA 
	
    data1 db 'MILK', '$'
    data2 db '****', '$'

    var1 db 'data1: ', '$'
    var2 db 'data2: ', '$'

    var3 db 'Initial content', '$'
    var4 db 'After Replacement', '$'

	
.CODE 


MAIN PROC                               
    ; Set up data segment
    MOV AX, @DATA
    MOV DS, AX

    ;display initial content
    lea dx, data3
    mov ah, 09h
    int 21H
    
    call NEWLINE

    mov ah, 09h
    lea dx, var1
    int 21H

    lea dx, data1
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
                                       
END MAIN