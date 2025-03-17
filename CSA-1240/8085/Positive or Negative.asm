MVI A, 9AH     ; Load the number (9A Hex) into Accumulator (A)
ANI 80H        ; AND operation with 80H (Check MSB for sign)
JZ POSITIVE    ; If Zero Flag (Z) is set, jump to POSITIVE (Number is positive)
MVI A, 11H     ; If negative, load 11H (Indicates Negative)
JMP STORE      ; Jump to STORE to save the result
POSITIVE: MVI A, 22H  ; If positive, load 22H (Indicates Positive)
STORE: STA 8051H   ; Store the result at memory location 8051H
HLT             ; Halt the program execution
