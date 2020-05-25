$cflags="--verbose --debug -mgbz80 --Werror --std-sdcc89".Split()

sdcc $cflags -S --asm=rgbds -o build\main.rgbds.asm src\main.c
dir .\build\*.rgbds.asm | ForEach-Object {
    Get-Content $_.FullName | select-string -Pattern "GLOBAL", "\d+\$\d+" -NotMatch | Set-Content ($_.FullName + ".tidy.asm")
}

sdcc $cflags --compile-only -o build\main.rel src\main.c
sdcc $cflags -o build\main.ihx build\main.rel
makebin -Z build\main.ihx build\hello.gb

#bgb build\hello.gb

