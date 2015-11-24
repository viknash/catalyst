@echo off
pushd %~dp0
title Catalyst
set CATALYST_ROOT=%CD%
set PATH=%CD%\bin;%CD%\tools\bin;%PATH%
set PATH=%CD%\tools\bin;%PATH%
set INCLUDE=%CD%\extern\intrusive\include;%INCLUDE%
set INCLUDE=%CD%\extern\config\include;%INCLUDE%
set INCLUDE=%CD%\extern\assert\include;%INCLUDE%
set INCLUDE=%CD%\extern\core\include;%INCLUDE%
set INCLUDE=%CD%\extern\container\include;%INCLUDE%
set INCLUDE=%CD%\extern\move\include;%INCLUDE%
set INCLUDE=%CD%\extern\static_assert\include;%INCLUDE%
set INCLUDE=%CD%\extern\thread\include;%INCLUDE%
set INCLUDE=%CD%\extern\date_time\include;%INCLUDE%
set INCLUDE=%CD%\extern\lexical_cast\include;%INCLUDE%
set INCLUDE=%CD%\extern\functional\include;%INCLUDE%
set INCLUDE=%CD%\extern\range\include;%INCLUDE%
set INCLUDE=%CD%\extern\random\include;%INCLUDE%
set INCLUDE=%CD%\extern\iterator\include;%INCLUDE%
set INCLUDE=%CD%\extern\integer\include;%INCLUDE%
set INCLUDE=%CD%\extern\type_traits\include;%INCLUDE%
set INCLUDE=%CD%\extern\mpl\include;%INCLUDE%
set INCLUDE=%CD%\extern\detail\include;%INCLUDE%
set INCLUDE=%CD%\extern\preprocessor\include;%INCLUDE%
set INCLUDE=%CD%\extern\concept_check\include;%INCLUDE%
set INCLUDE=%CD%\extern\utility\include;%INCLUDE%
set INCLUDE=%CD%\extern\throw_exception\include;%INCLUDE%
set INCLUDE=%CD%\extern\numeric_conversion\include;%INCLUDE%
set INCLUDE=%CD%\extern\array\include;%INCLUDE%
set INCLUDE=%CD%\extern\math\include;%INCLUDE%
set INCLUDE=%CD%\extern\predef\include;%INCLUDE%
set INCLUDE=%CD%\extern\smart_ptr\include;%INCLUDE%
set INCLUDE=%CD%\extern\system\include;%INCLUDE%
set INCLUDE=%CD%\extern\chrono\include;%INCLUDE%
set INCLUDE=%CD%\extern\ratio\include;%INCLUDE%
set INCLUDE=%CD%\extern\atomic\include;%INCLUDE%
set INCLUDE=%CD%\extern\bind\include;%INCLUDE%
set INCLUDE=%CD%\extern\io\include;%INCLUDE%
set INCLUDE=%CD%\extern\tuple\include;%INCLUDE%
set INCLUDE=%CD%\extern\exception\include;%INCLUDE%
set INCLUDE=%CD%\extern\optional\include;%INCLUDE%
set INCLUDE=%CD%\extern\function\include;%INCLUDE%
set INCLUDE=%CD%\extern\type_index\include;%INCLUDE%
set INCLUDE=%CD%\extern\align\include;%INCLUDE%
set INCLUDE=%CD%\extern\algorithm\include;%INCLUDE%
set INCLUDE=%CD%\extern\tokenizer\include;%INCLUDE%
set INCLUDE=%CD%\extern\unordered\include;%INCLUDE%
doskey devenv=devenv.exe /useenv $*
IF "%VS140COMNTOOLS%"=="" (
	ECHO Visual Studio 2012
	%comspec% /k "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
) ELSE (
	ECHO Visual Studio 2015
	%comspec% /k "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
)
popd