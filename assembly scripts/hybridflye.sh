asm1=$1
asm2=$2
out=$3
set -e
if [ ! -d $out  ]
then
	mkdir $out
fi
cat $asm1 $asm2 > $out/combined_asm.fa
~/software/anaconda3/envs/metacomp/bin/flye --meta --subassemblies $out/combined_asm.fa -t 100 -o $out/metaflye
