data segment
    msg1 db 0ah,0dh,"Enter the string : $"  ; Define a message for user input
    msg2 db 0ah,0dh,"Is a pallindrome $"  ; Define a message for a palindrome
    msg3 db 0ah,0dh,"Is not a pallindrome $"  ; Define a message for not a palindrome
    n db 09h dup(?)  ; Define a byte array 'n' to store the user-entered string
data ends

code segment
    assume cs:code, ds:data  ; Set the code and data segments
start:
    mov ax, data
    mov ds, ax  ; Initialize the data segment with the address of 'data'

    ;Getting offset of array
    mov si, offset n  ; Initialize SI with the offset of 'n'
    mov di, offset n  ; Initialize DI with the offset of 'n'

    ;Printing message1
    lea dx, msg1  ; Load the offset of 'msg1' into DX
    mov ah, 09h  ; Set AH register for displaying a string
    int 21h  ; Call DOS interrupt 21h to print the message

    mov cl, 00h  ; Initialize CL (counter) to 0

    ;Reading string
scan:
    mov ah, 01h  ; Set AH to read a character from the keyboard
    int 21h  ; Call DOS interrupt 21h to input a character

    cmp al, 0dh  ; Compare the input character to carriage return (Enter)
    jz ended  ; If Enter is pressed, jump to the 'ended' label

    mov [si], al  ; Store the character in the 'n' array
    inc cl  ; Increment the counter
    inc si  ; Move to the next element in the array
    jmp scan  ; Repeat the input process

ended:
    dec si  ; Move back to the last character entered
    mov bl, [si]  ; Load the last character into BL
    cmp [di], bl  ; Compare the first character with the last character
    jnz notpal  ; If they don't match, jump to 'notpal'
    inc di  ; Move to the next character
    dec cl  ; Decrement the counter
    jnz ended  ; If the counter is not zero, repeat the process

pal:
    ;Printing palindrome
    lea dx, msg2  ; Load the offset of 'msg2' into DX
    mov ah, 09h  ; Set AH register for displaying a string
    int 21h  ; Call DOS interrupt 21h to print the palindrome message
    jmp stoped  ; Jump to the 'stoped' label

notpal:
    ;Printing not palindrome
    lea dx, msg3  ; Load the offset of 'msg3' into DX
    mov ah, 09h  ; Set AH register for displaying a string
    int 21h  ; Call DOS interrupt 21h to print the not palindrome message

stoped:
    mov ah, 4ch  ; Set AH register for program termination
    int 21h  ; Call DOS interrupt 21h to terminate the program
code ends
end start

