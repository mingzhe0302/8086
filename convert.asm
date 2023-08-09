.model small
.stack 100
.data

val1 DB 'a'
comma DB ','
result DB 'A'

.code
main proc
mov ax,@data
mov ds,ax

 ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Convert 'a' to 'A'
    SUB val1, 32   ; ASCII 'a' - 32 = ASCII 'A'

    ; Print "a"
    MOV AH, 02H
    MOV DL, 'a'
    INT 21H

    ; Print ","
    MOV AH, 02H
    MOV DL, comma
    INT 21H

    ; Print "A"
    MOV AH, 02H
    MOV DL, result
    INT 21H


mov ax, 4c00h
int 21h

main endp
end main