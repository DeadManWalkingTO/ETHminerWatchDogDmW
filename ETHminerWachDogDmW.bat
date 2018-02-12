rem ========== Start ==========

cls
@echo OFF
set V=1.0.0
title ETHminerWachDogDmW Version %V% by: DeadManWalking
echo ###############################################################################
echo #                                                                             #
echo #  ETHminerWachDogDmW Version %V%                                           #
echo #                                                                             #
echo #  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #
echo #                                                                             #
echo ###############################################################################
echo.

rem ========== Initializing ==========

set "batchPath=%~0"
set "batchName=%%~nk"
setlocal & pushd .
cd /d %~dp0

rem ========== Run Program ==========

:runProgram

rem ========== Calc ==========

set /A loopnum=loopnum+1
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set pdate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set ptime=%%a:%%b)

rem ========== Screen Output ==========

echo.
echo ###############################################################################
echo %pdate% %ptime%
echo ETHminerWachDogDmW has run %loopnum% times.
echo ###############################################################################
echo.

rem ========== File Output ==========

echo %pdate% %ptime% >> RunTimes.log
echo ETHminerWachDogDmW has run %loopnum% times. >> RunTimes.log
echo. >> RunTimes.log

rem ========== Execution Code ==========

rem setx GPU_FORCE_64BIT_PTR 0
rem setx GPU_MAX_HEAP_SIZE 100
rem setx GPU_USE_SYNC_OBJECTS 1
rem setx GPU_MAX_ALLOC_PERCENT 100
rem setx GPU_SINGLE_ALLOC_PERCENT 100

ethminer.exe -RH -U -S eu1.ethermine.org:4444 -O Wallet.Rig

timeout 5 > NUL

goto runProgram

rem ========== EOF ==========
