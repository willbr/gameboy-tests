$cflags="--verbose -mgbz80 --Werror --std-sdcc99".Split()
$asmflags="-plosgffwy".Split()

../..\..\2bpp-to-c\png-to-c.ps1 -in_file .\assets\char_map.png

sdcc $cflags -S --asm=rgbds -o build\main.rgbds.asm src\main.c
dir .\build\*.rgbds.asm | ForEach-Object {
    Get-Content $_.FullName `
    | Select -Skip 8 `
    | Select-String -Pattern "GLOBAL", "\d+\$\d+" -NotMatch `
    | Select-String -Pattern "^\s*;\s*(-)" -NotMatch `
    | Select-String -Pattern "^\s*(section|global|ds|db)" -NotMatch `
    | Select-String -Pattern "^\s*\.(module|globl|optsdcc|area|db|ds)" -NotMatch `
    | Set-Content ($_.FullName + ".tidy.asm")
}

sdcc $cflags --compile-only -o build\main.rel src\main.c
sdasgb $asmflags build\isr_table.rel .\src\isr_table.s
sdcc $cflags -o build\hello.ihx build\main.rel build\isr_table.rel
makebin -Z build\hello.ihx build\hello.gb

$maptosym = Resolve-Path ~/src/maptosym/maptosym.py
python $maptosym build\hello.map

#bgb build\hello.gb

