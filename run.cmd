@echo off
REM Spring Boot Application Runner for Windows
REM This script compiles and runs the Spring Boot application

setlocal enabledelayedexpansion

echo.
echo Spring Boot Application Builder and Runner
echo ==========================================
echo.

REM Check Java
java -version >nul 2>&1
if errorlevel 1 (
    echo Error: Java not found. Please install JDK and add it to PATH.
    exit /b 1
)

REM Set directories
set PROJECT_DIR=%~dp0
set CLASSES_DIR=%PROJECT_DIR%target\classes
set SRC_DIR=%PROJECT_DIR%src\main\java
set RESOURCES_DIR=%PROJECT_DIR%src\main\resources

echo Java found:
java -version

echo.
echo Project Directory: %PROJECT_DIR%
echo Source Directory: %SRC_DIR%
echo Classes Directory: %CLASSES_DIR%
echo.

REM Create target/classes directory if not exists
if not exist "%CLASSES_DIR%" (
    mkdir "%CLASSES_DIR%"
    echo Created classes directory
)

echo.
echo Build Information:
echo This project requires Maven to build properly.
echo Without Maven, we cannot download dependencies or create a runnable JAR.
echo.
echo Options:
echo 1. Install Maven from https://maven.apache.org
echo 2. Use Spring Boot CLI: spring run DemoApplication.java
echo 3. Use your IDE (IntelliJ IDEA, Eclipse, or VS Code with extensions)
echo.
echo Attempting to run with available resources...
echo.

REM Try to run the main class
cd /d "%PROJECT_DIR%"
java -cp ".mvn\wrapper\maven-wrapper.jar" org.apache.maven.wrapper.MavenWrapperMain spring-boot:run

if errorlevel 1 (
    echo.
    echo Failed to run with Maven Wrapper.
    echo Please ensure Maven is properly installed.
)

pause
