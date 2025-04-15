Write-Host "Cleaning up old files..."
if (Test-Path node_modules) { Remove-Item -Recurse -Force node_modules }
if (Test-Path .next) { Remove-Item -Recurse -Force .next }
if (Test-Path package-lock.json) { Remove-Item -Force package-lock.json }

Write-Host "Installing dependencies..."
npm install --no-audit --no-fund

Write-Host "Starting development server..."
npm run dev 