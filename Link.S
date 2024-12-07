
section .text
  global _start

_start:
   mov word ptr [0xF000], 0 ; Score
   mov word ptr [0xF001], 0 ; Link x axis
   mov word ptr [0xF002], 0 ; Link y axis
   mov word ptr [0xF003], 0 ; Game over

_incrementScore:
    inc word ptr [0xF000]

_decrementScore:
    cmp word ptr [0xF000], 0
    ja .decrement
    .decrement:
        dec word ptr [0xF000]
