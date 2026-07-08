#!/usr/bin/env pwsh
# Spring Boot Application Runner Script

# Check if Java is available
try {
    $javaVersion = java -version 2>&1
    Write-Host "✓ Java found: $javaVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Error: Java not found. Please install JDK." -ForegroundColor Red
    exit 1
}

# Set variables
$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$classesDir = Join-Path $projectDir "target\classes"
$libDir = Join-Path $projectDir "lib"

Write-Host ""
Write-Host "Spring Boot Application Starter" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Project Directory: $projectDir"
Write-Host "Classes Directory: $classesDir"
Write-Host ""

# Check if classes are compiled
if (-Not (Test-Path $classesDir)) {
    Write-Host "⚠ Warning: Classes not found. Please build the project first." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To build, you need Maven installed. You can:"
    Write-Host "1. Download and install Maven from https://maven.apache.org"
    Write-Host "2. Or use: mvn clean install"
    Write-Host ""
    exit 1
}

# Display application info
Write-Host "API Endpoints:"
Write-Host "  - GET  http://localhost:8080/              (Home page)"
Write-Host "  - GET  http://localhost:8080/api/health    (Health check)"
Write-Host "  - GET  http://localhost:8080/api/users     (List users)"
Write-Host ""
Write-Host "Starting application... Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

# Try to run using Java
$mainClass = "com.example.demo.DemoApplication"
Set-Location $projectDir

# Create a simple runner
& java -cp $classesDir $mainClass 2>&1
