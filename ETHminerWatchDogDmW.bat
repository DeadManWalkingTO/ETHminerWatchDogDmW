rem ========== Pre ==========
@echo OFF
setlocal

rem Switch to the batch file's directory
cd /d %~dp0

set V=1.7.3
chcp 437

rem ========== Start ==========

cls
title ETHminerWatchDogDmW Version %V% by: DeadManWalking
echo ###############################################################################
echo #                                                                             #
echo #  ETHminerWatchDogDmW Version %V%                                          #
echo #                                                                             #
echo #  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #
echo #                                                                             #
echo ###############################################################################
echo.
echo ETHminerWatchDogDmW
echo 1. Run ethminer.
echo 2. Restart ethminer up to 10 times.
echo 3. Reboot the system.
echo.

rem Skip RunEthMinerCommand section at start
goto Initializing

rem ========== Run EthMiner Command ==========

:RunEthMinerCommand

rem ==================== Your Code Start Here ====================

rem setx GPU_FORCE_64BIT_PTR 0
rem setx GPU_MAX_HEAP_SIZE 100
rem setx GPU_USE_SYNC_OBJECTS 1
rem setx GPU_MAX_ALLOC_PERCENT 100
rem setx GPU_SINGLE_ALLOC_PERCENT 100

ethminer.exe -RH -U -S eu1.ethermine.org:4444 -O 0x7013275311fc37ccc1e40193D75086293eCb43A4.test

rem ==================== Your Code End Here ====================

goto EndEthMinerCommand

rem ========== Initializing ==========

:Initializing

rem ========== Run Program ==========

:runProgram

rem ========== Calc ==========

rem Calc Date & Time
set /A loopnum=loopnum+1
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set pdate=%%c-%%a-%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set ptime=%%a:%%b)

rem ========== Output ==========

rem ========== Screen Output ==========

echo.
echo ###############################################################################
echo %pdate% %ptime%
echo ETHminerWatchDogDmW has run %loopnum% times.
echo ###############################################################################
echo.

rem ========== File Output ==========

echo %pdate% %ptime% >> RunTimes.log
echo ETHminerWatchDogDmW has run %loopnum% times. >> RunTimes.log
echo. >> RunTimes.log

rem ========== Execution Code ==========

goto RunEthMinerCommand
:EndEthMinerCommand

rem Wait 5s
timeout 5 > NUL

rem Check 10 loops
if %loopnum% > 10 goto ErrorHandling

rem loop
goto runProgram

rem ========== Error Handling ==========

:ErrorHandling

rem ========== Error Screen Output ==========

echo.
echo ###############################################################################
echo %pdate% %ptime%
echo ETHminerWatchDogDmW has run %loopnum% times.
echo System Restart Required.
echo.
echo.
echo.
echo Reboot Now (%pdate% %ptime%).
echo ###############################################################################
echo.

rem ========== Error File Output ==========

echo %pdate% %ptime% >> RunTimes.log
echo ETHminerWatchDogDmW has run %loopnum% times. >> RunTimes.log
echo System Restart Required. >> RunTimes.log
echo. >> RunTimes.log
echo. >> RunTimes.log
echo. >> RunTimes.log
echo Reboot Now (%pdate% %ptime%). >> RunTimes.log
echo. >> RunTimes.log

rem ========== System Reboot ==========

shutdown -r -f -t 0

rem ========== END ==========

endlocal

rem ========== EOF ==========
