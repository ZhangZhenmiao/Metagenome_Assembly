set -e
out=$1
read=$2
gs=$3
thread=$4

if [ ! -d $out ]
then
    mkdir $out
fi
cd $out
echo "PROJECT=MECAT2" > config_file.txt
echo "RAWREADS=$read" >> config_file.txt
echo "GENOME_SIZE=$gs" >> config_file.txt
echo "THREADS=$thread" >> config_file.txt
echo "MIN_READ_LENGTH=2000" >> config_file.txt
echo 'CNS_OVLP_OPTIONS="-kmer_size 13"' >> config_file.txt
echo 'CNS_PCAN_OPTIONS="-p 100000 -k 100"' >> config_file.txt
echo 'CNS_OPTIONS=""' >> config_file.txt
echo 'CNS_OUTPUT_COVERAGE=30' >> config_file.txt
echo 'TRIM_OVLP_OPTIONS="-skip_overhang"' >> config_file.txt
echo 'TRIM_PM4_OPTIONS="-p 100000 -k 100"' >> config_file.txt
echo 'TRIM_LCR_OPTIONS=""' >> config_file.txt
echo 'TRIM_SR_OPTIONS=""' >> config_file.txt
echo 'ASM_OVLP_OPTIONS=""' >> config_file.txt
echo 'FSA_OL_FILTER_OPTIONS="--max_overhang=-1 --min_identity=-1"' >> config_file.txt
echo 'FSA_ASSEMBLE_OPTIONS=""' >> config_file.txt
echo 'CLEANUP=0' >> config_file.txt
mecat.pl correct config_file.txt
mecat.pl trim config_file.txt
mecat.pl assemble config_file.txt
