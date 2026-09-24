@echo off
setlocal enabledelayedexpansion
title SW CAFE Kure Ghor - Git Auto Updater

echo ========================================================
echo       SW CAFE KURE GHOR - GIT REPO AUTO UPDATER
echo ========================================================
echo.

:: Check git status
echo [1/4] Checking repository status...
git status -s
echo.

:: Get commit message from user or use default timestamp
set "commit_msg="
set /p "commit_msg=Enter commit message (Press Enter for auto timestamp): "

if "%commit_msg%"=="" (
    set "commit_msg=Auto update on %date% at %time%"
)

echo.
echo [2/4] Staging all changes...
git add .

echo.
echo [3/4] Creating commit: "%commit_msg%"...
git commit -m "%commit_msg%"

echo.
echo [4/4] Pushing to GitHub (origin main)...
git branch -M main
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo      SUCCESS: GitHub repository updated successfully!
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo      NOTE: If push failed, trying with force/upstream...
    echo ========================================================
    git push -u origin main --force
)

echo.
echo Press any key to exit...
pause >nul
