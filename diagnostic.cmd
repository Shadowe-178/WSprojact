@echo off
REM Spring Boot Application - Environment Diagnostic
REM Check if all requirements are met

setlocal enabledelayedexpansion

echo.
echo ============================================================
echo Spring Boot Application - Environment Check
echo ============================================================
echo.

REM 1. Check Java
echo [1] Checking Java...
java -version >nul 2>&1
if errorlevel 1 (
    echo   [FAILED] Java not found or not in PATH
    echo   Download: https://www.oracle.com/java/technologies/downloads/
) else (
    java -version
    echo   [SUCCESS] Java is installed
)

echo.

REM 2. Check Maven
echo [2] Checking Maven...
mvn -version >nul 2>&1
if errorlevel 1 (
    echo   [WARNING] Maven not found or not in PATH
    echo   Download: https://maven.apache.org/download.cgi
    echo   Note: Maven Wrapper can download dependencies automatically
) else (
    echo   [SUCCESS] Maven is installed
    mvn -version
)

echo.

REM 3. Check MySQL
echo [3] Checking MySQL...
mysql -u root -e "SELECT 'OK';" >nul 2>&1
if errorlevel 1 (
    echo   [WARNING] MySQL connection failed
    echo   - Is MySQL service running?
    echo   - Check username and password in application.yml
    echo   - Database 'smartchess' should exist
) else (
    echo   [SUCCESS] MySQL is accessible
)

echo.

REM 4. Check Project Files
echo [4] Checking Project Structure...
if exist "pom.xml" (
    echo   [OK] pom.xml found
) else (
    echo   [ERROR] pom.xml not found
)

if exist "src\main\java\com\example\demo\DemoApplication.java" (
    echo   [OK] DemoApplication.java found
) else (
    echo   [ERROR] DemoApplication.java not found
)

if exist "src\main\resources\application.yml" (
    echo   [OK] application.yml found
) else (
    echo   [ERROR] application.yml not found
)

echo.

REM 5. Check Port 8080
echo [5] Checking Port 8080...
netstat -ano | find ":8080" >nul 2>&1
if errorlevel 1 (
    echo   [OK] Port 8080 is available
) else (
    echo   [WARNING] Port 8080 may be in use
    echo   Use: netstat -ano ^| find ":8080" to find the process
)

echo.
echo ============================================================
echo Recommendations:
echo ============================================================
echo 1. Ensure Java JDK 17+ is installed
echo 2. Install Maven or use Maven Wrapper (.mvn\wrapper)
echo 3. Start MySQL service if not running
echo 4. Run: mvn clean install -DskipTests
echo 5. Then: mvn spring-boot:run
echo 6. Visit: http://localhost:8080/api/health
echo ============================================================
echo.
pause
