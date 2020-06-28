
  ld  a,      (adr1) ; load op1 into a
  ld  hl,     (adr2) ; load address of op2 into hl
  add a,      (hl)   ; add op2 to op1
  ld  (adr3), a      ; save result res at adr3
