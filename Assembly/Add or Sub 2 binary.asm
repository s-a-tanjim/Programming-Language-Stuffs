; This program will takes 2 inputs in binary and takes a sign
; "+‟ or "-‟ as input and perform the corresponding operation. Then print the result in binary.
; Example: 
; 	Input:
; 		Enter the value of number_1 : 10101101
; 		Enter the value of number_2 : 00100101
; 		Enter the sign: +
; 	Output:
; 		Result is: 11010010



.model small
.stack 100h
.data

string db ?

msg db 'Dummy $'
msgSin db 0Ah,0Dh,'Enter the sign: $'
msgIn1 db 0Ah,0Dh,'Enter the value of number_1: $'
msgIn2 db 0Ah,0Dh,'Enter the value of number_2: $'
msgRes db 0Ah,0Dh,'Result is: ',0Ah,0Dh,'$'
 

.code

proc main
    
    MOV AX,@data
    MOV DS,AX
    MOV SI,offset string
    
    LEA DX,msgIn1
    MOV AH,9
    INT 21h    
    
    ;input 1st string
    MOV BL,0h
    input1:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE input_1_end
    SUB AL,30h
    SHL BL,1
    OR BL,AL    
    JMP input1            
    input_1_end:
    
    LEA DX,msgIn2
    MOV AH,9
    INT 21h
    
    ;input 2nd string
    MOV CL,0h
    input2:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE input_2_end
    SUB AL,30h
    SHL CL,1
    OR CL,AL   
    JMP input2
    input_2_end:
    
    
    LEA DX,msgSin
    MOV AH,9
    INT 21h
    
    MOV AH,1
    INT 21h
    
    CMP AL,'+'
    JE plus
    
    SUB BL,CL
    JMP printing
    plus:    
    ;Add
    ADD BL,CL
    
    printing: 
    
    LEA DX,msgRes
    MOV AH,9
    INT 21h
    
    MOV AL,0h
    
    loop_again:
    CMP BL,0h
    JE exit
    MOV CL,1h
    AND CL,BL
    ADD CL,30h
    MOV [SI],CL
    INC SI
    SHR BL,1h
    ADD AL,1h
    JMP loop_again
    exit:    
    
    MOV [SI],'$'
    DEC SI
    
    MOV BL,AL
    
    print_next:
    
    CMP BL,0h
    JE final_exit
    MOV DL,[SI]
    MOV AH,2
    INT 21h
    SUB BL,1h    
    DEC SI
    JMP print_next
    final_exit:
        
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    main endp
end main