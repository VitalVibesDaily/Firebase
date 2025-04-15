# Setup script for VitalVibesDaily Next.js project
$ErrorActionPreference = "Stop"

function Write-Step {
    param($Message)
    Write-Host "`n🚀 $Message" -ForegroundColor Cyan
}

function Test-CommandExists {
    param($Command)
    $null = Get-Command $Command -ErrorAction SilentlyContinue
    return $?
}

# Check Node.js and npm
Write-Step "Checking Node.js and npm installation..."
if (-not (Test-CommandExists "node")) {
    throw "Node.js is not installed! Please install Node.js 18 or higher."
}
$nodeVersion = (node -v)
Write-Host "✓ Node.js version: $nodeVersion" -ForegroundColor Green

# Clean installation
Write-Step "Cleaning previous installation..."
$foldersToRemove = @("node_modules", ".next")
$filesToRemove = @("package-lock.json")

foreach ($folder in $foldersToRemove) {
    if (Test-Path $folder) {
        Write-Host "Removing $folder..."
        Remove-Item -Recurse -Force $folder
    }
}

foreach ($file in $filesToRemove) {
    if (Test-Path $file) {
        Write-Host "Removing $file..."
        Remove-Item -Force $file
    }
}

# Clear npm cache
Write-Step "Clearing npm cache..."
npm cache clean --force

# Install dependencies
Write-Step "Installing dependencies..."
npm install --no-audit --no-fund

# Run development server
Write-Step "Starting development server..."
npm run dev 