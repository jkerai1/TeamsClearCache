# Clear the classic Microsoft Teams cache
$proc = Get-Process 'Teams' -ErrorAction SilentlyContinue
$proc | Stop-Process
Start-Sleep -Seconds 3
$cacheFolderPath = "$($env:APPDATA)\Microsoft\Teams"
$cacheItems = Get-ChildItem $cacheFolderPath -Exclude 'Backgrounds'
$cacheItems | Remove-Item -Recurse -Force
$startProcessArgs = @{
    FilePath     = "$($env:LOCALAPPDATA)\Microsoft\Teams\Update.exe"
    ArgumentList = '--processStart "Teams.exe"'
}
Start-Process  @startProcessArgs
