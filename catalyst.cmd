@echo off
pushd %~dp0
title Catalyst
set CATALYST_ROOT=%CD%
set PATH=%CD%\bin;%CD%\tools\bin;%PATH%
set PATH=%CD%\tools\bin;%PATH%
set PATH=%CD%\tools\nvm;%PATH%
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
doskey devenv=devenv.exe /useenv $*
IF "%VS140COMNTOOLS%"=="" (
	ECHO Visual Studio 2012
	%comspec% /k "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
) ELSE (
	ECHO Visual Studio 2015
	%comspec% /k "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
)
popd