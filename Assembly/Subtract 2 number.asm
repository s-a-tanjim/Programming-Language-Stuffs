; Thic code will take 2 input (X,Y) from user and subtract them
; Condition:
;	If(A>=B)
;		Y=A-B
;   Else
;		Y=B-A 

.model small
.stack 100h
.data

Aval db 'Enter the value of A : $'
Bval db 'Enter the value of B : $'
Rval db 'Result is: $'
new_line db 0AH,0DH,'$'

.code

proc main

;Initialize data segment
MOV AX,@data
MOV DS,AX

;Display Enter A
LEA DX,Aval
MOV AH,9
INT 21h

MOV AH,1
INT 21h
MOV BL,AL

;Display new line
LEA DX,new_line
MOV AH,9
INT 21h
;Display Enter B
LEA DX,Bval
MOV AH,9
INT 21h

MOV AH,1
INT 21h

CMP AL,BL
JA bGreat

SUB BL,AL
JMP exit


bGreat:
SUB AL,BL
MOV BL,AL

exit:

LEA DX,new_line
MOV AH,9
INT 21h
LEA DX,Rval
MOV AH,9
INT 21h


;diplay result
MOV DL,BL
ADD DL,30h
MOV AH,2
INT 21h


MOV AH,4ch
INT 21h

main endp
end main

