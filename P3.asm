.model small
.stack 100
.data

val1 db 6
val2 db 3
val3 db 4
result db 0

.code
main proc
mov ax,@data
mov ds,ax

mov ah, val2
add ah, 5
sub ah, val1
add ah, val3

add ah, 48D 
mov result, ah

mov ah, 02H
mov dl, result 
int 21h


mov ax,4c00h
int 21h

main endp
end main