.model small
.stack 100
.data

a db 0dh, 0ah, "This is my first debug program!"
b db 0dh, 0ah,"$"

.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx, a
int 21h


mov ax,4c00h
int 21h

main endp
end main