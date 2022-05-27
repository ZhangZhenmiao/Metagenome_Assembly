# set -e
long=`pwd`/$1
short=`pwd`/$2
prefix=$3
genomesize=$4

if [ ! -d $prefix ]
then
    mkdir $prefix
fi
cd $prefix
if [ ! -f long_reads.fastq ]
then
    pigz -dc $long > long_reads.fastq &
    pigz -dc $short | paste - - - - - - - - | tee >(cut -f 1-4 | tr "\t" "\n" > short_reads_1.fastq) | cut -f 5-8 | tr "\t" "\n" > short_reads_2.fastq &
    wait
fi
long=`pwd`/long_reads.fastq
short1=`pwd`/short_reads_1.fastq
short2=`pwd`/short_reads_2.fastq

echo -e "$prefix\t$long\t$short1,$short2" > sample_reads.txt
echo "sample_name: 'sample'" > "$prefix".yaml
echo "file_names_txt: 'sample_reads.txt'" >> "$prefix".yaml
echo "flowcell: 'FLO-MIN106'" >> "$prefix".yaml
echo "kit: 'SQK-LSK109'" >> "$prefix".yaml
echo "assembler: 'flye'" >> "$prefix".yaml
echo "min_contig_size: 0" >> "$prefix".yaml
echo "skip_circularization: False" >> "$prefix".yaml
echo "skip_polishing: False" >> "$prefix".yaml
echo "polish_both: False" >> "$prefix".yaml
echo "canu_args: 'cnsThreads=2 cnsMemory=32'" >> "$prefix".yaml
echo "usegrid: True" >> "$prefix".yaml
echo "grid_options: '--time=80:00:00 --account asbhatt'" >> "$prefix".yaml
echo "genome_size: '"$genomesize"m'" >> "$prefix".yaml

ulimit -s 65536

# ont
snakemake --cores 20 --use-singularity --singularity-args '--bind /tmp/metacomp_reads/ ' -s /tmp/lathe/Snakefile_ont --configfile "$prefix".yaml

# pacbio clr
# snakemake --cores 20 --use-singularity --singularity-args '--bind /tmp/metacomp_reads/ ' -s /tmp/lathe/Snakefile_pacbio_clr --configfile "$prefix".yaml

# pacbio hifi
# snakemake --cores 20 --use-singularity --singularity-args '--bind /tmp/metacomp_reads/ ' -s /tmp/lathe/Snakefile_pacbio_hifi --configfile "$prefix".yaml
