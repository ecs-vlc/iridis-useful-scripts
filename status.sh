#!/bin/bash

#!/bin/bash


v100=$(squeue |  awk ' $2 ~ /\gpu/' |  awk ' $8 !~ /\(/' | awk  '!_[$8]++' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS v100 GPUS: "$v100"/10 nodes are in use"

gtx=$(squeue |  awk ' $2 ~ /\gtx1080/' |  awk ' $8 !~ /\(/' | awk  '!_[$8]++' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS 1080TI GPUS: "$gtx"/10 nodes are in use"

echo "The following is an approximation because we can't retrieve the number of GPUS used in a job!"
echo " '+' is for the GPUS that are accesible through the partition 'ecsall'"


ecsall=$(squeue |  awk ' $2 ~ /\ecsall/' |  awk ' $8 !~ /\(/' | awk '{print $7 " " $8}' |  awk ' $2 ~ /1|2|3/' | awk '{s+=$1} END {print s}')

#PartitionName=ecsstaff Nodes=alpha[51-53]
ecsstaff=$(squeue |  awk ' $2 ~ /\ecsstaff/' |  awk ' $8 !~ /\(/' | awk '{print $7 " " $8}' |  awk ' $2 ~ /1|2|3/' | awk '{s+=$1} END {print s}')
echo "STATUS rtx8000 GPUS: "$ecsstaff+$ecsall"/12 staff GPUS are in use"


# PartitionName=ecsstudents Nodes=alpha[54-56]
ecsstudent=$(squeue |  awk ' $2 ~ /\ecsall/' |  awk ' $8 !~ /\(/' | awk '{print $7}'|  awk ' $2 ~ /4|5|6/'  | awk '{s+=$1} END {print s}')
ecsstudent=$(squeue |  awk ' $2 ~ /\ecsstudent/' |  awk ' $8 !~ /\(/' | awk '{print $7}'|  awk ' $2 ~ /4|5|6/'  | awk '{s+=$1} END {print s}')
echo "STATUS rtx8000 GPUS: "$ecsstudent+$ecsall"/12 student GPUS are in use"

