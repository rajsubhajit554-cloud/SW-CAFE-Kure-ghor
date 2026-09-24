# SW CAFE Kure Ghor - Git Auto Updater (PowerShell)
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "      SW CAFE KURE GHOR - GIT REPO AUTO UPDATER" -ForegroundColor Yellow
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/4] Checking repository status..." -ForegroundColor Green
git status -s

$msg = Read-Host "`nEnter commit message (Press Enter for auto timestamp)"
if ([string]::IsNullOrWhiteSpace($msg)) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $msg = "Update website: $timestamp"
}

Write-Host "`n[2/4] Staging all files..." -ForegroundColor Green
git add .

Write-Host "`n[3/4] Committing changes..." -ForegroundColor Green
git commit -m "$msg"

Write-Host "`n[4/4] Pushing to GitHub (origin main)..." -ForegroundColor Green
git branch -M main
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n========================================================" -ForegroundColor Green
    Write-Host " SUCCESS: GitHub repository updated successfully!" -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
} else {
    Write-Host "`n[!] Push had an issue, checking remote branch..." -ForegroundColor Red
}

Read-Host "`nPress Enter to exit..."
