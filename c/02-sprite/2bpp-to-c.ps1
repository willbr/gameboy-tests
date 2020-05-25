 param (
 [string]$sprite
)

$basename = (Get-Item $sprite).BaseName

echo ("unsigned char {0}[] = {{" -f $basename)
 ((Get-Content $sprite | Format-Hex).Bytes | % { "0x{0:X2}" -f $_ }) -Join ", "
echo "};"

