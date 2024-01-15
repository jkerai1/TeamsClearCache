# Clear the new Microsoft Teams cache
$proc = Get-Process 'ms-teams' -ErrorAction SilentlyContinue
$proc | Stop-Process
Start-Sleep -Seconds 3
$cacheFolderPath = "$($env:LOCALAPPDATA)\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams"
$cacheItems = Get-ChildItem $cacheFolderPath -Exclude 'Backgrounds'
$cacheItems | Remove-Item -Recurse -Force
$teamsAppId = 'MSTeams_8wekyb3d8bbwe!MSTeams'
$startProcessArgs = @{
    FilePath     = 'explorer.exe'
    ArgumentList = "shell:AppsFolder\$teamsAppId"
}
Start-Process  @startProcessArgs
