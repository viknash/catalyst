@echo off
pushd %~dp0
title Catalyst

REM Detect 32/64 bit windows
if exist "%SYSTEMDRIVE%\Program Files (x86)\" (
set SYS_ARCH=64
) else (
set SYS_ARCH=32
)

set CATALYST_ROOT=%CD%
set PATH=%CD%\bin;%CD%\tools\bin;%PATH%
set PATH=%CD%\tools\bin;%PATH%
set PATH=%CD%\tools\cmake\bin;%PATH%
set PATH=%CD%\tools\nvm;%PATH%
set PATH=%CD%\tools\fastbuild;%PATH%
set PATH=%CD%\scripts;%PATH%
set NVM_PATH=%CD%\tools\nvm
set NVM_HOME=%NVM_PATH%
set NVM_SYMLINK=%SYSTEMDRIVE%\Program Files\nodejs
set PATH=%NVM_SYMLINK%;%PATH%
set INCLUDE=%CD%\extern\boost\libs\utility\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\algorithm\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\unordered\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\intrusive\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\detail\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\smart_ptr\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\integer\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\lexical_cast\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\thread\include;%INCLUDE%
set INCLUDE=%CD%\extern\boost\libs\date_time\include;%INCLUDE%
set BOOST_PATH=%CD%\extern\boost

REM Setup nvm
(echo root: %NVM_HOME% && echo path: %NVM_SYMLINK% && echo arch: %SYS_ARCH% && echo proxy: none) > %NVM_HOME%\settings.txt

REM Setup Visual Studio Environment
doskey devenv=devenv.exe /useenv $*
IF "%VS140COMNTOOLS%"=="" (
	ECHO Visual Studio 2012
	%comspec% /k "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
) ELSE (
	ECHO Visual Studio 2015
	%comspec% /k "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
)
popd