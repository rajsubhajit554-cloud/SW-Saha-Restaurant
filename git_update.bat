@echo off
setlocal enabledelayedexpansion
title SW Saha Restaurant - Git Auto Update

echo ======================================================
echo       SW Saha Restaurant - Git Update Utility
echo ======================================================
echo.

:: Check git status
echo [1/4] Checking repository status...
git status -s
echo.

:: Stage all changes
echo [2/4] Adding all changed files...
git add .
echo.

:: Ask for commit message or use default
set /p commit_msg="Enter commit message (Press Enter for default message): "

if "%commit_msg%"=="" (
    set commit_msg=Update: %date% %time%
)

echo.
echo [3/4] Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo.
    echo No new changes to commit or commit failed.
)

:: Push to remote main
echo.
echo [4/4] Pushing to GitHub (origin main)...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ======================================================
    echo   [SUCCESS] Code successfully pushed to GitHub!
    echo ======================================================
) else (
    echo.
    echo ======================================================
    echo   [ERROR] Push failed. Please check your internet or git credentials.
    echo ======================================================
)

echo.
pause
