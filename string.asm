DATA SEGMENT
    buffersize EQU 256
    inputString DB buffersize DUP(?)
    inputSubstr DB buffersize DUP(?)
    foundFlag DB 0   ; Flag to indicate whether the substring is found (0 = not found, 1 = found)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    MOV AX, DATA
    MOV DS, AX
    
    LEA DX, inputString
    MOV AH, 0AH
    INT 21H
    
    LEA DX, inputSubstr
    MOV AH, 0AH
    INT 21H
    
    MOV CX, 0
    MOV DI, OFFSET inputString + 1
    
CHECK_SUBSTRING:
    MOV AL, [DI]
    CMP AL, 00H
    JE END_CHECK
    
    MOV SI, OFFSET inputSubstr + 1
    MOV BH, 0
    
COMPARE_LOOP:
    MOV AL, [DI]
    MOV BL, [SI]
    
    CMP AL, BL
    JNZ NOT_MATCH
    
    INC DI
    INC SI
    INC CX
    
    CMP BL, 00H
    JE FOUND_SUBSTRING
    
    JMP COMPARE_LOOP
    
NOT_MATCH:
    INC DI
    MOV SI, OFFSET inputSubstr + 1
    MOV CX, 0
    INC BH
    ADD DI, BH
    JMP CHECK_SUBSTRING
    
FOUND_SUBSTRING:
    MOV AL, 1   ; Set the found flag to 1 (substring found)
    MOV [foundFlag], AL
    JMP DISPLAY_RESULT

END_CHECK:
    INT 20H

DISPLAY_RESULT:
    INT 20H

CODE ENDS

END

