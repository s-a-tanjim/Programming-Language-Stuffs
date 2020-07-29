; This program will take a input n and calculate the sum of the given series
; upto nth terms.(n must be between 1 to 9)

; Series : 1*1+3*2+5*4+7*8+ . . .

; Example: For n=3 (1*1+3*2+5*4= 27)
;	Input: 3
;	Output:
;	  Sum is: 001B



.model small
.stack 100h
.data

count db ?
res db ?
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
    
    MOV AH,0h    
    MOV BL,1h
    MOV DL,1h
    MOV count,1h
    MOV res,0h
    
    loop_again:
    
    CMP count,CL
    JA exit
    MOV AL,BL
    MUL DL
    ADD res,AL    
    ;increase dl    
    MOV AL,2h
    MUL DL
    MOV DL,AL
    
    ADD BL,2h
    ADD count,1h
    JMP loop_again    
    
    exit:
    MOV CL,res
    MOV DL,0F0h
    AND DL,CL
    SHR DL,1
    SHR DL,1
    SHR DL,1
    SHR DL,1
    
    CMP DL,9h
    JA character
    ADD DL,30h
    JMP l1
    character:
    ADD DL,37h
    l1:
    MOV AH,2
    INT 21h
    
    MOV DL,0Fh
    AND DL,CL
    CMP DL,9h
    JA character2
    ADD DL,30h
    JMP l2
    character2:
    ADD DL,37h
    l2:
    
    MOV AH,2
    INT 21h
    
    
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    main endp
end main