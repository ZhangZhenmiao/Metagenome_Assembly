contig=$1
reads=`pwd`/$2
output=$3

set -e
mkdir $output; cd $output

echo '{' > config.json
echo '    "ctgfasta_path": "'$contig'",' >> config.json
echo '    "reads_ctg_bam_path": "align-reads.contigs.bam",' >> config.json
echo '    "input_fqs": "reads.fq",' >> config.json
echo '    "cluster_settings": {' >> config.json
echo '        "cluster_type": "multiprocessing",' >> config.json
echo '        "processes": 32' >> config.json
echo '    }' >> config.json
echo '}' >> config.json

bwa index $contig
bwa mem -t 100 -C $contig $reads | samtools sort -@ 100 -o align-reads.contigs.bam &
gzip -dc $reads > reads.fq &
wait
samtools index -@ 100 align-reads.contigs.bam

source ~/.bashrc; conda deactivate; conda activate python2
athena-meta --config config.json