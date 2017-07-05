set BUILD_PATH=bin\%BuildConfiguration%
set TO_SIGN_TARGET=ToSign
set IS_SIGNED_PATH=Signed
set TO_PACK_TARGET=ToPack
set LIBRARY_NAME=Microsoft.IdentityModel.Clients.ActiveDirectory


set PLATFORM_SPECIFIC_LIBRARY_NAME=%LIBRARY_NAME%.Platform

@echo ==========================
@echo Copying files to staging folder for signing
xcopy /y src\ADAL.PCL\%BUILD_PATH%\netstandard1.1\%LIBRARY_NAME%.* %TO_SIGN_TARGET%\
xcopy /y src\ADAL.PCL.Android\%BUILD_PATH%\%PLATFORM_SPECIFIC_LIBRARY_NAME%.* %TO_SIGN_TARGET%\Android\
xcopy /y src\ADAL.PCL.Desktop\%BUILD_PATH%\%PLATFORM_SPECIFIC_LIBRARY_NAME%.* %TO_SIGN_TARGET%\Desktop\
xcopy /y src\ADAL.PCL.CoreCLR\%BUILD_PATH%\netstandard1.3\%PLATFORM_SPECIFIC_LIBRARY_NAME%.* %TO_SIGN_TARGET%\CoreCLR\
xcopy /y src\ADAL.PCL.iOS\bin\iPhone\%BuildConfiguration%\%PLATFORM_SPECIFIC_LIBRARY_NAME%.* %TO_SIGN_TARGET%\iOS\
xcopy /y src\ADAL.PCL.WinRT\%BUILD_PATH%\%PLATFORM_SPECIFIC_LIBRARY_NAME%.* %TO_SIGN_TARGET%\WinRT\

@echo ==========================
@echo Cleaning signed files destination

REM Clean the TO_SIGN_TARGET folder
md %IS_SIGNED_PATH%
del /q %IS_SIGNED_PATH%\*.*