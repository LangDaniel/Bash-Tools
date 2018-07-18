#!/bin/bash

working_dir=`pwd`
cd $working_dir

folder=($(find -maxdepth 1 -name "STEP*"))

for ii in ${!folder[*]}; do
    cd ${folder[ii]}
    dir=$(basename `pwd`)
    dir=${dir//./_}    
    tar_name="$dir.tar.gz"
    echo $tar_name
    cp $tar_name "/temp_local/lad27661/Steps"
#    tar -czf $tar_name  ./SUMRULE_INTEGRATION/OUTPUT $( find ./ -name "*.f90")
    cd $working_dir
    echo "done with $dir" >> tar.txt
done


