.MODEL SMALL
.STACK 100H
.DATA
num1 db "number: 54$"
num2 db 10,13,"First digit of the number: $"
fdigit db ?               ; Reserve space for the first digit
.CODE
MAIN PROC
    MOV AX, @DATA          ; Initialize data segment
    MOV DS, AX

    ; Display the "number" string
    LEA DX, num1
    MOV AH, 9
    INT 21H

    ; Load the number 54 into AX
    MOV AX, 54             ; Number 54 to be processed
    MOV BL, 10             ; Divisor 10 (to get the first digit)

    ; Perform division (AX / 10)
    DIV BL                  ; AX / 10, quotient in AL, remainder in AH
    MOV fdigit, AH         ; Store the first digit (quotient) in fdigit

    ; Display the message for the first digit
    LEA DX, num2
    MOV AH, 9
    INT 21H

    ; Print the first digit by adding 48 to convert it to ASCII
    MOV AH, 2              ; DOS interrupt to display a single character
    MOV DL, fdigit         ; Load the first digit
    ADD DL, 48             ; Convert digit to ASCII
    INT 21H

    ; Exit program
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
