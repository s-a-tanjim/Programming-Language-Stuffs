; This program will take digits as input until enter is pressed and count
; number of even digits in that input. Finally show the number of even digits.
; Example:
;	Input:
;		Please enter the input
;		12069874213654
;	Output:
;		Total number of even digits in input:8



.model small
.stack 100h
.data

numb db ?
string db ?

msg db 'Dummy $'
msgIn db 0Ah,0Dh,'Please enter the input $'
msgRes db 0Ah,0Dh,'Total number of even digits in input: $'


.code

proc main
    
    MOV numb,0
    
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
    
    ;compare input
    loop_again:
    CMP [DI],'$'
    JE loop_exit
    
    CMP [DI],'0'
    JE even
    CMP [DI],'2'
    JE even
    CMP [DI],'4'
    JE even
    CMP [DI],'6'
    JE even
    CMP [DI],'8'
    JE even
    
    JMP end
    
    even:
    ADD numb,1
    
    end:
    INC DI
    JMP loop_again
    
    loop_exit:
    
    
    ;diplay results
    
    ; display vowel
    LEA DX,msgRes
    MOV AH,9
    INT 21h
    MOV DL,numb
    ADD DL,30h
    MOV AH,2
    INT 21h
    

    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    
    main endp
end main