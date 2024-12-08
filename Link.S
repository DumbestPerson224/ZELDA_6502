_getCoordinates:
   push bp
   mov bp, sp
   mov ax, word ptr [bp - 4]
   mov dx, word ptr [bp - 8]
   mov [0xF000], ax
   mov [0xF001], dx 
   pop bp

_getHealth:
  push bp
  mov bp, sp
  mov ax, word ptr [bp - 4]
  mov [0xF002], ax
  pop bp 
