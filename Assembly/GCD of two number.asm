; Find the greatest common divisor (GCD) of two numbers.
; logic:
; Store larger number in numb1 & smaller number in numb2
; From n=1 to numb2 check numb1%n==0 && numb2%n==0

; Finding reminder:
; Divide 16-bit unsigned by 8-bit
;        mov     ax, 700               ; Load dividend      700
;        mov     bl, 36                ; Load divisor DIV    36
;        div     bl                    ; Divide BL       ------
;                                      ; Quotient in AL      19
;

; Multiplication:
; 8-bit unsigned multiply
;        mov     al, 23     ; Load AL                     23
;        mov     bl, 24     ; Load BL                   * 24
;        mul     bl         ; Multiply BL              -----
;                           ; Product in AX              552
;                           ;   overflow and carry set

; Limitation of this code: Only can print GCD of 1digit  

.model small
.stack 100h
.data


numb1 db ? ;always big
numb2 db ? ;always small
gcd db ?

input1Msg db 0Ah,0Dh,'1st Number: $'
input2Msg db 0Ah,0Dh,'2nd Number: $'
resMsg db 0Ah,0Dh,'GCD: $'

.code

proc main
  
  MOV gcd,0
  
  ;init  
  MOV AX,@data
  MOV DS,AX
  MOV SI,offset input1Msg
  
  ;input1 msg
  LEA DX,input1Msg
  MOV AH,9
  INT 21h

  MOV CL,0h
  take_input_1:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE input1_end
    SUB AL,48
    MOV DL,AL
    MOV AL,CL
    MOV AH,0h 
    MOV BL,10
    MUL BL
    MOV CL,AL
    ADD CL,DL
    JMP take_input_1
  input1_end:
  
  MOV numb1,CL
              
  ;input2 msg
  LEA DX,input2Msg
  MOV AH,9
  INT 21h

  MOV CL,0h
  take_input_2:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE input2_end
    SUB AL,48
    MOV DL,AL
    MOV AL,CL
    MOV AH,0h 
    MOV BL,10
    MUL BL
    MOV CL,AL
    ADD CL,DL
    JMP take_input_2
  input2_end:
  
  MOV numb2,CL
  
  MOV AL,numb1
  CMP AL,numb2
  JAE no_need_swap
  ;swap numb1,numb2
  MOV AL,numb1
  MOV BL,numb2
  MOV numb1,BL
  MOV numb2,AL

  no_need_swap:

  
  MOV CL,1h
  main_loop:
  CMP CL,numb2
  JE loop_exit
    XOR AH,AH
    MOV AL,numb1
    DIV CL
    CMP AH,0h
    JE test_numb2
      ADD CL,1h
      JMP main_loop
    test_numb2:
      XOR AH,AH  
      MOV AL,numb2
      DIV CL
      CMP AH,0h
      JE got_gcd 
      ADD CL,1h
      JMP main_loop
      got_gcd:
      MOV BL,CL
      ADD CL,1h
      JMP main_loop

  loop_exit:
  
  LEA DX,resMsg
  MOV AH,9
  INT 21h

  MOV DL,BL
  ADD DL,48
  MOV AH,2
  INT 21h

  ;DOS exit
  MOV AH,4ch
  INT 21h  

main endp
end main