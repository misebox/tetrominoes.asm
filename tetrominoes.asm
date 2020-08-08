section .text
global _start
_start:
  
  mov r12, 0x7274716336330f
  mov byte [shape+4], 0x0a

line:
  mov r13, 0

cell:
  mov r11, r12
  and r11, 1
  cmp r11, 0
  mov byte [shape + r13], ' '
  je space
  mov byte [shape + r13], '#'

space:
  shr r12, 1
  inc r13
  cmp r13, 4
  jl cell

  mov rax, 1
  mov rdi, 1
  mov rsi, shape
  mov rdx, 6
  syscall

  xor byte [shape+5], 0x0a

  cmp r12, 0
  jne line

exit:
  mov rax, 60
  mov rdi, 0
  syscall

section .bss
  shape resb 6

