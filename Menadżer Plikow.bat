@echo off
title Panel Narzedziowy
color 0A
mode con: cols=60 lines=20

:menu
cls
echo ========================================
echo             PANEL NARZEDZIOWY           
echo ========================================
echo 1. Informacje o systemie
echo 2. Czyszczenie pamieci podrecznej
echo 3. Sprawdzenie polaczenia z internetem
echo 4. Lista procesow
echo 5. Zakoncz proces
echo 6. Wyjscie
echo ========================================
set /p choice=Wybierz opcje (1-6): 

if "%choice%"=="1" goto system_info
if "%choice%"=="2" goto clean_cache
if "%choice%"=="3" goto check_internet
if "%choice%"=="4" goto list_processes
if "%choice%"=="5" goto kill_process
if "%choice%"=="6" exit
goto menu

:system_info
cls
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
pause
goto menu

:clean_cache
cls
echo Czyszczenie pamieci podrecznej...
del /s /q C:\Windows\Temp\* >nul 2>&1
del /s /q %temp%\* >nul 2>&1
echo Czyszczenie zakończone!
pause
goto menu

:check_internet
cls
ping 8.8.8.8 -n 1 >nul
if %errorlevel%==0 (
    echo Polaczenie z internetem jest dostepne.
) else (
    echo Brak polaczenia z internetem.
)
pause
goto menu

:list_processes
cls
tasklist | more
pause
goto menu

:kill_process
cls
set /p pname=Podaj nazwe procesu do zakonczenia:  
taskkill /F /IM %pname% >nul 2>&1
if %errorlevel%==0 (
    echo Proces %pname% zostal zakonczony.
) else (
    echo Blad: Nie znaleziono procesu %pname%.
)
pause
goto menu
