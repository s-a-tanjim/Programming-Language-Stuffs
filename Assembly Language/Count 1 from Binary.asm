; Take a binary input and count the number of 1 in that input. Finally show the number of 1‟s in
; decimal.

.model small
.stack 100h
.data

numb_of_1 db ?
string db ?

msg db 'Dummy $'
msgBin db 0Ah,0Dh,'Please enter the binary number: $'
msgRes db 0Ah,0Dh,'Total number of 1 in decimal: $'


.code

proc main
    
    MOV numb_of_1,0
    
    MOV AX,@data
    MOV DS,AX
    MOV SI,offset string
    
    LEA DX,msgBin
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
    
    ;compare input
    loop_again:
    CMP [DI],'$'
    JE loop_exit
    
    CMP [DI],31h
    JNE end
    ADD numb_of_1,1
    
    end:
    INC DI
    JMP loop_again
    
    loop_exit:
    
    ; display Result
    LEA DX,msgRes
    MOV AH,9
    INT 21h
    MOV DL,numb_of_1
    ADD DL,30h
    MOV AH,2
    INT 21h
    
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    
    main endp
end main