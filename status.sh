#!/bin/bash


v100=$(squeue |  awk ' $2 ~ /\gpu/' |  awk ' $8 !~ /\(/' | awk  '!_[$8]++' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS v100 GPUS: "$v100"/10 nodes are in use"

gtx=$(squeue |  awk ' $2 ~ /\gtx1080/' |  awk ' $8 !~ /\(/' | awk  '!_[$8]++' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS 1080TI GPUS: "$gtx"/10 nodes are in use"

ecsstaff=$(squeue |  awk ' $2 ~ /\ecsstaff/' |  awk ' $8 !~ /\(/' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS rtx8000 GPUS: "$ecsstaff"/12 staff GPUS are in use"

ecsstudent=$(squeue |  awk ' $2 ~ /\ecsstudent/' |  awk ' $8 !~ /\(/' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS rtx8000 GPUS: "$ecsstudent"/8 student GPUS are in use"






