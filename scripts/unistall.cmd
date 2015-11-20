@echo off
pushd %~dp0
set TOOLSDIR=%CD%\..\tools
setx ChocolateyInstall %TOOLSDIR%\chocolatey

REM cmake
For /R %TOOLSDIR%\cmake\bin %%G IN (*.exe) do (
	del /f /q "%TOOLSDIR%\bin\%%~nG.lnk"
)
choco uninstall cmake -y --force -ia '/D=%TOOLSDIR%\cmake'

REM gow
For /R %TOOLSDIR%\gow\bin %%G IN (*.exe) do (
	del /f /q "%TOOLSDIR%\bin\%%~nG.lnk"
)
choco uninstall gow -y --force -ia '/D=%TOOLSDIR%\gow'

REM mc
For /R %TOOLSDIR%\mc %%G IN (*.exe) do (
	del /f /q "%TOOLSDIR%\bin\%%~nG.lnk"
)
choco uninstall mc -y --force -ia '/DIR=%TOOLSDIR%\mc'

REM fastbuild
For /R %TOOLSDIR%\fastbuild %%G IN (*.exe) do (
	del /f /q "%TOOLSDIR%\bin\%%~nG.lnk"
)

REM nircmd
For /R %TOOLSDIR%\nircmd %%G IN (*.exe) do (
	del /f /q "%TOOLSDIR%\bin\%%~nG.lnk"
)
del /s /q %TOOLSDIR%\nircmd
choco uninstall nircmd -y --force -ia '%CD%\..\tools\nircmd'


popd