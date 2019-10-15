#--------------------- Velocito vs. kallisto + bustools + loompy (v3.0.6) :
#-- 1- kallisto + bustools + loompy (v3.0.6) : runing time ~ 1h (8 threads)
#-- Goal :  From fastq file to loom files that can be analyzed using the  scanpoy scvelo (Theis lab)
#-- See. http://linnarssonlab.org/loompy/kallisto/index.html
#-- Install loompy : pip install -U loompy
#-- kallisto (https://pachterlab.github.io/kallisto/download.html)
#-- bustools (https://github.com/BUStools/bustools) 

#!/bin/bash
#PBS -l nodes=1:ppn=8,walltime=05:00:00
#PBS -q batch
#PBS -N loompy_JB18031
cd $PBS_O_WORKDIR

source activate velo

module load kallisto/0.46.0

export LANG=en_US.UTF-8 LANGUAGE=en_US.en LC_ALL=en_US.UTF-8

loompy fromfq --threads 8 JB18031.loom JB18031 \
/projects/nehard/SingleCell/Softwares/cellranger/human_GRCh38_gencode.v31 \
metadata.tab \ #tab "\t" delimited table: containing sample name (name), technology (10xv2, 10xv3) and targetnumcells
/projects/nehard/SingleCell/LifeSpan/fastq/JB18031/JB18031_GT18-06631_SI-GA-F4_S7_L007_R1_001.fastq.gz \
/projects/nehard/SingleCell/LifeSpan/fastq/JB18031/JB18031_GT18-06631_SI-GA-F4_S7_L007_R2_001.fastq.gz  \

#------------------- 2- Cell ranger (v3) + Velocito: runibng time ~ 10h

#--  See. http://velocyto.org/velocyto.py/tutorial/cli.html#run10x-run-on-10x-chromium-samples

#!/bin/bash
#PBS -l nodes=1:ppn=8,walltime=10:00:00
#PBS -q batch
#PBS -N Velo
cd $PBS_O_WORKDIR


export LC_ALL=de_DE.utf-8
export LANG=de_DE.utf-8
export PATH=/projects/nehard/SingleCell/cellranger/cellranger-3.0.2:$PATH

source activate velo 

velocyto run -b /projects/nehard/SingleCell/Velocity/JB17010/cellranger/filtered_feature_bc_matrix/barcodes.tsv \ #-- cellranger output
-o /projects/nehard/SingleCell/Velocity/output/ \  #- output where the output  i.e. theloom file will be saved 
/projects/nehard/SingleCell/Velocity/JB17010/cellranger/possorted_genome_bam.bam \ #-- Bam file (cell ranger output)
/projects/nehard/SingleCell/cellranger/refdata-cellranger-GRCh38-3.0.0/genes/genes.gtf #-- (GTF to  be downloaded from cellranger  website)

