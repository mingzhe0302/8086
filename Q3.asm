.model small
.stack 100
.data

vPrint db "Please enter a digit: "
vEnd db "$"
vDigit db 2


.code
main proc
mov ax,@data
mov ds,ax

;print string 
mov ah, vPrint 

mov ah, 09h
lea dx, vPrint
int 21h
mov ah, 01h  ;store input to AL
int 21h



mov ax, 4c00h
int 21h

main endp
end main
