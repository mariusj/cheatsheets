# tail file
Get-Content filenamehere -Wait -Tail 30


# compact VHD file
Optimize-VHD -Path  disk.vhdx  -Mode Full


# ajdust permissions and delete files

takeown.exe /F "C:\ProgramData\Docker" /R /A /D Y
icacls "C:\ProgramData\Docker" /T /C /grant Administrators:F
rmdir /s /q "C:\ProgramData\Docker"

