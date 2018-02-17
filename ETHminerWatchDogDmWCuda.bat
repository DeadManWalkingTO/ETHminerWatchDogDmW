rem ========== Start ==========

cls
@echo OFF
set V=1.6.3
title ETHminerWachDogDmW Version %V% by: DeadManWalking
echo ###############################################################################
echo #                                                                             #
echo #  ETHminerWachDogDmW Version %V%                                           #
echo #                                                                             #
echo #  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #
echo #                                                                             #
echo ###############################################################################
echo.

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

rem Set Paths etc
set "batchPath=%~0"
set "batchName=%%~nk"
setlocal & pushd .
cd /d %~dp0

rem Initializing CUDA Devices Number @ Start
C:\Program Files\NVIDIA Corporation\NVSMI>nvidia-smi --format=csv,noheader,nounits --query-gpu=utilization.gpu > CUDA.log
setlocal EnableDelayedExpansion
set "cmd=findstr /R /N "^^" CUDA.log | find /C ":""
for /f %%a in ('!cmd!') do set CUDAnumber=%%a
echo System CUDA GPUs are %CUDAnumber%

rem ========== Run Program ==========

:runProgram

rem ========== Calc ==========

rem Calc Date & Time 
set /A loopnum=loopnum+1
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set pdate=%%c-%%a-%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set ptime=%%a:%%b)

rem First Time Skip CUDAcheck
if %loopnum%==1 goto OutPut

:CUDAcheck
rem calc CUDA devices Number Check
C:\Program Files\NVIDIA Corporation\NVSMI>nvidia-smi --format=csv,noheader,nounits --query-gpu=utilization.gpu > CUDA.log
setlocal EnableDelayedExpansion
set "cmd=findstr /R /N "^^" CUDA.log | find /C ":""
for /f %%a in ('!cmd!') do set CUDAnumberCheck=%%a
rem GoTo Error Handling
if %CUDAnumber% <> %CUDAnumberCheck% goto ProgramError

rem ========== Output ==========

:OutPut

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

goto RunEthMinerCommand
:EndEthMinerCommand

rem Wait 5s
timeout 5 > NUL

rem loop
goto runProgram

rem ========== Error Handling ==========

:ProgramError

rem ========== Error Screen Output ==========

echo.
echo ###############################################################################
echo %pdate% %ptime%
echo ETHminerWachDogDmW has run %loopnum% times.
echo System CUDA GPU(s) %CUDAnumber%. Working CUDA GPU(s) %CUDAnumberCheck%.
echo System Restart Required.
echo ###############################################################################
echo.

rem ========== Error File Output ==========

echo %pdate% %ptime% >> RunTimes.log
echo ETHminerWachDogDmW has run %loopnum% times. >> RunTimes.log
echo System CUDA GPU(s) %CUDAnumber%. Working CUDA GPU(s) %CUDAnumberCheck%. >> RunTimes.log
echo System Restart Required. >> RunTimes.log
echo. >> RunTimes.log

rem ========== System Reboot ==========

shutdown -r -f -t 0

rem ========== EOF ==========
