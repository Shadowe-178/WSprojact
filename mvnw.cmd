@REM Maven Wrapper for Windows
@REM
@REM To use Maven in this project, run the following command from the project root:
@REM   mvnw.cmd clean install
@REM   mvnw.cmd spring-boot:run
@REM

@echo off
setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.

set WRAPPERDIR=%DIRNAME%.mvn\wrapper

REM Download Maven if not exists
if not exist "%WRAPPERDIR%\maven-wrapper.jar" (
    echo Downloading maven-wrapper.jar...
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar', '%WRAPPERDIR%\maven-wrapper.jar')"
)

REM Read properties
for /f "tokens=*" %%i in (%WRAPPERDIR%\maven-wrapper.properties) do set "MAVEN_WRAPPER_UPDATE=%%i"

REM Try to find Java
set JAVA_EXE=java.exe
%JAVA_EXE% -version >nul 2>&1
if "%ERRORLEVEL%" neq "0" (
    echo Error: Java not found. Please install JDK and add it to PATH.
    exit /b 1
)

REM Run Maven
java -cp "%WRAPPERDIR%\maven-wrapper.jar" org.apache.maven.wrapper.MavenWrapperMain %*
ENDLOCAL
