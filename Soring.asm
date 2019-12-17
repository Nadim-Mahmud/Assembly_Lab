.MODEL SMALL
.STACK 100H    

.DATA
	str DB 80 DUP ?
	MSG DB "Enter a string:$"
	vowel_ DB "Number of Vowel: $"
	cons_ DB "Number of Consonants: $"
	space_ DB "Number of Space: $"
	number_ DB "Number of Number: $"
	tmp DW 0
	cc DB '0'
	space DB '0'
	num DB '0'
	    

.CODE   

MAIN PROC
    MOV AX, @DATA
	MOV DS, AX
	
	MOV AH,9
	LEA DX, MSG
	INT 21H
	
	MOV BL,48           
	MOV CL,48
	MOV SI,0
	MOV DI,0 
	
NEXT:
    MOV AH,1
	INT 21H
	CMP AL,0DH
	JZ EXIT
	
	MOV str[SI], AL
ignore:

    INC SI
    JMP NEXT
    
EXIT:
	
	MOV AH, 2
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H

;initializing 

MOV tmp,SI
MOV SI,0
MOV DI,0

; Sorting Segment

TOP :
    CMP SI,tmp
    JZ ETOP
    MOV DI,SI
    INC DI        
    MID :    
        CMP DI,tmp
        JZ EMID
        
        MOV DL,str[DI]
        CMP DL,str[SI]
        JGE LG
            MOV DL,str[DI]
            MOV BL,str[SI]
            MOV str[DI],BL
            MOV str[SI],DL
        IG :
        INC DI
        JMP MID    
    EMID :    
    INC SI
    JMP TOP
ETOP:	

; Printing segment
	
MOV DI,0
LP:	
	MOV AH, 2
	MOV DL,str[DI]
	INT 21H
    INC DI
    CMP DI,tmp
    JZ SESH
    JMP LP
SESH:	
	
	MOV AH, 4CH
	INT 21H

	MOV AH,4CH

MAIN ENDP
END MAIN
	
	
	
	