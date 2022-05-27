reads=$1
output=$2

# ont
~/software/anaconda3/envs/metacomp/bin/flye --meta --nano-raw $reads -t 100 -o ${output}_metaflye

# pacbio clr
# ~/software/anaconda3/envs/metacomp/bin/flye --meta --pacbio-raw $reads -t 100 -o ${output}_metaflye

# pacbio hifi
# ~/software/anaconda3/envs/metacomp/bin/flye --meta --pacbio-hifi $reads -t 100 -o ${output}_metaflye
