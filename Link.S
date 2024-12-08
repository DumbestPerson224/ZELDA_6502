_storeCoordinates:
   push bp
   mov bp, sp
   mov ax, word ptr [bp - 4]
   mov dx, word ptr [bp - 8]
   mov [0xF000], ax
   mov [0xF001], dx 
   pop bp

_storeHealth:
  push bp
  mov bp, sp
  mov ax, word ptr [bp - 4]
  mov [0xF002], ax
  pop bp 
  mov si, 1
  ret

_storeInventory:
  push bp
  mov bp, sp
  mov ax, word ptr [bp - 4]
  mov [0xF003], ax

_storeAttackDamage:
  push bp
  mov bp, sp
  mov ax, word ptr [bp - 4]
  mov [0xF004], ax

_updateHealth:
  cmp si, 1
  je .getHealth
  .setupStackFrame:
    ; Get the attack damage dealt from the stack
    push bp
    mov bp, sp
    mov cx, word ptr [bp - 4]
    jmp .getHealth

  .getHealth:
    ; Get the health 
    mov dx, word ptr [0xF002]
    cmp bx, 0
    jg .update
    .update:
       cmp bx, 0 
       je .decrement
       jg .increment
       .decrement:
           dec ax
       .increment:
           inc ax
