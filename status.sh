#!/bin/bash
echo ""
echo "-------------------------NODE STATUS-----------------------"
echo ""
sinfo -s | head -n 1
sinfo -s | grep 'gtx1080\|gpu\|ecsstaff\|ecsstudents'
echo "Note: allocated/idle/other/total"


echo ""
echo ""
echo "--------------------------GPU STATUS-----------------------"
echo ""


ecsstudent_used=0
re='^[0-9]+$'
for node in 'alpha51', 'alpha52', 'alpha53';
  do
    used=$(scontrol show node\=$node | grep 'AllocTRES' | tail -c 2 | sed 's/[^0-9]//g')
    if [[ $used  ]] ; then
       ecsstudent_used=$(($ecsstudent_used + $used))
    fi
  done
ecsstaff_used=0
for node in 'alpha54', 'alpha55', 'alpha56';
  do
    used=$(scontrol show node\=$node | grep 'AllocTRES' | tail -c 2 | sed 's/[^0-9]//g')
    if [[ $used  ]] ; then
       ecsstaff_used=$(($ecsstaff_used + $used))
    fi
  done


echo "------------------------------------------"
echo "|PARTITION|       |USED|         |NR GPUS|"
echo "------------------------------------------"
echo "ecsstudent        "$ecsstudent_used"                  12"
echo "ecsstaff          "$ecsstaff_used"                  12"

echo "Note: gtx1080 and v100 are GPUS locked to users on the node"
echo "      rtx8000 are not locked to node users"
echo ""

