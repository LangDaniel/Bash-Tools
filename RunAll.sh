#!/bin/bash

declare -a Jobs
CurrentJob=0

YMax=0.5

cd `pwd`

cd ./PDF
echo $YMax | nohup ./PDFGRID &
Jobs[$CurrentJob]=$!
((CurrentJob++))
cd ./..

cd ./MATCHING
echo $YMax | nohup ./MATCHING &
Jobs[$CurrentJob]=$!
((CurrentJob++))
cd ./..

cd ./INTRINSIC
echo $YMax | nohup ./DOVEy3FLAVOURv2_intrinsic &
Jobs[$CurrentJob]=$!
((CurrentJob++))
cd ./..

for j in `seq 0 $((${#Jobs[*]}-1))`; do
    wait ${Jobs[$j]}
done

cd ./SPLITTING
nohup ./runNew.sh 
cd ./..

cd ./YINTEGRATION
nohup ./runNew.sh
cd ./..

cd ./SUMRULE_INTEGRATION
nohup ./runNew.sh
cd ./..

