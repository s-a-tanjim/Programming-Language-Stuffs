; Print pattern according to user input (N)
; example:
; Input:
;  n=4
; Output:
;    *
;   **
;  ***
; ****

.model small
.stack 100h
.data

n db ?
i db ?

new_l db 0AH,0DH,'$'

.code

proc main
    
    MOV AX,@data
    MOV DS,AX    
    
    ;input number
    MOV AH,1
    INT 21h
    SUB AL,30h
    MOV n,AL
    
	; Print new line
    LEA DX,new_l
    MOV AH,9
    INT 21h
        
    ; CL is the main counter
	MOV CL,1h
    
    loop_1:
    CMP CL,n
    JA exit
    
    MOV BL,n
    SUB BL,CL
    MOV i,0h
    
    loop_2: ; For printing space
    CMP i,BL
    JE loop_2_exit
    
    MOV DL,' '
    MOV AH,2
    INT 21h
    ADD i,1h
    JMP loop_2
    loop_2_exit:
    
    MOV i,0h
    
    loop_3:	; For printing *
    CMP i,CL
    JE loop_3_exit
    
    MOV DL,'*'
    MOV AH,2
    INT 21h
    
    ADD i,1h
    JMP loop_3
    
    loop_3_exit:
    
    LEA DX,new_l
    MOV AH,9
    INT 21h
    
    ADD CL,1h
    JMP loop_1
    exit:
                
    ;dos exit
    MOV AH,4ch
    INT 21h    

    main endp
end main 