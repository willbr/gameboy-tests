param (
 [Parameter(Mandatory=$true)][System.IO.FileInfo]$in_file,
 [System.IO.FileInfo]$out_file
)


function Get-Parent-Folder {
    param (
    [Parameter(Mandatory=$true)][System.IO.FileInfo]$in_file
    )
    return (Get-Item $in_file).Directory.FullName
}


$script_dir = Get-Parent-Folder($MyInvocation.MyCommand.Path)


$basename = (Get-Item $in_file).BaseName

if (-not $out_file) {
    $in_file_dir = Get-Parent-Folder($in_file)
    $out_file = Join-Path $in_file_dir "$($basename).2bpp"
} else {
    echo outfile $outfile
}

rgbgfx -o $out_file $in_file

$cmd = Join-Path $script_dir "2bpp-to-c.ps1"
& $cmd $out_file

