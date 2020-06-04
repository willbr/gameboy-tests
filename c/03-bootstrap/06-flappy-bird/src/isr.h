#ifndef ISR_H
#define ISR_H

#include "gameboy.h"

void timer_isr(void) __interrupt
{
    breakpoint();
}

void vblank_isr(void) __critical __interrupt
{
    poll_joypad();
    //breakpoint();
}

void lcd_isr(void) __critical __interrupt
{
    breakpoint();
}

void serial_isr(void) __critical __interrupt
{
    breakpoint();
}

void joypad_isr(void) __critical __interrupt
{
    breakpoint();
}

#endif

