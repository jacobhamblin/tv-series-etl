[string]$dir = Join-Path -Path $env:USERPROFILE -ChildPath 'series_to_process'

Write-Host "Looking in $dir for episodes"
$videos_in_folder_count = (Get-ChildItem $dir -Filter *.mp4).Count
Write-Host "Found $videos_in_folder_count episodes to extract subtitles"

[string[]]$listOfFiles = Get-ChildItem -Path $dir -Filter '*.mp4' | Select-Object -ExpandProperty FullName
$listOfFiles | ForEach-Object {
    [string]$name = Split-Path -Path $_ -Leaf
    Write-Host "Extracting subtitles from $name"

    & 'C:\Program Files (x86)\CCExtractor85b\ccextractorwinfull.exe' $_
}