set -e
out=$1
read=`pwd`/$2
gs=$3
thread=16

if [ ! -d $out ]
then
    mkdir $out
fi
cd $out
if [ ! -f long_reads.fastq.gz ]
then
	ln -s $read long_reads.fastq.gz
fi
echo "`pwd`/long_reads.fastq.gz" > read_list.txt
echo 'PROJECT=NECAT' >> config_file.txt
echo 'ONT_READ_LIST=read_list.txt' >> config_file.txt
echo "GENOME_SIZE=$gs" >> config_file.txt
echo "THREADS=$thread" >> config_file.txt
echo 'MIN_READ_LENGTH=3000' >> config_file.txt
echo 'PREP_OUTPUT_COVERAGE=40' >> config_file.txt
echo 'OVLP_FAST_OPTIONS=-n 500 -z 20 -b 2000 -e 0.5 -j 0 -u 1 -a 1000' >> config_file.txt
echo 'OVLP_SENSITIVE_OPTIONS=-n 500 -z 10 -e 0.5 -j 0 -u 1 -a 1000' >> config_file.txt
echo 'CNS_FAST_OPTIONS=-a 2000 -x 4 -y 12 -l 1000 -e 0.5 -p 0.8 -u 0' >> config_file.txt
echo 'CNS_SENSITIVE_OPTIONS=-a 2000 -x 4 -y 12 -l 1000 -e 0.5 -p 0.8 -u 0' >> config_file.txt
echo 'TRIM_OVLP_OPTIONS=-n 100 -z 10 -b 2000 -e 0.5 -j 1 -u 1 -a 400' >> config_file.txt
echo 'ASM_OVLP_OPTIONS=-n 100 -z 10 -b 2000 -e 0.5 -j 1 -u 0 -a 400' >> config_file.txt
echo 'NUM_ITER=2' >> config_file.txt
echo 'CNS_OUTPUT_COVERAGE=30' >> config_file.txt
echo 'CLEANUP=1' >> config_file.txt
echo 'USE_GRID=false' >> config_file.txt
echo 'GRID_NODE=0' >> config_file.txt
echo 'GRID_OPTIONS=' >> config_file.txt
echo 'SMALL_MEMORY=0' >> config_file.txt
echo 'FSA_OL_FILTER_OPTIONS=' >> config_file.txt
echo 'FSA_ASSEMBLE_OPTIONS=' >> config_file.txt
echo 'FSA_CTG_BRIDGE_OPTIONS=' >> config_file.txt
echo 'POLISH_CONTIGS=true' >> config_file.txt
~/software/NECAT/Linux-amd64/bin/necat.pl correct config_file.txt
~/software/NECAT/Linux-amd64/bin/necat.pl assemble config_file.txt
~/software/NECAT/Linux-amd64/bin/necat.pl bridge config_file.txt
