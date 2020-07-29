; This code is to solve given equation
; Y = 2X-Z+3
; Here X and Z are user input variable 
; If the output is greater than 9 then print a message “Bound exceeds” else print the value of Y.
; Example:
; 	Input:
; 		Enter the value of X : 3
; 		Enter the value of Z : 1
; 	Output:
; 		The value of Y is : 8


.model small
.stack 100h
.data

errMsg db 'Bound exceeds$'
Xval db 'Enter the value of X : $'
Yval db 'The value of Y is : $'
Zval db 'Enter the value of Z : $' 
new_line db 0AH,0DH,"$"   ;for new line


.code

proc main
  
  ;Initialize data segment  
  MOV AX,@data
  MOV DS,AX
               
  ;Display Enter X             
  LEA DX,Xval
  MOV AH,9
  INT 21h
  
  ;Take input X
  MOV AH,1
  INT 21h
  MOV BL,AL
  
  
  ; New line
  LEA DX,new_line
  MOV AH,9
  INT 21h             
  ;Display Enter Z             
  LEA DX,Zval
  MOV AH,9
  INT 21h
            
  ;Take input Z
  MOV AH,1
  INT 21h
  
  ;Y=2X-Z+3
  ADD BL,BL          
  SUB BL,AL          
  ADD BL,3h          
            
  
  ;Compare if value is greater than 9
  CMP BL,39h
  JA above9
             
  ;New Line
  LEA DX,new_line
  MOV AH,9
  INT 21h             
  ;Display The value of Y is :            
  LEA DX,Yval
  MOV AH,9
  INT 21h          
  
  MOV DL,BL
  MOV AH,2
  INT 21h          
  
  JMP exit          
  
  
  above9:
 
  ;New Line
  LEA DX,new_line
  MOV AH,9
  INT 21h             
  ;Display error msg            
  LEA DX,errMsg
  MOV AH,9
  INT 21h 
  
  
  exit:
  ;DOS Exit
  MOV AH,4ch
  INT 21h  
    

main endp
end main