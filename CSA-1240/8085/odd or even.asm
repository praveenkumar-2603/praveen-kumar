LDA 8050H    ; Load the accumulator with the content of memory location 8050H
ANI 01H      ; Perform logical AND operation with 01H
JZ EVEN      ; Jump to EVEN if the result is zero (even number)

MVI A,11H    ; Move immediate value 11H (odd indicator) into the accumulator
JMP STORE    ; Jump to STORE to save the result

EVEN: MVI A,22H  ; Move immediate value 22H (even indicator) into the accumulator

STORE: STA 8051H  ; Store the result at memory location 8051H
HLT        ; Halt the program
