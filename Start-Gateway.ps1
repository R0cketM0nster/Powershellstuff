$pc = Read-Host "PC name"$i = $pc.substring(0,6)if (Get-Process -ComputerName $pc -Name gateway -ErrorAction SilentlyContinue){    Stop-Process -Name gateway -Force    Start-Sleep -Seconds 5    Start-Process \\"$i"apps01\INCA_BIN\Gateway.exe }else {Start-Process \\"$i"apps01\INCA_BIN\Gateway.exe}
