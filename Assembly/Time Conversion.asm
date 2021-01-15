; The code will convert the time in seconds into hour-min-sec.
; Limit: For input range 0 to 255
; Multiplication:
; 8-bit unsigned multiply
;        mov     al, 23     ; Load AL                     23
;        mov     bl, 24     ; Load BL                   * 24
;        mul     bl         ; Multiply BL              -----
;                           ; Product in AX              552
;                           ;   overflow and carry set


.model small
.stack 100h
.data

inputMsg db 0Ah,0Dh,'Enter time in seconds: $' 
hrMsg db ' hours $'
minMsg db ' minutes $'
secMsg db ' seconds$'
hr db ?
min db ?
sec db ?
totalSec db ?

.code
proc main
  ;init  
  MOV AX,@data
  MOV DS,AX
  MOV SI,offset inputMsg
  
  ;input msg
  LEA DX,inputMsg
  MOV AH,9
  INT 21h

  MOV CL,0h
  take_input:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE input_end
    SUB AL,48
    MOV DL,AL
    MOV AL,CL
    MOV AH,0h 
    MOV BL,10
    MUL BL
    MOV CL,AL
    ADD CL,DL
    JMP take_input
  input_end:

  MOV totalSec,CL

  ;get sec
  XOR AH,AH
  MOV AL,CL
  MOV BL,60h
  DIV BL

  MOV sec,AH
  MOV CL,AL

  ;get min
  XOR AH,AH
  DIV BL

  MOV min,AH
  MOV hr,AL


  ;Display output

  MOV DL,hr
  MOV AH,2
  INT 21h

  LEA DX,hrMsg
  MOV AH,9
  INT 21h

  MOV DL,min
  MOV AH,2
  INT 21h

  LEA DX,minMsg
  MOV AH,9
  INT 21h

  MOV DL,sec
  MOV AH,2
  INT 21h

  LEA DX,secMsg
  MOV AH,9
  INT 21h


  ;dos exit 
  MOV AH,4ch
  INT 21h  

main endp
end main