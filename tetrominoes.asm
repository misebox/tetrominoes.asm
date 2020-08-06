section .text
global _start
_start:
  
  mov rcx, 14
  mov rax, 0
  mov rbx, 1

  mov r12, 0x7274716336330f
  ;mov r12, 0xf0cc6cc68e2e4e
  mov byte [shape+4], 0x0a

l1:
  push rax
  push rcx
  push rbx
  mov dword [shape], 0x20202020

  mov rcx, 4
  mov rax, 0
  mov rbx, 1
  mov r13, 0

line:
  mov r11, r12
  and r11, 1
  cmp r11, 0
  je space
  mov byte [shape + r13], '#'

space:
  shr r12, 1
  inc r13
  loop line

  mov rax, 1
  mov rdi, 1
  mov rsi, shape
  mov rdx, 6
  syscall

  xor byte [shape+5], 0x0a
  pop rbx
  pop rcx
  pop rax
  loop l1

  mov rax, 60
  mov rdi, 0
  syscall

section .bss
  shape resb 6

