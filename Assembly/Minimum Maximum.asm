; Find Max and min value from 3 input number
.model small
.stack 100h
.data

Aval db 'Enter 1st number: $'
Bval db 'Enter 2nd number: $'
Cval db 'Enter 3rd number: $'
new_line db 0AH,0DH,"$"
Mn db 'Minimum: $'
Mx db 'Maximum: $' 


.code


proc main
    
    ;Initialize data segment
    MOV AX,@data
    MOV DS,AX
    
    ;Input 1st number
    LEA DX,Aval
    MOV AH,9
    INT 21h
    MOV AH,1
    INT 21h
    
    MOV BL,AL
    
    ;input 2nd number
    LEA DX,new_line
    MOV AH,9
    INT 21h
    LEA DX,Bval
    MOV AH,9
    INT 21h
    MOV AH,1
    INT 21h
    
    CMP Al,BL
    
    JA Abig
    
    ;small store in CL
    MOV CL,AL
    JMP j1
    
    Abig:
    ;small store in CL
    MOV CL,BL
    ;big store in BL
    MOV BL,AL
    
    j1:
    ;input 3rd number
    LEA DX,new_line
    MOV AH,9
    INT 21h
    LEA DX,Cval
    MOV AH,9
    INT 21h
    MOV AH,1
    INT 21h
    
    CMP AL,BL
    JA Abig2
    
    CMP AL,CL
    JA exit
    
    MOV CL,AL
    JMP exit
    
    Abig2:
    ;big stores in BL
    MOV BL,AL
    
    exit:
    ;print minimum
    LEA DX,new_line
    MOV AH,9
    INT 21h
    LEA DX,Mn
    MOV AH,9
    INT 21h
    MOV DL,CL
    MOV AH,2
    INT 21h
    
    
    ;print maximum
    LEA DX,new_line
    MOV AH,9
    INT 21h
    LEA DX,Mx
    MOV AH,9
    INT 21h
    MOV DL,BL
    MOV AH,2
    INT 21h
    
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    main endp
end main