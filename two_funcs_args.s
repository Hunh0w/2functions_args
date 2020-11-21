SECTION INTVEC

B main

SECTION CODE

func2
LDR R0, [R12]
SUB R12, R12, #4
LDR R1, [R12]
EOR R6, R0, R1
EOR R0, R0, R0
EOR R1, R1, R1

POP {R0}
MOV PC, R0

func1
LDR R0, [R12]
SUB R12, R12, #4
LDR R1, [R12]
MUL R5, R0, R1
EOR R0, R0, R0
EOR R1, R1, R1

MOV R1, #0xCA
MOV R2, #0xAC
STR R1, [R12]
ADD R12, R12, #4
STR R2, [R12]

MOV R0, PC
ADD R0, R0, #8
PUSH {R0}
B func2

POP {R0}
MOV PC, R0

main
LDR SP, =pileaddr
LDR R12, =pileargs
ADD SP, SP, #40
MOV R1, #0xCE
MOV R2, #0xEC
STR R1, [R12]
ADD R12, R12, #4
STR R2, [R12]
MOV R0, PC
ADD R0, R0, #8
PUSH {R0}
B func1
B fin

fin
B fin

SECTION DATA
pileaddr ALLOC32 10 ; LIFO
pileargs ALLOC32 30 ; LIFO