
.MODEL SMALL
.STACK 100H    

.DATA
str DB 80 DUP

.CODE   
MOV AX, @DATA
MOV DS, AX

MAIN PROC    
           
           
MOV SI,0           
MOV AH, 1
NEXT:
INT 21H                   
CMP AL, 0DH
JZ EXIT
MOV str[SI], AL

CMP str[SI],'z'
    ; ignoring spacial charecter
JG ignore  
CMP str[SI],'A'
JL ignore

CMP str[SI],96
JG  upper

CMP str[SI],90
JG  ignore

ADD str[SI],64
upper:
SUB str[SI],32
ignore:

INC SI
JMP NEXT            
EXIT:                 

DEC SI
            
MOV AH,2 
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H
            

OUTPUT:
MOV DL, str[SI]
INT 21H       
DEC SI
CMP SI, -1
JZ SESH 
JMP OUTPUT

SESH:
            
              
MOV AH, 4CH
INT 21H     

MAIN ENDP     

END MAIN
