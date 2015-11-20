@echo off
pushd %~dp0
set PATH=%CD%\bin;%CD%\tools\bin;%PATH%
%comspec% /k ""%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat"" x86
popd