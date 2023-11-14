function Install-Service {
  mkdir C:\Myservice\
  Invoke-WebRequest https://github.com/RedTeamNW/VulnerableService/raw/master/vulnservice.exe -outfile c:\myservice\myservice.exe
  New-Service -Name MyService -BinaryPathName C:\Myservice\myservice.exe -Description MyService -DisplayName MyService -StartupType Automatic
  cmd /c "icacls C:\Myservice\myservice.exe /t /grant Everyone:(OI)(CI)F"
  cmd /c "sc sdset MyService D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)"
  start-service MyService
}
