.globl _vblank_isr
.globl _lcd_isr
.globl _timer_isr
.globl _serial_isr
.globl _joypad_isr

.module isr_table
.area _HEADER (ABS)

.org    0x40
jp _vblank_isr

.org    0x48
jp _lcd_isr

.org    0x50
jp _timer_isr

.org    0x58
jp _serial_isr

.org    0x60
jp _joypad_isr

