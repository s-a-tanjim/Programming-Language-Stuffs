; Check balanced brackets
; Example input: [{a+(b-c)+f}+r] 
;         output: Correctly bracketed
; logic:
; If we get '(' '{' '[' push it to the stack
; Then if we get ']' '}' ')' Pop from stack and check

.model small
.stack 100h
.data

dummy db 'Dummy $'
correctMsg db 'Correctly bracketed$'
errorMsg db 'Not Correct$'
new_line db 0AH,0DH,"$"
string db ?
                      
.code

proc main
  
  ;Initialize data segment  
  MOV AX,@data
  MOV DS,AX
  MOV SI,offset string
  
  take_input:
  MOV AH,1
  INT 21h
  CMP AL,0Dh
  JE input_end    
  MOV [SI],AL
  INC SI
  JMP take_input
  input_end:
  MOV [SI],'$'
  MOV DI,offset string
  
  ;new line
  MOV DL,0Dh
  MOV AH,2
  INT 21h
  MOV DL,0ah
  MOV AH,2
  INT 21h
  
  ;Push dummy val
  XOR AX,AX
  MOV AL,'$'
  PUSH AX
  
  loop_again:
    CMP [DI],'$'
    JE exit_out_error 
    
    CMP [DI],'('
    JE push_val
    CMP [DI],'{'
    JE push_val
    CMP [DI],'['
    JE push_val
    
    CMP [DI],')'
    JE pop_val_1
    CMP [DI],'}'
    JE pop_val_2
    CMP [DI],']'
    JE pop_val_3
    
    INC DI
    JMP loop_again 
    
    push_val:
      XOR AX,AX
      MOV AL,[DI]
      PUSH AX
      INC DI
      JMP loop_again
    
    pop_val_1:
      XOR AX,AX
      POP AX
      CMP AL,'('
      JNE exit_with_error
      CMP AL,'$'
      JE exit_with_error
      INC DI
      JMP loop_again
     
    pop_val_2:
      XOR AX,AX
      POP AX
      CMP AL,'{'
      JNE exit_with_error
      CMP AL,'$'
      JE exit_with_error
      INC DI
      JMP loop_again 
    
    pop_val_3:
      XOR AX,AX
      POP AX
      CMP AL,'['
      JNE exit_with_error
      CMP AL,'$'
      JE exit_with_error
      INC DI
      JMP loop_again
    
  
  exit_with_error:
    LEA DX,errorMsg
    MOV AH,9
    INT 21h
    JMP exit
  
  exit_out_error:
    LEA DX,correctMsg
    MOV AH,9
    INT 21h
  
  exit:  
  ;DOS Exit
  MOV AH,4ch
  INT 21h  
    


main endp
end main                    