global multiply
section .text

multiply:
  xor eax, eax
  xor ebx, ebx
  mov ecx, edi
  test ecx, ecx
  jns .loop

  neg ecx
  mov ebx, -1

.loop:
  add eax, esi
  dec ecx
  jnz .loop

  test ebx, ebx
  jns .return
  neg eax

.return:
  ret