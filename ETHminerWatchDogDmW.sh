#!/bin/bash

#========== PreStart ==========

#Set version info
V=1.8.5

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
echo 'Log file RunTimes.log'
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
echo 'ETHminerWatchDogDmW Version '%V% >> RunTimes.log

#========== Run Program ==========

while [ $loopnum -le 9 ]
do

#========== Calc ==========

loopnum=$((loopnum+1))

pISOdate=`date '+%Y-%m-%d %H:%M'`

#========== Screen Output ==========

echo #
echo '==============================================================================='
echo $pISOdate
echo 'ETHminerWatchDogDmW has run '$loopnum' times.'
echo '==============================================================================='
echo #

#========== File Output ==========

echo $pISOdate >> RunTimes.log
echo ETHminerWatchDogDmW has run $loopnum times. >> RunTimes.log
echo >> RunTimes.log

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
echo 'System Restart Required.'
echo
echo
echo
echo 'Reboot Now ('$pISOdate')'
echo '###############################################################################'
echo

#========== Error File Output ==========

echo $pISOdate >> RunTimes.log
echo 'ETHminerWatchDogDmW has run '$loopnum' times.' >> RunTimes.log
echo 'System Restart Required.' >> RunTimes.log
echo >> RunTimes.log
echo >> RunTimes.log
echo >> RunTimes.log
echo 'Reboot Now ('$pISOdate')' >> RunTimes.log
echo >> RunTimes.log

#========== System Reboot ==========

shutdown -r now

#========== End ==========

#========== EoF ==========
