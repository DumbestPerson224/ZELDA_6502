section .data 
  link_x: dd 0
  link_y: dd 0
  link_health: dd 10 
  game_over: dd 0 
_start:
  mov eax, dword [link_x]
  mov edx, dword [link_y]
  mov ecx, dword [link_health]
  mov edx, dword [game_over]
  push eax 
  push edx 
  push ecx 
  push edx 
  
_incrementHealth:
  pop ecx 
  cmp ecx, 10
  jb .increment 
  .increment:
    inc ecx 
    push ecx 
    ret  

_decrementHealth:
  pop ecx 
  cmp ecx, 0
  jg .decrement 
  .decrement:
    dec ecx 
    push ecx 
    ret 
