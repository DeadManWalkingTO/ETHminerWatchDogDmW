#!/bin/bash

#========== PreStart ==========

#Set version info
V=1.9.1

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

#========== Run EthMiner Command ==========

RunEthMinerCommand()
{

#==================== Your Code Starts Here ====================

setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

./ethminer -RH -X -S eu1.ethermine.org:4444 -O 0x7013275311fc37ccc1e40193D75086293eCb43A4.ETHminerWatchDogDmW

#==================== Your Code Ends Here ====================

}

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
