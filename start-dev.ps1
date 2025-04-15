# Start Next.js development server
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PWD'; npm run dev"

# Start XAMPP services
Start-Process "C:\xampp\xampp-control.exe"

Write-Host "Development environment starting..."
Write-Host "Next.js server will be available at: http://127.0.0.1:3001"
Write-Host "XAMPP services can be started from the control panel"
Write-Host "Press Ctrl+C to stop all services" 