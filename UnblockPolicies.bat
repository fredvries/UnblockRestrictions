@echo off
title UnblockRestrictions - Delete All at Once

echo.
echo =============================================================================
echo WARNING: This script will DELETE registry keys related to Group Policies,
echo Windows Update restrictions, and other managed settings.
echo.
echo It MUST be run as Administrator.
echo.
echo RECOMMENDED: Back up your registry first (regedit > File > Export).
echo These deletions are usually safe on personal PCs but may remove intentional
echo restrictions.
echo =============================================================================
echo.

choice /C YN /M "Delete ALL listed keys right now? (Y = Yes, N = No and exit)"
if %errorlevel%==2 (
    echo.
    echo Operation cancelled.
    echo.
    pause
    exit
)

echo.
echo Deleting all keys...
echo.

echo Deleting user-level policy keys...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\WindowsSelfHost" /f >nul 2>&1
reg delete "HKCU\Software\Policies" /f >nul 2>&1

echo Deleting system-level policy keys...
reg delete "HKLM\Software\Microsoft\Policies" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\WindowsSelfHost" /f >nul 2>&1
reg delete "HKLM\Software\Policies" /f >nul 2>&1
reg delete "HKLM\Software\WOW6432Node\Microsoft\Policies" /f >nul 2>&1
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies" /f >nul 2>&1
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f >nul 2>&1

echo.
echo All deletion commands have been executed.
echo (Keys that didn't exist were silently skipped.)
echo.
echo It is strongly recommended to restart your computer now
echo for the changes to take full effect.
echo.
echo Press any key to close this window...
pause >nul
exit