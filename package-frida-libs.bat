@echo off

SET PACKAGE_DIR=package-frida-libs

IF EXIST %PACKAGE_DIR% (RD /S /Q %PACKAGE_DIR%)
MD %PACKAGE_DIR%

MD %PACKAGE_DIR%\lib
MD %PACKAGE_DIR%\lib\win32
MD %PACKAGE_DIR%\lib\win32\release
MD %PACKAGE_DIR%\lib\win32\debug


@echo "Copy all include files to target folder"

MD %PACKAGE_DIR%\include   
MD %PACKAGE_DIR%\include\gum   
MD %PACKAGE_DIR%\include\capstone
MD %PACKAGE_DIR%\include\capstone\include

XCOPY /Y /S /Q build\sdk-windows\Win32-Release\include\*                %PACKAGE_DIR%\include\
XCOPY /Y /S /Q capstone\include\* 					%PACKAGE_DIR%\include\capstone\include\  
XCOPY /Y /S /Q /I build\sdk-windows\Win32-Release\lib\glib-2.0\include\glibconfig.h %PACKAGE_DIR%\include\glib-2.0\

SET SRC_FOLDER="frida-gum\gum\"
SET DST_FOLDER="%PACKAGE_DIR%\include\gum\"

FOR /f "tokens=*" %%i in (package-frida-gum-includes.txt) DO (
    XCOPY /Y /S /F "%SRC_FOLDER%\%%i" "%DST_FOLDER%"
)

MD %PACKAGE_DIR%\include\libffi-3.1-rc1
MD %PACKAGE_DIR%\include\libffi-3.1-rc1\include

XCOPY /Y /S /Q  build\sdk-windows\Win32-Release\lib\libffi-3.1-rc1\include\*  %PACKAGE_DIR%\include\libffi-3.1-rc1\include\
XCOPY /Y /S /Q  frida-gum\bindings\gumpp\gumpp.hpp %PACKAGE_DIR%\include\



@echo "Copy all release lib files to target folder"

set RELEASE_LIB_DIR=%PACKAGE_DIR%\lib\win32\release
echo %RELEASE_LIB_DIR%

COPY /Y build\frida-windows\Win32-Release\bin\gumpp-static.lib 		%RELEASE_LIB_DIR%
COPY /Y build\frida-windows\Win32-Release\bin\gumpp-static.pdb 		%RELEASE_LIB_DIR%
COPY /Y build\tmp-windows\Win32-Release\gum-32\gum-32.pdb 		%RELEASE_LIB_DIR%
COPY /Y build\tmp-windows\Win32-Release\capstone-32\capstone-32.pdb 	%RELEASE_LIB_DIR%
COPY /Y build\sdk-windows\Win32-Release\lib\*.lib			%RELEASE_LIB_DIR%	 
COPY /Y build\sdk-windows\Win32-Release\lib\*.pdb			%RELEASE_LIB_DIR%
DEL  /F /Q %RELEASE_LIB_DIR%\v8*

@echo "Copy all debug lib files to target folder"


set RELEASE_LIB_DIR=%PACKAGE_DIR%\lib\win32\debug
echo %RELEASE_LIB_DIR%

COPY /Y build\frida-windows\Win32-Debug\bin\gumpp-static.lib 		%RELEASE_LIB_DIR%
COPY /Y build\frida-windows\Win32-Debug\bin\gumpp-static.pdb 		%RELEASE_LIB_DIR%
COPY /Y build\tmp-windows\Win32-Debug\gum-32\gum-32.pdb 		%RELEASE_LIB_DIR%
COPY /Y build\tmp-windows\Win32-Debug\capstone-32\capstone-32.pdb 	%RELEASE_LIB_DIR%
COPY /Y build\sdk-windows\Win32-Debug\lib\*.lib			%RELEASE_LIB_DIR%	 
COPY /Y build\sdk-windows\Win32-Debug\lib\*.pdb			%RELEASE_LIB_DIR%
DEL  /F /Q %RELEASE_LIB_DIR%\v8*
