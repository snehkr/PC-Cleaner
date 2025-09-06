@echo off
:: =================================================================
:: PC Cleaner & Optimizer - Ultimate Edition
:: Original Author: SNEH KR
:: Updated with safety checks and new features.
:: =================================================================

:: Check for Administrator Rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [!] ERROR: Administrative privileges are required.
    echo     Please right-click the script and select "Run as administrator".
    pause
    exit /b
)

title PC Cleaner ^& Optimizer - Ultimate Edition
color 0E
echo ==================================================
echo     WELCOME TO PC CLEANER ^& OPTIMIZER
echo           Made by: SNEH KR
echo ==================================================
echo.
pause

:: Main Menu
:MENU
cls
echo ==================================================
echo           PC CLEANER ^& OPTIMIZER
echo                BY: SNEH KR
echo ==================================================
echo.
echo  --- CLEANING ---
echo  1.  Clean Temporary Files
echo  2.  Clean Logs ^& Junk Files (Safe Version)
echo  3.  Clean Browser Caches
echo  4.  Clean Windows Update Cache
echo  5.  Empty Recycle Bin
echo  13. Run Windows Disk Cleanup (Recommended)
echo.
echo  --- OPTIMIZATION ^& REPAIR ---
echo  6.  Flush DNS ^& Reset Network
echo  7.  Optimize RAM (Info Only)
echo  8.  Run Disk Check (chkdsk)
echo  9.  Defragment HDD / Optimize SSD (TRIM)
echo  14. Repair System Files (SFC ^& DISM)
echo  15. Set Power Plan to High Performance
echo.
echo  --- SYSTEM INFO ^& ADVANCED ---
echo  10. Show Startup Programs
echo  11. Show System Health Info
echo  16. Clear All Windows Event Logs (Advanced)
echo.
echo  --- ALL-IN-ONE ---
echo  12. Run Full Cleanup + Optimization
echo.
echo  99. Exit
echo ==================================================
set /p choice=Enter your choice (1-16): 

if "%choice%"=="1" goto TEMP
if "%choice%"=="2" goto LOGS
if "%choice%"=="3" goto BROWSER
if "%choice%"=="4" goto UPDATECACHE
if "%choice%"=="5" goto RECYCLE
if "%choice%"=="6" goto FLUSHDNS
if "%choice%"=="7" goto RAM
if "%choice%"=="8" goto CHKDSK
if "%choice%"=="9" goto DEFRAG
if "%choice%"=="10" goto STARTUP
if "%choice%"=="11" goto HEALTH
if "%choice%"=="12" goto FULL
if "%choice%"=="13" goto DISKCLEANUP
if "%choice%"=="14" goto REPAIR
if "%choice%"=="15" goto POWER
if "%choice%"=="16" goto EVENTLOGS
if "%choice%"=="99" exit
goto MENU

:TEMP
echo Cleaning temporary files...
del /s /f /q %SYSTEMDRIVE%\Windows\Temp\*.* >nul 2>&1
del /s /f /q %TEMP%\*.* >nul 2>&1
echo Done cleaning temp files.
pause
goto MENU

:LOGS
echo Cleaning log and junk files from safe locations...
del /s /f /q "%WINDIR%\Logs\*" >nul 2>&1
del /s /f /q "%WINDIR%\panther\*.log" >nul 2>&1
del /s /f /q "%WINDIR%\debug\*.log" >nul 2>&1
:: Clearing it can temporarily slow down app loading times.
:: del /s /f /q "%WINDIR%\Prefetch\*.*" >nul 2>&1
echo Done cleaning logs and junk.
pause
goto MENU

:BROWSER
echo Cleaning browser caches...
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /q /f /s "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*" >nul 2>&1
echo Done cleaning browser cache.
pause
goto MENU

:UPDATECACHE
echo Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q %WINDIR%\SoftwareDistribution\Download >nul 2>&1
md %WINDIR%\SoftwareDistribution\Download >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo Done cleaning update cache.
pause
goto MENU

:RECYCLE
echo Emptying Recycle Bin...
rd /s /q %SYSTEMDRIVE%\$Recycle.Bin >nul 2>&1
echo Recycle Bin emptied.
pause
goto MENU

