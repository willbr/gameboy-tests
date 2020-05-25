#sdcc -mgbz80 --no-std-crt0 --nostdlib --Werror --debug -S --asm=rgbds main.c
#sdcc -mgbz80 --nostdlib --Werror --asm=rgbds -S main.c
#sdcc -mgbz80 --nostdlib --Werror main.c
#sdcc --debug -mgbz80 --Werror main.c
sdcc --debug -mgbz80 main.c
makebin -Z main.ihx 10-pretty.gb
bgb64 .\10-pretty.gb

