param (
 [Parameter(Mandatory=$true)][System.IO.FileInfo]$in_file,
 [System.IO.FileInfo]$out_file
)


function Get-Parent-Folder {
    param (
    [Parameter(Mandatory=$true)][System.IO.FileInfo]$child_file
    )
    return (Get-Item $child_file).Directory.FullName
}


$basename = (Get-Item $in_file).BaseName


if (-not $out_file) {
    $in_file_dir = Get-Parent-Folder($in_file)
    $out_file = Join-Path $in_file_dir "$($basename).h"
}


$array_name = $basename -replace "-", "_"

$guard_name = "$($basename.ToUpper())_H"

& {
    echo "#ifndef $guard_name"
    echo "#define $guard_name"
    echo ""
    echo "const unsigned char $basename[] = {"

    $bytes = ((Get-Content $in_file | Format-Hex).Bytes | % { "0x{0:X2}" -f $_ })

    $lines = New-Object System.Collections.Generic.List[System.Object]

    $group_size = 16
    $i = 0
    for ($i = 0; $i -lt $bytes.length; $i += $group_size) {
        $slice = $bytes[$i..($i + $group_size - 1)]
        $lines.Add($slice -Join ", ")
    }

    $lines -Join ",`n"

    echo "};"
    echo ""
    echo "#endif"
    echo ""
} | Set-Content -Path $out_file

