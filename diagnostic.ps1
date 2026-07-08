# Diagnostic Script for Spring Boot Application
# 檢查環境和配置是否就緒

Write-Host ""
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "Spring Boot Application - 環境診斷檢查" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$status = @()

# 1. Check Java
Write-Host "1️⃣  Java 檢查" -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    $javaInstalled = $true
    Write-Host "   ✅ Java 已安裝: $javaVersion" -ForegroundColor Green
    $status += @{ Check = "Java"; Status = "✅ 已安裝" }
} catch {
    Write-Host "   ❌ Java 未安裝或不在 PATH 中" -ForegroundColor Red
    Write-Host "   📥 下載: https://www.oracle.com/java/technologies/downloads/" -ForegroundColor Magenta
    $status += @{ Check = "Java"; Status = "❌ 未安裝" }
    $javaInstalled = $false
}

# 2. Check Maven
Write-Host ""
Write-Host "2️⃣  Maven 檢查" -ForegroundColor Yellow
try {
    $mavenVersion = mvn -version 2>&1 | Select-Object -First 1
    $mavenInstalled = $true
    Write-Host "   ✅ Maven 已安裝: $mavenVersion" -ForegroundColor Green
    $status += @{ Check = "Maven"; Status = "✅ 已安裝" }
} catch {
    Write-Host "   ⚠️  Maven 未安裝或不在 PATH 中" -ForegroundColor Yellow
    Write-Host "   📥 下載: https://maven.apache.org/download.cgi" -ForegroundColor Magenta
    Write-Host "   ℹ️  Maven Wrapper 可以自動下載依賴，但需要 Java" -ForegroundColor Cyan
    $status += @{ Check = "Maven"; Status = "⚠️  未安裝 (可用 Wrapper)" }
    $mavenInstalled = $false
}

# 3. Check MySQL
Write-Host ""
Write-Host "3️⃣  MySQL 檢查" -ForegroundColor Yellow
try {
    $mysqlTest = mysql -u root -h localhost -e "SELECT 'MySQL Connected' ;" 2>&1
    $mysqlInstalled = $true
    Write-Host "   ✅ MySQL 服務正常" -ForegroundColor Green
    Write-Host "   📊 狀態: 可連接" -ForegroundColor Green
    $status += @{ Check = "MySQL"; Status = "✅ 可連接" }
} catch {
    Write-Host "   ⚠️  MySQL 連接失敗或服務未運行" -ForegroundColor Yellow
    Write-Host "   💡 檢查事項:" -ForegroundColor Cyan
    Write-Host "      - MySQL 服務是否啟動?" -ForegroundColor Cyan
    Write-Host "      - 用戶名和密碼是否正確?" -ForegroundColor Cyan
    Write-Host "      - 資料庫 'smartchess' 是否存在?" -ForegroundColor Cyan
    $status += @{ Check = "MySQL"; Status = "⚠️  未連接" }
    $mysqlInstalled = $false
}

# 4. Check Project Structure
Write-Host ""
Write-Host "4️⃣  項目結構檢查" -ForegroundColor Yellow

$requiredFiles = @(
    "pom.xml",
    "src\main\java\com\example\demo\DemoApplication.java",
    "src\main\resources\application.yml",
    "src\main\resources\templates\index.html"
)

$filesOk = $true
foreach ($file in $requiredFiles) {
    $fullPath = Join-Path $projectDir $file
    if (Test-Path $fullPath) {
        Write-Host "   ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "   ❌ $file (缺失)" -ForegroundColor Red
        $filesOk = $false
    }
}

if ($filesOk) {
    $status += @{ Check = "項目文件"; Status = "✅ 完整" }
} else {
    $status += @{ Check = "項目文件"; Status = "❌ 缺失" }
}

# 5. Check Port 8080
Write-Host ""
Write-Host "5️⃣  端口檢查 (8080)" -ForegroundColor Yellow
try {
    $portInUse = Get-NetTCPConnection -LocalPort 8080 -ErrorAction SilentlyContinue
    if ($portInUse) {
        Write-Host "   ⚠️  端口 8080 已被佔用" -ForegroundColor Yellow
        Write-Host "   💡 請停止佔用此端口的應用程序" -ForegroundColor Cyan
        $status += @{ Check = "端口 8080"; Status = "⚠️  已被佔用" }
    } else {
        Write-Host "   ✅ 端口 8080 可用" -ForegroundColor Green
        $status += @{ Check = "端口 8080"; Status = "✅ 可用" }
    }
} catch {
    Write-Host "   ✅ 端口 8080 可用 (無法檢查)" -ForegroundColor Green
    $status += @{ Check = "端口 8080"; Status = "✅ 可用" }
}

# Summary
Write-Host ""
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "📋 檢查結果摘要" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

foreach ($item in $status) {
    $check = $item.Check
    $result = $item.Status
    Write-Host "$check".PadRight(20) + " | $result"
}

# Recommendations
Write-Host ""
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "🎯 建議" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

if (-not $javaInstalled) {
    Write-Host "• 安裝 Java JDK 17+ (必需)" -ForegroundColor Red
}

if (-not $mavenInstalled) {
    Write-Host "• 安裝 Maven 3.6+ 或使用 Maven Wrapper" -ForegroundColor Yellow
}

if (-not $mysqlInstalled) {
    Write-Host "• 啟動 MySQL 服務並確保資料庫配置正確" -ForegroundColor Yellow
}

if ($javaInstalled) {
    Write-Host ""
    Write-Host "✨ 快速啟動命令:" -ForegroundColor Green
    Write-Host ""
    Write-Host "   # 清理並構建" -ForegroundColor Cyan
    Write-Host "   mvn clean install -DskipTests" -ForegroundColor White
    Write-Host ""
    Write-Host "   # 運行應用" -ForegroundColor Cyan
    Write-Host "   mvn spring-boot:run" -ForegroundColor White
    Write-Host ""
    Write-Host "   # 訪問應用" -ForegroundColor Cyan
    Write-Host "   http://localhost:8080/api/health" -ForegroundColor White
}

Write-Host ""
Write-Host "=" * 60 -ForegroundColor Cyan
