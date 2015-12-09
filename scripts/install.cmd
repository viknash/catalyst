@echo off
pushd %~dp0
set TOOLSDIR=%CD%\..\tools
IF "%ChocolateyInstall%"=="%TOOLSDIR%\chocolatey" goto install
setx ChocolateyInstall %TOOLSDIR%\chocolatey
echo Restart Catalyst
pause
exit

:install
REM nircmd
choco install nircmd -y --force -ia '%CD%\..\tools\nircmd'
mkdir %TOOLSDIR%\nircmd
copy /Y %TOOLSDIR%\chocolatey\lib\nircmd\tools\nircmd* %TOOLSDIR%\nircmd
For /R %TOOLSDIR%\nircmd %%G IN (*.exe) do (
	%TOOLSDIR%\nircmd\nircmdc shortcut "%%G" "%TOOLSDIR%\bin" "%%~nG"
)

REM cmake
choco install cmake -y --force -ia '/D=%TOOLSDIR%\cmake'
For /R %TOOLSDIR%\cmake\bin %%G IN (*.exe) do (
	%TOOLSDIR%\nircmd\nircmdc shortcut "%%G" "%TOOLSDIR%\bin" "%%~nG"
)

REM gow
choco install gow -y --force -ia '/S /D=%TOOLSDIR%\gow'
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

REM Install Node/NVM
nvm install 5.1.0
nvm use 5.1.0

REM Update Node Packages
npm update
pushd ..
npm install
npm install -g gulp
popd

REM Submodules
pushd ..
git submodule init
git submodule update
popd

REM Clang
mkdir ..\tmp
pushd ..\tmp
wget http://llvm.org/releases/3.7.0/LLVM-3.7.0-win64.exe
LLVM-3.7.0-win64.exe /S /DIR=%TOOLSDIR%\clang
del /q LLVM-3.7.0-win64.exe
popd

:exit
popd