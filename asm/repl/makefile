all: hello.asm
	rgbasm -Wall -o hello.o hello.asm
	rgblink -d -o hello.gb -n hello.sym hello.o
	rgbfix -v -p 0xFF --title "hello, world" hello.gb

run:
	bgb64 hello.gb

