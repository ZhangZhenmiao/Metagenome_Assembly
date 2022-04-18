reads=`pwd`/$1
long=`pwd`/$2
gsize=$3
out=$4
threads=100

set -e

if [ ! -d "$out" ];then
	mkdir $out
fi
source ~/.bashrc; conda deactivate; conda activate python2
# step 1
# Normally with ~50x coverage, NodeCovTh 1 EdgeCovTh 0 can produce nice results
# two parameters can be fine-tuned NodeCovTh 2 EdgeCovTh 1 with LD 1
cd $out
pigz -dc $reads | seqkit split2 -p 2 -
mv stdin.split/* ./
rm -r stdin.split
mv stdin.part_001.fastq reads1.fq
mv stdin.part_002.fastq reads2.fq
SparseAssembler LD 0 k 51 g 15 NodeCovTh 1 EdgeCovTh 0 GS $gsize i1 reads1.fq i2 reads2.fq

# step 2
# For 10x/20x PacBio data: KmerCovTh 2-5, MinOverlap 10-30, AdaptiveTh 0.001~0.01.
# For 50x-100x PacBio data: KmerCovTh 2-10, MinOverlap 50-150, AdaptiveTh 0.01-0.02.
# Some other less flexible or less important parameters:
# k: k-mer size, 17 works well.
# Contigs: the fasta contigs file from existing assembly.
# MinLen: minimum read length.
# RemoveChimera: remove chimeric reads in the dataset, suggest 1 if you have >10x coverage.
# For high coverage data (100x), there are two other parameters:
# ChimeraTh: default: 1, set to 2 if coverage is ~100x.
# ContigTh: default: 1, set to 2 if coverage is ~100x.
~/software/anaconda3/bin/seqkit fq2fa -j $threads $long -o long.fa
DBG2OLC k 17 AdaptiveTh 0.01 KmerCovTh 2 MinOverlap 20 RemoveChimera 1 Contigs Contigs.txt f long.fa

# step 3
mkdir consensus_dir
cat Contigs.txt long.fa > ctg_pb.fasta
split_and_run_sparc.sh backbone_raw.fasta DBG2OLC_Consensus_info.txt ctg_pb.fasta ./consensus_dir 2 >cns_log.txt

rm reads1.fq reads2.fq