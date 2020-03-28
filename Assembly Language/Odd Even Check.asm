; Check the user input number is Odd or even
; Logic:
;	The LSB( least significant bit ) of the binary value of any even number is always 0

.model small
.stack 100h
.data

Xval db 'Enter the value of X: $'
evenVal db 'Given input is an even number$'       
oddVal db 'Given input is an odd number$'

.code

proc main
    
    
    ;Initialize data segment
    MOV AX,@data
    MOV DS,AX
    
    ;Print enter x val
    LEA DX,Xval
    MOV AH,9
    INT 21h
    
    ;Take input
    MOV AH,1
    INT 21h
    
    TEST AL,01h
    
    JZ evenFlag
    
    ;Odd value
    LEA DX,oddVal
    MOV AH,9
    INT 21h
    JMP exit
    
    evenFlag:
    LEA DX,evenVal
    MOV AH,9
    INT 21h
    
    exit:
    
    MOV AH,4ch
    INT 21h
    
    
    
    main endp
end main