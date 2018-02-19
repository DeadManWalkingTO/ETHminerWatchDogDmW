#!/bin/bash

#========== Pre ==========

V=1.7.3

#========== Start ==========

clear
echo '###############################################################################'
echo '#                                                                             #'
echo '#  ETHminerWatchDogDmW Version '$V'                                          #'
echo '#                                                                             #'
echo '#  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #'
echo '#                                                                             #'
echo '###############################################################################'
echo #
echo 'ETHminerWatchDogDmW'
echo '1. Run ethminer.'
echo '2. Restart ethminer up to 10 times.'
echo '3. Reboot the system.'
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

./ethminer -RH -U -S eu1.ethermine.org:4444 -O 0x7013275311fc37ccc1e40193D75086293eCb43A4.test

#==================== Your Code End Here ====================

}

#========== Initializing ==========

#========== Run Program ==========

ProgramError=0
while $ProgramError=0; do

#========== Calc ==========

loopnum=$((loopnum+1))
pdate=`date '+%Y-%m-%d %H:%M'`

#========== Screen Output ==========

echo #
echo '###############################################################################'
echo $pdate
echo 'ETHminerWatchDogDmW has run '$loopnum' times.'
echo '###############################################################################'
echo #

#========== File Output ==========

echo $pdate >> RunTimes.log
echo ETHminerWatchDogDmW has run $loopnum times. >> RunTimes.log
echo >> RunTimes.log

#========== Execution Code ==========

RunEthMinerCommand

#Wait 5s
sleep 5

#Check 10 loops
if [ $loopnum > 10 ]
then
ProgramError=1
fi

done

#========== Error Handling ==========

#========== Error Screen Output ==========

echo
echo '###############################################################################'
echo $pdate
echo 'ETHminerWatchDogDmW has run '$loopnum' times.'
echo 'System Restart Required.'
echo
echo
echo
echo 'Reboot Now ('$pdate')'
echo '###############################################################################'
echo

#========== Error File Output ==========

echo $pdate >> RunTimes.log
echo 'ETHminerWatchDogDmW has run '$loopnum' times.' >> RunTimes.log
echo 'System Restart Required.' >> RunTimes.log
echo >> RunTimes.log
echo >> RunTimes.log
echo >> RunTimes.log
echo 'Reboot Now ('$pdate')' >> RunTimes.log
echo >> RunTimes.log

#========== System Reboot ==========

shutdown -r now

#========== EOF ==========
