reads=$1
output=$2
~/software/spades-cloudspades-paper/assembler/metaspades.py --gemcode1-12 $reads -t 100 -m 2000 -o ${output}_cloudspades
