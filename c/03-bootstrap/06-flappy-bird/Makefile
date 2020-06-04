BGB := C:\tools\bgb\bgb64.exe

all:
	powershell ./make.ps1

run:
	cmd /c start $(BGB)	.\build\hello.gb

watch:
	cmd /c start $(BGB)	-watch .\build\hello.gb

test:
	tcc -run .\src\test.c

