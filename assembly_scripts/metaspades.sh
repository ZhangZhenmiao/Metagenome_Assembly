reads=$1
output=$2
metaspades.py --12 $reads -t 100 -m 2000 -o ${output}_metaspades
