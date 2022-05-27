contig=$1
short=`pwd`/$2
long=`pwd`/$3
out=$4
source ~/.bashrc
conda deactivate; conda activate python2
if [ ! -d $out ]
then
    mkdir $out
fi

cd $out
gzip -dc $long > long_reads.fastq &
pigz -dc $short | seqkit split2 -p 2 - &
wait

mv stdin.split/* ./
rm -r stdin.split
gzip stdin.part_001.fastq &
gzip stdin.part_002.fastq &
wait
cd ..

read1=`pwd`/$out/stdin.part_001.fastq.gz
read2=`pwd`/$out/stdin.part_002.fastq.gz
~/software/OPERA-LG/bin/OPERA-long-read.pl --contig-file $contig --kmer 55 --long-read-file `pwd`/$out/long_reads.fastq --illumina-read1 $read1 --illumina-read2 $read2 --num-of-processors 100 --opera ~/software/OPERA-LG/bin --samtools-dir ~/software/samtools-0.1.19/bin --blasr ~/software/blasr-1.3.1 --output-prefix operalg --output-directory $out
rm $read1 $read2
