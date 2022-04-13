#!/bin/bash

v100=$( squeue | grep 'gpu' |  awk ' $8 !~ /\(/ {print $8}' | sort -u |  wc -l)
echo "STATUS v100 GPUS: "$v100"/10 nodes are in use"

gtx=$( squeue | grep 'gtx' |  awk ' $8 !~ /\(/ {print $8}' | sort -u |  wc -l)
echo "STATUS 1080TI GPUS: "$gtx"/10 nodes are in use"

ecsstaff=$(squeue | grep 'ecsstaff' |  awk ' $8 !~ /\(/' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS rtx8000 GPUS: "$ecsstaff"/12 staff GPUS are in use"

ecsstudent=$(squeue | grep 'ecsstu' |  awk ' $8 !~ /\(/' | awk '{print $7}' | awk '{s+=$1} END {print s}')
echo "STATUS rtx8000 GPUS: "$ecsstudent"/8 student GPUS are in use"

