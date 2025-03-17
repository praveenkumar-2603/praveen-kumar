        LXI H, 8050H      ; Load address 8050H into HL register pair
        MOV B, M         ; Move value from memory (8050H) into B register (N value)
        MVI D, 01H       ; Initialize D register with 01H (Factorial result)

FACT:   CALL MUL         ; Call multiplication subroutine
        DCR B           ; Decrement B
        JNZ FACT        ; Jump back to FACT if B is not zero
        
        INX H           ; Increment HL to store result at 8051H
        MOV M, D        ; Store factorial result at 8051H
        HLT             ; Halt the program

MUL:    MOV E, B        ; Move B to E (Multiplier)
        XRA A           ; Clear A register (Accumulator for multiplication)

ML:     ADD D          ; Add D (Partial factorial result) to A
        DCR E          ; Decrement E
        JNZ ML         ; Repeat until E becomes zero
        
        MOV D, A       ; Move the result from A to D
        RET           ; Return from subroutine