:FLUSHDNS
echo Flushing DNS and resetting network cache...
ipconfig /flushdns
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset
echo DNS ^& Network cache cleared. A restart is recommended for full effect.
pause
goto MENU

:RAM
echo Clearing Standby Memory (RAM)...
echo.
echo Windows batch scripts cannot safely or effectively clear system RAM.
echo This function is for informational purposes. For a deep clean of standby
echo memory, consider using a trusted tool like "EmptyStandbyList.exe"
echo from the SysInternals suite.
pause
goto MENU

:CHKDSK
echo Running disk check on C: ...
chkdsk C: /f
echo Disk check has been scheduled. It will run on the next restart.
pause
goto MENU

:DEFRAG
echo Checking drive type for C: drive...
powershell -Command "Get-PhysicalDisk | Where-Object { $_.DeviceID -eq '0' } | Select-Object MediaType" | findstr /i "SSD" >nul 2>&1
if %errorlevel%==0 (
    echo -> Drive is an SSD. Running TRIM optimization...
    defrag C: /L /U /V
) else (
    echo -> Drive is an HDD. Running full defragmentation...
    defrag C: /U /V
)
echo Optimization complete.
pause
goto MENU

:STARTUP
echo Listing startup programs...
wmic startup get caption,command > "%TEMP%\startup_programs.txt"
echo A file with startup programs has been opened with Notepad.
notepad "%TEMP%\startup_programs.txt"
pause
goto MENU

:HEALTH
echo Showing system health info...
echo.
echo [CPU Usage]
wmic cpu get loadpercentage
echo.
echo [RAM Info]
systeminfo | findstr /C:"Total Physical Memory"
systeminfo | findstr /C:"Available Physical Memory"
echo.
echo [Disk Info]
wmic logicaldisk get size,freespace,caption
pause
goto MENU

:DISKCLEANUP
echo Starting Windows Disk Cleanup Utility with all items pre-selected...
echo This will safely clean system files, including old Windows Updates.
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches" /v StateFlags0001 /t REG_DWORD /d 2 /f >nul 2>&1
cleanmgr.exe /sagerun:1
echo Disk Cleanup complete.
pause
goto MENU

:REPAIR
echo --- Running System File Checker (SFC) ---
echo This will scan for and repair corrupted system files. This may take some time.
sfc /scannow
echo.
echo --- Running Deployment Image Servicing and Management (DISM) ---
echo This will repair the core Windows system image. This may take some time.
Dism /Online /Cleanup-Image /RestoreHealth
echo System file repair process completed.
pause
goto MENU

:POWER
echo Setting Power Plan to High Performance...
for /f "tokens=4" %%G in ('powercfg -list ^| find "High performance"') do (set HPGUID=%%G)
powercfg /setactive %HPGUID% >nul 2>&1
echo -> Power plan set to High Performance.
echo.
echo Attempting to enable and activate Ultimate Performance plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
echo -> Done.
pause
goto MENU
    
:EVENTLOGS
echo.
echo [!] WARNING: This will permanently clear all Windows Event Logs
echo (System, Security, Application, etc.). This action cannot be undone.
set /p sure="Are you absolutely sure you want to proceed? (Y/N): "
if /i "%sure%" neq "Y" goto MENU
echo.
echo Clearing Event Logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)
echo All Event Logs have been cleared.
pause
goto MENU

:FULL
echo --- Running Full Cleanup + Optimization ---
echo.
echo [1/8] Cleaning temporary files...
call :TEMP >nul
echo [2/8] Cleaning logs (safe)...
call :LOGS >nul
echo [3/8] Cleaning browser caches...
call :BROWSER >nul
echo [4/8] Cleaning Windows Update cache...
call :UPDATECACHE >nul
echo [5/8] Emptying Recycle Bin...
call :RECYCLE >nul
echo [6/8] Flushing DNS cache...
call :FLUSHDNS >nul
echo [7/8] Running Windows Disk Cleanup...
call :DISKCLEANUP >nul
echo [8/8] Optimizing drive (Defrag/TRIM)...
call :DEFRAG >nul
echo.
echo --- Full Cleanup + Optimization Complete! ---
echo A restart is recommended to apply all changes (like chkdsk).
pause
goto MENU