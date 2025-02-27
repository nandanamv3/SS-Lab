data SEGMENT
    MSG1 DB 10, 13, 'Enter the String:$'
    STR1 DB 50 DUP(0)
    MSG2 DB 10, 13, 'Reversed String: $'
data ENDS
code SEGMENT
ASSUME CS:code, DS:data
START:
    MOV AX, data
    MOV DS, AX
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    LEA DI, STR1
    MOV AH, 01H
NEXT:
    INT 21H          
    CMP AL, 0DH      
    JE TERMINATE     
    MOV [DI], AL     
    INC DI           
    JMP NEXT         
TERMINATE:
    MOV AL,"$"
    MOV [DI],AL
    DEC DI
DOTHIS:
    MOV AL,[SI]
    XCHG AL,[DI]
    XCHG AL.[SI]
    INC SI
    DEC DI
    CMP SI,DI
    JL DOTHIS
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    LEA DX, STR1
    MOV AH, 09H
    INT 21H   
    MOV AH, 4CH
    INT 21H
code ENDS
END START
