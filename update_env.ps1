# PowerShell script to update .env file with local database settings

Write-Host "Updating .env file with local database configuration..." -ForegroundColor Green

# Read the current .env file
$envContent = Get-Content .env -Raw

# Replace the database configuration
$envContent = $envContent -replace 'DB_HOST=db4free\.net', 'DB_HOST=127.0.0.1'
$envContent = $envContent -replace 'DB_DATABASE=jobportal123', 'DB_DATABASE=job_portal'
$envContent = $envContent -replace 'DB_USERNAME=mohsin123', 'DB_USERNAME=root'
$envContent = $envContent -replace 'DB_PASSWORD=8p#hayjyXYfpA-b', 'DB_PASSWORD='
$envContent = $envContent -replace 'APP_URL=https://web-production-4d3c9\.up\.railway\.app', 'APP_URL=http://localhost:8000'
$envContent = $envContent -replace 'APP_ENV=production', 'APP_ENV=local'

# Write the updated content back to .env
$envContent | Set-Content .env -NoNewline

Write-Host "✅ .env file updated successfully!" -ForegroundColor Green
Write-Host "Database configuration changed to local settings." -ForegroundColor Yellow 