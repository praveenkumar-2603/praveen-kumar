LXI H, 8000H    ; Load address 8000H into HL register pair
MOV C, M        ; Move first number into register C
INX H           ; Increment HL to point to second number
MOV B, M        ; Move second number into register B

CALL GCD        ; Call the GCD subroutine

MOV A, C        ; Move first number into A
MOV D, A        ; Store first number in D
MOV A, B        ; Move second number into A
MOV E, A        ; Store second number in E

CALL MULTIPLY   ; Call multiplication subroutine to compute A * B
MOV D, H        ; Store higher byte of product in D
MOV E, L        ; Store lower byte of product in E

CALL DIVIDE     ; Call division subroutine to compute (A * B) / GCD

LXI H, 8011H    ; Load address 8011H
MOV M, L        ; Store LCM (lower byte) at memory location 8011H
HLT             ; Halt the program

; Subroutine to compute GCD using Euclidean Algorithm
GCD:
MOV A, C        ; Load first number into A
CMP B           ; Compare A and B
JZ DONE         ; If A == B, GCD found
JC SWAP         ; If A < B, swap values

SUB B           ; A = A - B
MOV C, A        ; Store new A in C
JMP GCD         ; Repeat process

SWAP:
MOV A, B        ; Move B to A
MOV B, C        ; Move C to B
MOV C, A        ; Move A to C
JMP GCD         ; Repeat process

DONE:
RET             ; Return from GCD subroutine

; Subroutine for multiplication (D * E)
MULTIPLY:
MVI H, 00H      ; Initialize H to 0
MVI L, 00H      ; Initialize L to 0
MOV A, D        ; Load first number into A

MUL_LOOP:
ADD L           ; Add L to A
MOV L, A        ; Store result in L
MOV A, H        ; Move H to A
ADC H           ; Add with carry
MOV H, A        ; Store result in H
DCR E           ; Decrement E
JNZ MUL_LOOP    ; Repeat if E != 0
RET             ; Return from multiplication subroutine

; Subroutine for division (DE / B)
DIVIDE:
MOV A, D        ; Move high byte into A
MOV H, A        ; Store in H
MOV A, E        ; Move low byte into A
MOV L, A        ; Store in L
MVI C, 00H      ; Counter for quotient

DIV_LOOP:
CMP B           ; Compare L with divisor
JC DIV_DONE     ; If L < B, division complete

SUB B           ; Subtract divisor from L
MOV L, A        ; Store result in L
INR C           ; Increment quotient
JMP DIV_LOOP    ; Repeat

DIV_DONE:
MOV L, C        ; Store quotient in L
RET             ; Return from division subroutine
