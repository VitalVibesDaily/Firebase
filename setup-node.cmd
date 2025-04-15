@echo off
setlocal enabledelayedexpansion

echo [1/6] Checking Node.js installation...
where node >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please make sure Node.js is installed and added to your PATH
    exit /b 1
)
node -v
if errorlevel 1 (
    echo ERROR: Node.js version check failed
    exit /b 1
)

echo [2/6] Cleaning up previous installation...
if exist node_modules (
    echo Removing node_modules...
    rmdir /s /q node_modules
)
if exist .next (
    echo Removing .next...
    rmdir /s /q .next
)
if exist package-lock.json (
    echo Removing package-lock.json...
    del package-lock.json
)

echo [3/6] Setting up npm configuration...
call npm config set registry https://registry.npmjs.org/
call npm cache clean --force

echo [4/6] Installing dependencies...
set NODE_ENV=development
call npm install --legacy-peer-deps --verbose
if errorlevel 1 (
    echo ERROR: npm install failed
    echo Please check the error messages above
    exit /b 1
)

echo [5/6] Verifying installation...
if not exist node_modules (
    echo ERROR: node_modules directory was not created
    echo This indicates a problem with the npm installation
    exit /b 1
)

echo [6/6] Starting development server...
call npm run dev 