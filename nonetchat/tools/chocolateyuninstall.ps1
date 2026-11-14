$ErrorActionPreference = 'Stop'
$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'NoNetChat.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
# The application files are removed by Chocolatey; the user's profile and history are kept.
