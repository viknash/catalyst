@echo off
pushd %~dp0
set TOOLSDIR=%CD%\..\tools
setx ChocolateyInstall %TOOLSDIR%\chocolatey

REM nircmd
choco install nircmd -y --force -ia '%CD%\..\tools\nircmd'
mkdir %TOOLSDIR%\nircmd
copy /Y %TOOLSDIR%\chocolatey\lib\nircmd\tools\nircmd* %TOOLSDIR%\nircmd

REM cmake
choco install cmake -y --force -ia '/D=%TOOLSDIR%\cmake'
For /R %TOOLSDIR%\cmake\bin %%G IN (*.exe) do (
	%TOOLSDIR%\nircmd\nircmdc shortcut "%%G" "%TOOLSDIR%\bin" "%%~nG"
)

REM gow
choco install gow -y --force -ia '/D=%TOOLSDIR%\gow'
For /R %TOOLSDIR%\gow\bin %%G IN (*.exe) do (
	%TOOLSDIR%\nircmd\nircmdc shortcut "%%G" "%TOOLSDIR%\bin" "%%~nG"
)

REM mc
choco install mc -y --force -ia '/DIR=%TOOLSDIR%\mc'
For /R %TOOLSDIR%\mc %%G IN (*.exe) do (
	%TOOLSDIR%\nircmd\nircmdc shortcut "%%G" "%TOOLSDIR%\bin" "%%~nG"
)

REM fastbuild
For /R %TOOLSDIR%\fastbuild %%G IN (*.exe) do (
	%TOOLSDIR%\nircmd\nircmdc shortcut "%%G" "%TOOLSDIR%\bin" "%%~nG"
)

popd