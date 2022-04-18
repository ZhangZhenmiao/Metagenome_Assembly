reads=`pwd`/$1
output=$2
genome=$3
mkdir ${output}_canu; cd ${output}_canu
echo "~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize="$genome"m -nanopore-raw "$reads" useGrid=false minThreads=2" > canu.sh
~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize=${genome}m -nanopore-raw $reads useGrid=false minThreads=2 > canu.log 2>&1
