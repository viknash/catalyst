@echo off
pushd %~dp0
call build.bat
cp -raf .\bin.ntx86\bjam.exe %CATALYST_ROOT%\tools\boost-jam\.
rm -rf bin.ntx86 bootstrap
popd