#!/bin/bash

#========== Run EthMiner Command ==========

RunEthMinerCommand()
{

#==================== Your Code Starts Here ====================
#==================== Your Code Starts Here ====================
#==================== Your Code Starts Here ====================

./ethminer --farm-recheck 6000 -R --display-interval 10 --exit -X -P stratum1+tcp://0x0x0a42cE58f6f42516d8cc7B1831d01d4391F59Ef4.ETHminerWatchDogDmW@eu1.ethermine.org:4444 -P stratum1+tcp://0x0a42cE58f6f42516d8cc7B1831d01d4391F59Ef4.ETHminerWatchDogDmW@eu1.ethermine.org:14444

#==================== Your Code Ends Here ====================
#==================== Your Code Ends Here ====================
#==================== Your Code Ends Here ====================

}

#========== PreStart ==========

#Set EthMiner Variables
export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export CUDA_DEVICE_ORDER=PCI_BUS_ID
#export NO_COLOR=Yes

#Set version info
V=1.9.8

#========== Start ==========

clear
echo '###############################################################################'
echo #
echo '  ETHminerWatchDogDmW Version '$V
echo #
echo '  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)'
echo #
echo '###############################################################################'
echo #
echo 'ETHminerWatchDogDmW'
echo '1. Run ethminer.'
echo '2. Restart ethminer up to 10 times.'
echo '3. Reboot the system.'
echo #
echo 'Additional:'
echo '- Log file RunTimes.log'
echo #

#========== Initializing ==========

loopnum=$((0))
FileOut=RunTimes.log
echo 'ETHminerWatchDogDmW Version '$V >> $FileOut

#========== Run Program ==========

while [ $loopnum -le 9 ]
do

#========== Calc ==========

#Increment loop by one
loopnum=$((loopnum+1))

#Calculate Date & Time
pISOdate=`date '+%Y-%m-%d %H:%M'`

#========== Screen Output ==========

echo #
echo '==============================================================================='
echo $pISOdate
echo 'ETHminerWatchDogDmW has run '$loopnum' times.'
echo '==============================================================================='
echo #

#========== File Output ==========

echo $pISOdate ETHminerWatchDogDmW has run $loopnum times.>>$FileOut

#========== Execution Code ==========

RunEthMinerCommand

#Wait 5s
sleep 5s

done

#========== Error Handling ==========

#========== Error Screen Output ==========

echo
echo '==============================================================================='
echo $pISOdate
echo 'ETHminerWatchDogDmW has run '$loopnum' times.'
echo 'System restart required.'
echo
echo
echo
echo 'Rebooting now ('$pISOdate').'
echo '###############################################################################'
echo

#========== Error File Output ==========

echo $pISOdate' ETHminerWatchDogDmW has run '$loopnum' times.'>>$FileOut
echo 'System restart required. Rebooting now ('$pISOdate').'>>$FileOut
echo >>$FileOut
echo >>$FileOut

#========== System Reboot ==========

shutdown -r now

#========== End ==========

#========== EoF ==========
