.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC

    ; 1 will request input
    
MOV AH,1
INT 21H  
    ; storing input into temporary register
MOV BL,AL

    ; converting upper to lower and vice-versa

CMP BL,'z'
JG ignore
CMP BL,'A'
JL ignore


CMP BL,96
JG  upper

CMP BL,90
JG  ignore

ADD BL,64
upper:
SUB BL,32
         
ignore:
    ;ADD DL,-10
    ; PRINTING NEW LINE (actually printing 80 chars)
    ; setting for output request
MOV AH,2 
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H

MOV DL,BL
MOV AH,2
INT 21H

MOV AH,4CH  ;eat extra printer char
INT 21H

MAIN ENDP
END MAIN