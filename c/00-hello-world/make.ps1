#sdcc -mgbz80 --no-std-crt0 --nostdlib --Werror --debug -S --asm=rgbds main.c
#sdcc -mgbz80 --nostdlib --Werror --asm=rgbds -S main.c
#sdcc -mgbz80 --nostdlib --Werror main.c
sdcc --debug -mgbz80 --Werror main.c
makebin -Z main.ihx hello.gb
bgb64 .\hello.gb

