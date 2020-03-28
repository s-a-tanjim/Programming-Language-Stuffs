; This program will take string as input and print them in 
; reverse order


.model small
.stack 100h
.data

string db ?  
msgIn db 'Please enter a binary number: $'
msgRes db 0Ah,0Dh,'After reversing the input: $'

.code

proc main
    
    MOV AX,@data
    MOV DS,AX
    MOV SI,offset string     

    LEA DX,msgIn
    MOV AH,9
    INT 21h
    
    MOV CL,0h
        
    input:
    MOV AH,1
    INT 21h
    CMP AL,0Dh
    JE input_end
    MOV [SI],AL
    INC SI
    ADD CL,1h
    JMP input        
    input_end:
    MOV [SI],'$'     
    DEC SI
    
    LEA DX,msgRes
    MOV AH,9
    INT 21h
    
    
    loop_again:
    CMP CL,0h
    JE exit
    
    MOV DL,[SI]
    MOV AH,2
    INT 21h
    DEC SI
    SUB CL,1h
    JMP loop_again
    
    
    
    exit:
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    main endp
end main