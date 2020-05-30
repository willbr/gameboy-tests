$cflags="--verbose -mgbz80 --Werror --std-sdcc99".Split()
$asmflags="-plosgffwy".Split()

echo "sdcc $cflags -S --asm=rgbds -o build\main.rgbds.asm src\main.c"
sdcc $cflags -S --asm=rgbds -o build\main.rgbds.asm src\main.c
dir .\build\*.rgbds.asm | ForEach-Object {
    Get-Content $_.FullName | select-string -Pattern "GLOBAL", "\d+\$\d+" -NotMatch | Set-Content ($_.FullName + ".tidy.asm")
}

sdcc $cflags --compile-only -o build\main.rel src\main.c
sdasgb $asmflags build\isr_table.rel .\src\isr_table.s
sdcc $cflags -o build\hello.ihx build\main.rel build\isr_table.rel
makebin -Z build\hello.ihx build\hello.gb

$maptosym = Resolve-Path ~/src/maptosym/maptosym.py
python $maptosym build\hello.map

#bgb build\hello.gb

