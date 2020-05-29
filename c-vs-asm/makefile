CC := sdcc
OPTIMISATIONS := --nooverlay --nogcse --nolabelopt --noinvariant --noinduction --noloopreverse --no-peep --no-reg-params
CFLAGS := -mgbz80 --std-sdcc99 --no-std-crt0 $(OPTIMISATIONS)

.PHONY: all force

SRC := $(wildcard ./src/*.c)
ASM := $(SRC:./src/%.c=./build/%.asm)

./build/%.asm : ./src/%.c force
	$(CC) $(CFLAGS) -S --asm=rgbds -o $@ $<

all: $(ASM)

clean:
	del .\build\*.asm

