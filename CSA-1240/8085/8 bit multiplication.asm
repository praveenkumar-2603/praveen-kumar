LDA 2200    ; Load first number
MOV E, A    ; Move to E
MVI D, 00   ; Initialize D
LDA 2201    ; Load second number
MOV C, A    ; Move to C
LXI H, 0000 ; Initialize HL pair
BACK: DAD D ; Add DE to HL
DCR C       ; Decrement C
JNZ BACK    ; Loop until C=0
SHLD 2202   ; Store result
HLT         ; Halt