@echo off
echo Cleaning up...
if exist node_modules rmdir /s /q node_modules
if exist .next rmdir /s /q .next
if exist package-lock.json del package-lock.json

echo Installing dependencies...
set NODE_ENV=development
call npm install --no-audit --no-fund

echo Starting development server...
call npm run dev 