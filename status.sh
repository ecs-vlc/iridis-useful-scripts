#!/bin/bash

v100=$(squeue |  awk ' $2 ~ /\gpu/' |  awk ' $8 !~ /\(/' | awk  '!_[$8]++' | awk '{print $7}' | awk '{s+=$1} END {print s}')
gtx=$(squeue |  awk ' $2 ~ /\gtx1080/' |  awk ' $8 !~ /\(/' | awk  '!_[$8]++' | awk '{print $7}' | awk '{s+=$1} END {print s}')

#PartitionName=ecsstaff Nodes=alpha[51-53]
ecsstaff=$(squeue |  awk ' $2 ~ /\ecsstaff/' |  awk ' $8 !~ /\(/' | awk '{print $7 " " $8}' |  awk ' $2 ~ /1|2|3/' | awk '{s+=$1} END {print s}')

# PartitionName=ecsstudents Nodes=alpha[54-56]
ecsstudent=$(squeue |  awk ' $2 ~ /\ecsstuden/' |  awk ' $8 !~ /\(/' | awk '{print $7 " " $8}'|  awk ' $2 ~ /4|5|6/'  | awk '{s+=$1} END {print s}')


echo ""
echo "----------------------------------------------------------"
echo "|PARTITION|      |NODES|         |USED|         |RESOURCES|"
echo "----------------------------------------------------------"

echo "gtx1080           pink[51-60]       "$gtx"           10 nodes"
echo "gpu              indigo[51-60]      "$v100"           10 nodes"
echo "ecsstaff         alpha[51-53]       "$ecsstaff"           12 GPUS"
echo "ecsstudent       alpha[54-56]       "$ecsstudent"           12 GPUS"

echo ""
echo "Note: for 'ecs' partitions we approximate the number of GPUS used"
echo "e.g. a job could be using multiple gpus"
echo ""
echo ""
~
~
~
~
~
~
~
~
~
~
~
~
~
~
