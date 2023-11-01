DATA SEGMENT
    buffersize EQU 256
    inputString DB buffersize DUP(?)
    foundFlag DB 0   ; Flag to indicate whether the string is a palindrome (0 = not a palindrome, 1 = palindrome)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    MOV AX, DATA
    MOV DS, AX
    
    LEA DX, inputString
    MOV AH, 0AH
    INT 21H
    
    MOV CX, 0
    MOV DI, OFFSET inputString + 1
    
CHECK_PALINDROME:
    MOV AL, [DI]
    CMP AL, 00H
    JE END_CHECK
    
    INC DI
    INC CX
    
    JMP CHECK_PALINDROME

COMPARE_LOOP:
    DEC DI
    DEC CX
    MOV SI, DI
    MOV DI, OFFSET inputString + 1
    
    MOV AL, [DI]
    MOV BL, [SI]
    
    CMP AL, BL
    JNZ NOT_PALINDROME
    
    INC DI
    INC SI
    
    CMP CX, 0
    JNE COMPARE_LOOP
    
    JUMP PALINDROME
    
NOT_PALINDROME:
    MOV AL, 0
    MOV [foundFlag], AL
    JMP DISPLAY_RESULT
    
PALINDROME:
    MOV AL, 1
    MOV [foundFlag], AL

DISPLAY_RESULT:
    INT 20H

CODE ENDS

END

