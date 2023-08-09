.model small
.stack 100
.data

val1 db "A"
result db  0


.code
main proc
mov ax,@data
mov ds,ax

;convert "A" to "a"
mov ah, val1
add ah, 32
mov result, ah

;print "A"
mov ah, 02H
mov dl, val1
int 21h

;print ","
mov ah,02H
mov dl, 44
int 21h

;print "a"
mov ah, 02H
mov dl, result
int 21h

mov ax,4c00h
int 21h

main endp
end main