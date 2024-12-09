section .data 
  link_x: dd 0
  link_y: dd 0
  link_health: dd 10 

_start:
  mov eax, dword [link_x]
  mov edx, dword [link_y]
  mov ecx, dword [link_health]
  push eax 
  push edx 
  push ecx 

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
  cmp ecx, 10
  jg .decrement 
  .decrement:
    dec ecx 
    push ecx 
    ret 
