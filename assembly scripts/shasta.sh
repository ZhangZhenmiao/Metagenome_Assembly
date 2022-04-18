out=$1
read=`pwd`/$2
thread=100
set -e
if [ ! -d $out ]
then
    mkdir $out
fi
cd $out
if [ ! -f long_reads.fasta ]
then
    ~/software/anaconda3/bin/seqkit fq2fa $read > long_reads.fasta
fi
shasta-Linux-0.7.0 --input `pwd`/long_reads.fasta --threads=$thread
