reads=$1
output=$2
~/software/anaconda3/envs/metacomp/bin/flye --meta --nano-raw $reads -t 100 -o ${output}_metaflye
