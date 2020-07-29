; This program will take a binary input and show the corresponding output in
; Hexadecimal Number.
; Example:
;	Input:
;		Please enter the binary
;		number0010110010001111
;	Output:
;		The given number in Hexadecimal is 2B8F


.model small
.stack 100h
.data

string db ?

msg db 'Dummy $'
msgIn db 0Ah,0Dh,'Please enter the binary: $'
msgRes db 0Ah,0Dh,'The given number in Hexadecimal is: $'


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
    
    MOV CL,0h
    MOV BL,0h
    
    single_bit:
    MOV AL,[DI]
    SUB AL,30h
    SHL BL,1
    OR BL,AL    
    INC DI
    ADD CL,1h
    CMP CL,4h
    JE next_bit
    JMP single_bit
        
    next_bit:
    
    
    CMP BL,9h
    JA character
    ;number
    ADD BL,30h
    JMP print_val
    
    character:
    ADD BL,37h
    
    print_val:
    MOV DL,BL
    MOV AH,2
    INT 21h
    
    JMP loop_again
    
    exit:
    ;dos exit
    MOV AH,4ch
    INT 21h

    
    main endp
end main