; This program will take a Hexadecimal input and show the corresponding
; output inBinary.
; Example:
;	Input:
;		Please enter the Hexadecimal number
;		2B8F
;	Output:
;		The given number in Binary is
;		0010110010001111



.model small
.stack 100h
.data

string db ?

msg db 'Dummy $'
msgIn db 0Ah,0Dh,'Please enter the Hexadecimal number: $'
msgRes db 0Ah,0Dh,'The given number in Binary is: $'


.code

proc main
    
    MOV AX,@data
    MOV DS,AX
    MOV SI,offset string
    
    LEA DX,msgIn
    MOV AH,9
    INT 21h
    
    ;take input of string
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
        
        
    ; display msg
    LEA DX,msgRes
    MOV AH,9
    INT 21h

    
    ;Convert
    loop_again:
    CMP [DI],'$'
    JE exit
    MOV BL,[DI]
    INC DI
    MOV CL,0h    ; CL for counter
    
    CMP BL,39h
    JA character
    SUB BL,30h
    JMP l1    
    character:
    SUB BL,37h
    l1:  
          
    single_bit:    

    MOV DL,8h
    AND DL,BL
    SHR DL,3h
    ADD DL,30h
    ;print bin
    MOV AH,2
    INT 21h
    
    SHL BL,1h
    ADD CL,1h
    CMP CL,4h
    JE loop_again
    JMP single_bit
        
    
    exit:
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    main endp
end main