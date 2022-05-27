# Benchmarking de novo assembly methods on metagenomic sequencing data

## Assemblers evaluated
### Short-read assemblers
- metaSPdes ```assembly_scripts/metaspades.sh <reads> <output>```
- MEGAHIT ```assembly_scripts/megahit.sh <reads> <output>```
### Linked-read assemblers
- cloudSPAdes ```assembly_scripts/cloudspades.sh <reads> <output>```
- Athena ```assembly_scripts/athena.sh <short-read ssembly> <reads> <output>```
### Long-read assemblers
- metaFlye ```assembly_scripts/metaflye.sh <reads> <output>```
- Canu ```assembly_scripts/canu.sh <reads> <output> <genome_size>```
- Lathe ```assembly_scripts/lathe.sh <contig_template> <long_reads> <short_reads> <output> <genome_size>```
- Shasta ```assembly_scripts/shasta.sh <reads> <output>```
- MECAT2 ```assembly_scripts/mecat2.sh <reads> <output> <genome_size>```
- NECAT ```assembly_scripts/necat.sh <reads> <output> <genome_size>```
- wtdbg2 ```assembly_scripts/wtdbg2.sh <reads> <output> <genome_size>```
### Hybrid assemblers
- metaFlye-subassemblies ```assembly_scripts/metaflye-subassemblies.sh <short-read assembly> <long-read assembly> <output>```
- DBG2OLC ```assembly_scripts/dbg2olc.sh <short_reads> <long_reads> <output> <genome_size>```
- OPERA-MS ```assembly_scripts/opera-ms.sh <short_reads> <long_reads> <output>```
- OPERA-LG ```assembly_scripts/opera-lg.sh <short-read assembly> <short_reads> <long_reads> <output>```


## Time and memory
Time and memory consumed are measured by adding ```/usr/bin/time -v``` before the above commands.
