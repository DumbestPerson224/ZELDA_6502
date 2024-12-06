section .data
  link_score: dw 0
  link_x: dw 0 
  link_y: dw 0
  game_over: dw 0 
section .text
  global _start

_start:
   mov word ptr [0xF000], mario_score
   mov word ptr [0xF001], mario_x
   mov word ptr [0xF002], mario_y
   mov word ptr [0xF003], game_over

_incrementScore:
    inc word ptr [0xF000]
