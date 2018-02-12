#========== Start ==========

clear
V=1.0.0
echo '###############################################################################'
echo '#                                                                             #'
echo '#  ETHminerWachDogDmW Version '$V'                                           #'
echo '#                                                                             #'
echo '#  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #'
echo '#                                                                             #'
echo '###############################################################################'
echo #

#========== Initializing ==========

#

#========== Run Program ==========

while true; do

#========== Calc ==========

loopnum=$((loopnum+1))
pdate=`date '+%Y-%m-%d %H:%M'`

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

#setx GPU_FORCE_64BIT_PTR 0
#setx GPU_MAX_HEAP_SIZE 100
#setx GPU_USE_SYNC_OBJECTS 1
#setx GPU_MAX_ALLOC_PERCENT 100
#setx GPU_SINGLE_ALLOC_PERCENT 100

./ethminer -RH -U -S eu1.ethermine.org:4444 -O Wallet.Rig

sleep 5

done

#========== EOF ==========
