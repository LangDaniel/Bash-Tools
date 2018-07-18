#!/bin/bash

cd `pwd`

cd ./PDF/
gfortran PDFGRID.f90 -o PDFGRID

cd ./../MATCHING/
gfortran MATCHING.f90 -o MATCHING

cd ./../INTRINSIC/
gfortran DOVEy3FLAVOURv2_intrinsic.f90 -o DOVEy3FLAVOURv2_intrinsic

cd ./../SPLITTING/
gfortran DOVEy3FLAVOURv2.f90 -o DOVEy3FLAVOURv2

cd ./../YINTEGRATION/
gfortran YINTEGRATION.f90 -o YINTEGRATION
