reads=$1
output=$2
genome=$3


mkdir $output

# ont
~/software/anaconda3/envs/metacomp/bin/wtdbg2 -x ont -g ${genome}m -t 100 -i $reads -fo $output/wtdbg2

# pacbio clr
# ~/software/anaconda3/envs/metacomp/bin/wtdbg2 -x sq -g ${genome}m -t 100 -i $reads -fo $output/wtdbg2

# pacbio hifi
# ~/software/anaconda3/envs/metacomp/bin/wtdbg2 -x ccs -g ${genome}m -t 100 -i $reads -fo $output/wtdbg2

~/software/anaconda3/envs/metacomp/bin/wtdbg-cns -t 100 -i $output/wtdbg2.ctg.lay.gz -fo $output/wtdbg2.ctg.fa
