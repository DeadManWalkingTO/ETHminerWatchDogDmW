#!/bin/bash

#========== Start ==========

clear
V=1.6.3
echo '###############################################################################'
echo '#                                                                             #'
echo '#  ETHminerWachDogDmW Version '$V'                                           #'
echo '#                                                                             #'
echo '#  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #'
echo '#                                                                             #'
echo '###############################################################################'
echo #


#========== Run EthMiner Command ==========

RunEthMinerCommand()
{

#==================== Your Code Start Here ====================

#setx GPU_FORCE_64BIT_PTR 0
#setx GPU_MAX_HEAP_SIZE 100
#setx GPU_USE_SYNC_OBJECTS 1
#setx GPU_MAX_ALLOC_PERCENT 100
#setx GPU_SINGLE_ALLOC_PERCENT 100

ethminer.exe -RH -U -S eu1.ethermine.org:4444 -O 0x7013275311fc37ccc1e40193D75086293eCb43A4.test

#==================== Your Code End Here ====================

}

#========== Initializing ==========

# Initializing CUDA Devices Number @ Start
nvidia-smi --format=csv,noheader,nounits --query-gpu=utilization.gpu > CUDA.log
a=($(wc CUDA.log))
CUDAnumber=${a[0]}
#words=${a[1]}
#chars=${a[2]}
echo System CUDA GPUs are $CUDAnumber.

#========== Run Program ==========

ProgramError=0
while $ProgramError=0; do

#========== Calc ==========

loopnum=$((loopnum+1))
pdate=`date '+%Y-%m-%d %H:%M'`

if [ $loopnum > 1 ]
then
nvidia-smi --format=csv,noheader,nounits --query-gpu=utilization.gpu > CUDA.log
a=($(wc CUDA.log))
CUDAnumberCheck=${a[0]}
ProgramError=1
fi

# If NO Error Run Normal
if [ ProgramError=0 ]
then

#========== Screen Output ==========

echo #
echo '###############################################################################'
echo $pdate
echo 'ETHminerWachDogDmW has run '$loopnum' times.'
echo '###############################################################################'
echo #

#========== File Output ==========

echo $pdate >> RunTimes.log
echo ETHminerWachDogDmW has run $loopnum times. >> RunTimes.log
echo >> RunTimes.log

#========== Execution Code ==========

RunEthMinerCommand

#Wait 5s
sleep 5

fi

done

#========== Error Handling ==========

#========== Error Screen Output ==========

echo
echo '###############################################################################'
echo $pdate
echo 'ETHminerWachDogDmW has run '$loopnum' times.'
echo 'System CUDA GPU(s) '$CUDAnumber'. Working CUDA GPU(s) '$CUDAnumberCheck' .'
echo 'System Restart Required.'
echo '###############################################################################'
echo

#========== Error File Output ==========

echo $pdate >> RunTimes.log
echo 'ETHminerWachDogDmW has run '$loopnum' times.' >> RunTimes.log
echo 'System CUDA GPU(s) '$CUDAnumber'. Working CUDA GPU(s) '$CUDAnumberCheck' .' >> RunTimes.log
echo 'System Restart Required.' >> RunTimes.log
echo >> RunTimes.log

#========== System Reboot ==========

shutdown -r now

#========== EOF ==========
