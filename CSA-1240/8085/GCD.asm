LXI H, 6000H    ; Load address 6000H into HL register pair
MOV A, M        ; Move first number into register A
INX H           ; Increment HL to point to second number
MOV B, M        ; Move second number into register B

LOOP: CMP B     ; Compare A with B
      JZ STORE  ; If A == B, store result
      JC EXG    ; If A < B, swap values
      SUB B     ; A = A - B
      JMP LOOP  ; Repeat process

EXG:  MOV C, B  ; Store B in C
      MOV B, A  ; Move A to B
      MOV A, C  ; Move C (original B) to A
      JMP LOOP  ; Repeat process

STORE: STA 6009H ; Store GCD at memory location 6009H
       HLT      ; Halt the program
