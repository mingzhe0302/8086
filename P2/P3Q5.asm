.model small
.stack 100
.data

prmp_message db 'Please enter a digit: $'
op_message1 db 'times$'
op_message2 db 'returns$'
result db ?
var1 db ?


    
.code
main proc
	mov ax,@data
	mov ds,ax
    
    ;print the prompt message
    lea dx, prmp_message 
    mov ah, 09h
    int 21h

    ;store the input value
    mov ah, 01h
    int 21H 

    sub al, 30h
    mov var1, al
    mul var1
    mov result, al

    ;print the newline character
    mov dl, 0Ah
    mov ah, 02h
    int 21H

    ;output the input value
    mov ah, 02h
    mov dl, var1
    add dl, 30h 
    int 21H

    ;print the blank space
    mov dl, 20H     ;32 (space)
    mov ah, 02h      
    int 21H
    
    ;print the output message
    mov ah, 09h
    lea dx, op_message1
    int 21H 

    ;print the blank space
    mov dl, 20H     ;32 (space)
    mov ah, 02h      
    int 21H

    ;output the input value
    mov ah, 02h
    mov dl, var1
    add dl, 30h 
    int 21H

    ;print the blank space
    mov dl, 20H     ;32 (space)
    mov ah, 02h      
    int 21H

    ;print the output message
    mov ah, 09h
    lea dx, op_message2
    int 21H 

    ;print the blank space
    mov dl, 20H     ;32 (space)
    mov ah, 02h      
    int 21H

    ;print the result
    mov ah, 02h
    mov dl, result
    add dl, 30h
    int 21h

    ; Exit program
    mov ah, 4ch
    int 21h

main endp
	end main
