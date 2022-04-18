output=$1
genome=$2
reads=$3

mkdir $output
~/software/anaconda3/envs/metacomp/bin/wtdbg2 -x ont -g ${genome}m -t 100 -i $reads -fo $output/wtdbg2
~/software/anaconda3/envs/metacomp/bin/wtdbg-cns -t 100 -i $output/wtdbg2.ctg.lay.gz -fo $output/wtdbg2.ctg.fa
