LHLD 2050H     ; Load first 16-bit number from memory (2050H-2051H) into HL
SPHL           ; Copy HL to Stack Pointer (SP)

LHLD 2052H     ; Load second 16-bit number from memory (2052H-2053H) into HL
XCHG           ; Exchange HL and DE (Now DE holds second number)

LXI H, 0000H   ; Clear HL register pair for result
LXI B, 0000H   ; Clear BC register pair (higher 16-bits of result)

AGAIN: DAD SP  ; Add the first number (stored in SP) to HL (HL += SP)
JNC START      ; If no carry, jump to START
INX B          ; If carry, increment BC (higher 16-bit result)

START: DCX D   ; Decrement DE (second number)
MOV A, E       ; Move E to accumulator
ORA D          ; Perform OR operation (check if DE = 0)
JNZ AGAIN      ; If DE is not zero, continue looping

SHLD 2054H     ; Store lower 16-bit result in memory (2054H-2055H)
MOV L, C       ; Move BC (higher 16-bit result) into HL
MOV H, B
SHLD 2056H     ; Store higher 16-bit result in memory (2056H-2057H)

HLT            ; Halt execution
