#!/bin/bash
long=`pwd`/$1
read=`pwd`/$2
out=$3

set -e
source ~/.bashrc
if [ ! -d $out ]
then
    mkdir $out
fi
cd $out

pigz -dc $read | seqkit split2 -p 2 - &
pigz -dc $long > long_reads.fastq &
wait
mv stdin.split/* ./
rm -r stdin.split

cd ..
read1=`pwd`/$out/stdin.part_001.fastq
read2=`pwd`/$out/stdin.part_002.fastq
perl /home/comp/zmzhang/software/OPERA-MS-0.8.3/OPERA-MS.pl --long-read `pwd`/$out/long_reads.fastq --short-read1 $read1 --short-read2 $read2 --num-processors 100 --out-dir $out

rm $read1 $read2 $out/long_reads.fastq
