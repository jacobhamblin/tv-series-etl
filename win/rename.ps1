[string]$dir = Join-Path -Path $env:USERPROFILE -ChildPath 'series_to_process'

Write-Host "Looking in $dir for episodes"
$videos_in_folder_count = (Get-ChildItem $dir -Filter *.mp4).Count
Write-Host "Found $videos_in_folder_count episodes to rename"
$series_name = Read-Host "What's the name of the TV Show?"
$season_number = Read-Host "What number is this season?"
$season_number_two_digit = "{0:D2}" -f [int]$season_number


[string[]]$listOfFilesToRename = Get-ChildItem -Path $dir -Filter '*.mp4' | Select-Object -ExpandProperty FullName
$listOfFilesToRename | ForEach-Object {

    [string]$name = Split-Path -Path $_ -Leaf
    $episode_number, $episode_name = $name.split(" ")
    $newname = "$series_name - S" + $season_number_two_digit + "E" + $episode_number + " - " + $episode_name
    Write-Verbose "Renaming '$_' to '$newname'" -Verbose #added the verbose switch here so you'll see the output without worrying about the verbose preference
    Rename-Item -Path $_ -NewName $newname 
}