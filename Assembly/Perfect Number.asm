; The code will take a integer number as input and will find out whether it is a perfect number or not.
; [Hint: the divisors of 28 are 1, 2, 4, 7, 14; 28 = 1+2+4+7+14; so, 28 is a perfect number]

; Finding reminder:
; Divide 16-bit unsigned by 8-bit
;        mov     ax, 700               ; Load dividend      700
;        mov     bl, 36                ; Load divisor DIV    36
;        div     bl                    ; Divide BL       ------
;                                      ; Quotient in AL      19
;                                      ; Remainder in AH          16

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

inputMsg db 0Ah,0Dh,'Enter a number: $' 
perfectMsg db 0Ah,0Dh,'It is a perfect number.$'
notperfectMsg db 0Ah,0Dh,'It is not a perfect number.$'
numb db ?

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
  
  MOV numb,CL
              

  MOV CL,1h
  MOV BL,0h
  
  loop_1:
  CMP CL,numb
  JE loop_exit
  
  XOR AH,AH
  MOV AL,numb
  DIV CL
  
  CMP AH,0h
  JE add_al
  ADD CL,1h
  JMP loop_1
  add_al:
  ADD BL,CL
  ADD CL,1h
  JMP loop_1
  
  loop_exit:
  
  CMP BL,numb
  JE perfect
  LEA DX,notperfectMsg
  MOV AH,9
  INT 21h
  JMP exit  
  
  perfect:
  LEA DX,perfectMsg
  MOV AH,9
  INT 21h
  
  exit:
    
  MOV AH,4ch
  INT 21h  
    
main endp
end main