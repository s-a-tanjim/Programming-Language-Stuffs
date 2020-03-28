; This program  will count the number of vowels , consonants &
; digits from a user given input. The program will take input until „ENTER‟ button is pressed.
; (count vowels and consonants from lower case letters, any input other than lowercase letters and
; digits will not be considered).



.model small
.stack 100h
.data

vowel db ?
cons db ?
digit db ?
string db ?

msgVow db 'Number of Vowels: $'
msgCon db 0Ah,0Dh,'Number of consonants: $'
msgDig db 0Ah,0Dh,'Number of digits: $'
msgVow22 db 'Number of Vowels: $'


.code

proc main
    
    MOV vowel,0
    MOV cons,0
    MOV digit,0
    
    
    MOV AX,@data
    MOV DS,AX
    MOV SI,offset string
    
    ;take input of string
    take_input:
    MOV AH,1
    INT 21h
    CMP AL,0Dh	; Checking if Enter is pressed or not
    JE input_end
    MOV [SI],AL
    INC SI
    JMP take_input
    input_end:
    MOV [SI],'$'	; Add $ at the end of the string
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
    
    CMP [DI],30h
    JB end
    CMP [DI],39h
    JA maybe_alpha
    ADD digit,1
    JMP end
    
    maybe_alpha:
    
    CMP [DI],61h
    JB end
    CMP [DI],7Ah
    JA end
    CALL alpha_count    
    
    end:
    INC DI
    JMP loop_again
    
    loop_exit:
    
    
    ;diplay results
    
    ; display vowel
    LEA DX,msgVow22
    MOV AH,9
    INT 21h
    MOV DL,vowel
    ADD DL,30h
    MOV AH,2
    INT 21h
    
    ;display consonant
    LEA DX,msgCon
    MOV AH,9
    INT 21h
    MOV DL,cons
    ADD DL,30h
    MOV AH,2
    INT 21h 
    
    ;display digits
    LEA DX,msgDig
    MOV AH,9
    INT 21h
    MOV DL,digit
    ADD DL,30h
    MOV AH,2
    INT 21h
    
    
    ;dos exit
    MOV AH,4ch
    INT 21h
    
    
alpha_count:
    CMP [DI],'a'
    JE vowel_flag
    CMP [DI],'e'
    JE vowel_flag
    CMP [DI],'i'
    JE vowel_flag
    CMP [DI],'o'
    JE vowel_flag
    CMP [DI],'u'
    JE vowel_flag
    
    ADD cons,1
    JMP end_func
    
    vowel_flag:
    ADD vowel,1

    end_func:
    ret
    
    main endp
end main