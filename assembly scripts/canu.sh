reads=`pwd`/$1
output=$2
genome=$3
mkdir ${output}_canu; cd ${output}_canu

# ont
echo "~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize="$genome"m -nanopore-raw "$reads" useGrid=false minThreads=2" > canu.sh
~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize=${genome}m -nanopore-raw $reads useGrid=false minThreads=2 > canu.log 2>&1

# pacbio clr
# echo "~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize="$genome"m -pacbio-raw "$reads" useGrid=false minThreads=2" > canu.sh
# ~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize=${genome}m -pacbio-raw $reads useGrid=false minThreads=2 > canu.log 2>&1

# pacbio hifi
# echo "~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize="$genome"m -pacbio-hifi "$reads" useGrid=false minThreads=2" > canu.sh
# ~/software/anaconda3/envs/metacomp/bin/canu -p canu -d `pwd` genomeSize=${genome}m -pacbio-hifi $reads useGrid=false minThreads=2 > canu.log 2>&1
