; Take an input n & calculate the sum of the series up to nth term. Then display the output in
; decimal, 1.1 + 2.3 + 3.5 + 4.7 +…
; Output stores in hexadecimal
; Example input: 3
;         Output: Sum is: 22

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

outputMsg db 0Ah,0Dh,'Sum is: $' 
sum db ?
numb db ?

.code

proc main
  ;init  
  MOV AX,@data
  MOV DS,AX

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

  MOV BL,1h
  MOV CL,1h
  MOV sum,0h

  main_loop:
    CMP BL,numb
    JA exit
    XOR AH,AH ;Clear AH
    MOV AL,BL
    MUL CL
    ADD sum,AL
    ADD BL,1h
    ADD CL,2h
    JMP main_loop

  exit:

  LEA DX,outputMsg
  MOV AH,9
  INT 21h
  
  ;print sum in hexa form
  MOV DL,sum
  MOV AH,2
  INT 21h

  ;dos exit 
  MOV AH,4ch
  INT 21h  

main endp
end main