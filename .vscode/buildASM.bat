echo off

cd .
cd built
mkdir %2
cd %2

break>"dosboxConfig.bat"
echo [autoexec]>>"dosboxConfig.bat"
echo MOUNT C C:\8086>>"dosboxConfig.bat"
echo C:>>"dosboxConfig.bat"
echo cls>>"dosboxConfig.bat"
echo ECHO 8086 ASSEMBLY...>>"dosboxConfig.bat"

echo masm.exe %3 built\%2\%2 built\%2\%2 built\%2\%2;>>"dosboxConfig.bat"
echo link.exe built\%2\%2.obj built\%2\%2;>>"dosboxConfig.bat"
echo %2.exe>>"dosboxConfig.bat"
echo pause>>"dosboxConfig.bat"
echo exit>>"dosboxConfig.bat"


%1 -conf dosboxConfig.bat