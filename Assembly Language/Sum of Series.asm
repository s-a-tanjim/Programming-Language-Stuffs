; This program will take an input n & calculate the sum of the series upto nth term. Then display the output in
; binary

; Series: 1 + 3+ 5+ 7+ …

; Example:
; Input:
;	3
; Output:
;	Sum is: 00001001



.model small
.stack 100h
.data

count db ?
res db ?
string db ?
msgRes db 0Ah,0Dh,'Sum is: $'

.code

proc main
    
    MOV AX,@data
    MOV DS,AX     

    MOV AH,1
    INT 21h    
    SUB AL,30h
    MOV CL,AL     
    
    LEA DX,msgRes
    MOV AH,9
    INT 21h
           
    MOV BL,1h
    MOV count,1h
    MOV res,0h
    
    loop_again:
    
    CMP count,CL
    JA exit
    ADD res,BL
    ADD BL,2h
             
    ADD count,1h
    JMP loop_again    
    
    exit:
    
    MOV CL,8h
    MOV BL,80h
    looop:
    CMP CL,0h
    JE end_loop 
    
    SUB CL,1h
    MOV DL,BL
    AND DL,res
    SHR DL,CL
    ADD DL,30h
    MOV AH,2
    INT 21h
    SHR BL,1
    JMP looop
    
    end_loop:
    
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    main endp
end main