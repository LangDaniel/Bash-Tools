#!/bin/bash

LC_ALL=en_US.UTF-8                      # use to get dots and not commas for floats

NCores=5
declare -a Jobs

CUV=(-0.05 0 0.05 0.1 0.15 0.2 0.25 )
CDV=(-0.15 -0.1 -0.05 0 0.05 0.1 0.15)

CurrentJob=0

for cuv in ${!CUV[*]}; do
    for cdv in ${!CDV[*]}; do
        echo -e "${CUV[$cuv]}\n${CDV[$cdv]}" | nohup ./DOVEy3FLAVOURv2_intrinsic &
        Jobs[$CurrentJob]=$!
        sleep 2
        ((CurrentJob++))
        if !((CurrentJob % NCores)); then
            for j in `seq 0 $(($CurrentJob-1))`; do
                wait ${Jobs[$j]}
            done
            CurrentJob=0
            echo done waiting
        fi
    done
done
