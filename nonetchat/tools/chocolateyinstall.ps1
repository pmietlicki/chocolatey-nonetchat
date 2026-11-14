$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://github.com/pmietlicki/nonetchat-windows/releases/download/v0.3.0/NoNetChat-0.3.0-e43ec794973e-f3aa5db9d5de-windows-x64.zip'
  checksum64     = 'f3aa5db9d5de7a23513712278f86bb29f3d71b3d0418915263a5659dcbbae75e'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$exe = Join-Path $toolsDir 'NoNetChat\nonetchat.exe'
# GUI shim: launching "nonetchat" does not keep a console window open.
New-Item -ItemType File -Path "$exe.gui" -Force | Out-Null

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'NoNetChat.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $exe -WorkingDirectory (Split-Path $exe)
