reads=$1
output=$2
megahit --12 $reads -t 100 -o ${output}_megahit
