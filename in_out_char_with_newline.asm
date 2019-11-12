
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
MOV AH,1
INT 21H
MOV BL,AL 
;ADD DL,-10
; PRINTING NEW LINE
MOV AH,2
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H

MOV DL,BL
MOV AH,2
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN



