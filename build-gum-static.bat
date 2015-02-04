@echo off

git submodule init
git submodule update

call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"
call msbuild frida.sln /p:Configuration=Release;Platform=Win32 /t:gumpp-static:Rebuild /maxcpucount:4
