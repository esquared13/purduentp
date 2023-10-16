Push-Location
Set-Location HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers

# set the primary ntp server
Set-ItemProperty . 0 "tick.cit.lcl"
Set-ItemProperty . "(Default)" "0"

# set the secondary ntp server
Set-ItemProperty . 1 "tock.cit.lcl"

Set-Location HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Parameters
Set-ItemProperty . NtpServer "tick.cit.lcl"
Pop-Location
Stop-Service w32time
Start-Service w32time