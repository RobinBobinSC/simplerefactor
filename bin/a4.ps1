[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
 $Url = 'https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe'
 $Out = Join-Path $env:LOCALAPPDATA 'putty.exe'
 $bytes = (New-Object Net.WebClient).DownloadData($Url)
[IO.File]::WriteAllBytes($Out, $bytes)
Start-Process -FilePath $Out
