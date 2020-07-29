; Take an user input. Check whether it is a digit or a character. If it is a character then check whether
; it is Vowel or Consonant. In case of Vowel print a message called “Given input is a Vowel” and In
; case of Consonant print a message called “Given input is a Consonant”. If it is a digit then print a
; message called “Given input is a number”. Otherwise print a message saying invalid input. Ask the
; user if he or she want to give another input. If „Y‟ then do the same process again else if „N‟ then
; quit.



.model small
.stack 100h
.data

Xval db 'Enter the value of X: $'
Numb db 0AH,0DH,'Given input is a number$'
Another db 0AH,0DH,'Do you want to give another input?',0AH,0DH,'$'
cons db 0AH,0DH,'Given input is a Consonant$'
vow db 0AH,0DH,'Given input is a Vowel$'
invalid db 0AH,0DH,'Invalid input$'


.code


proc main
    
    MOV AX,@data
    MOV DS,AX
    
    start:
    
    LEA DX,Xval
    MOV AH,9
    INT 21h
    MOV AH,1
    INT 21h
    MOV BL,AL
    
    
    CMP BL,30h
    JB invalid_flag    
    
    CMP BL,39h
    JA maybe_alpha
    ;Print number          
    
    LEA DX,Numb
    MOV AH,9
    INT 21h
    JMP exit          
    
    
    maybe_alpha:
    
    CMP BL,41
    JB invalid_flag
    
    CMP BL,5Ah
    JA maybe_alpha2
    ;check vowel
    CALL check_alpha
    JMP exit
    maybe_alpha2:
    
    CMP BL,61h
    JB invalid_flag
    
    CMP BL,7Ah
    JA invalid_flag
    ;check vowel
    CALL check_alpha
    JMP exit
    
    
    invalid_flag:
    
    LEA DX,invalid
    MOV AH,9
    INT 21h
    
    
    exit:
    ; again check
    
    LEA DX,Another
    MOV AH,9
    INT 21h
    MOV AH,1
    INT 21h
    
    CMP AL,59h
    JE start
    CMP AL,79h
    JE start
    
    
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    
check_alpha:
    CMP BL,41h
    JE vowel
    CMP BL,45h
    JE vowel
    CMP BL,49h
    JE vowel
    CMP BL,4Fh
    JE vowel
    CMP BL,55h
    JE vowel
    CMP BL,61h
    JE vowel
    CMP BL,65h
    JE vowel
    CMP BL,69h
    JE vowel
    CMP BL,6Fh
    JE vowel
    CMP BL,75h
    JE vowel
    
    ;Print consonant
    LEA DX,cons
    MOV AH,9
    INT 21h
    
    JMP ret_fn
    vowel:
    ;Print vowel
    LEA DX,vow
    MOV AH,9
    INT 21h
    ret_fn:
    ret
    
    
    main endp
end main