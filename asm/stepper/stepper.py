from ctypes import *

class Registers_16(Structure):
    _fields_ = [
            ('af', c_ushort),
            ('bc', c_ushort),
            ('de', c_ushort),
            ('hl', c_ushort),
            ('sp', c_ushort),
            ('pc', c_ushort),
            ]

    def values(self):
        return (
                self.af,
                self.bc,
                self.de,
                self.hl,
                )


    def csv(self):
        return ','.join(f"0x{x:04x}" for x in self.values())

    def __repr__(self):
        return f"regs: {self.csv()}"


class Registers_8(Structure):
    _fields_ = [
            ('f', c_ubyte), ('a', c_ubyte),
            ('c', c_ubyte), ('b', c_ubyte),
            ('e', c_ubyte), ('d', c_ubyte),
            ('l', c_ubyte), ('h', c_ubyte),
            ]

    def values(self):
        return (
                self.a, self.f,
                self.b, self.c,
                self.d, self.e,
                self.h, self.l,
                )


    def csv(self):
        return ','.join(f"0x{x:02x}" for x in self.values())

    def __repr__(self):
        return f"regs: {self.csv()}"


class gbz80_Registers(Union):
    _fields_ = [
            ('wr', Registers_16),
            ('br', Registers_8),
            ]

    def __repr__(self):
        return self.wr.__repr__()

regs = gbz80_Registers()
regs.wr.hl = 0x1234
regs.br.a = 0xFF
regs.br.b = 0xBE
regs.br.e = 0xFF

GB_Memory = c_ubyte * 0xFFFF

memory = GB_Memory()

program = [
        ('', 'ld a, (adr1)', 'load op1 into a'),
        ('', 'ld hl, (adr2)', 'load op1 into a'),
        ('', 'add a, (hl)', 'load op1 into a'),
        ('', 'ld (adr3), a', 'load op1 into a'),
        ]

print("label,instruction,af,bc,de,hl")

for line in program:
    label, instruction, comment = line
    print(f"{label},\"{instruction}\",{regs.wr.csv()}")

