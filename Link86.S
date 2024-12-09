section .data 
  link_x: dd 0
  link_y: dd 0
  link_health: dd 10 
  game_over: dd 0 
  
_resetHealth:
  mov dword [link_health], 10 

_decrementHealth:
  cmp dword [link_health], 0
  jg .decrement
  jz .setGameOver
  .decrement:
    dec dword [link_health]
 .setGameOver:
    mov dword [game_over], 1
