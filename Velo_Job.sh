#-- Velocito vs. kallisto + bustools + loompy (v3.0.6) : 

#!/bin/bash
#PBS -l nodes=1:ppn=8,walltime=05:00:00
#PBS -q batch
#PBS -N loompy_JB18031
cd $PBS_O_WORKDIR

source activate velo

module load kallisto/0.46.0

export LANG=en_US.UTF-8 LANGUAGE=en_US.en LC_ALL=en_US.UTF-8

loompy fromfq --threads 8 JB18031.loom JB18031 \
/projects/nehard/SingleCell/Softwares/cellranger/human_GRCh38_gencode.v31 metadata.tab \
/projects/nehard/SingleCell/LifeSpan/fastq/JB18031/JB18031_GT18-06631_SI-GA-F4_S7_L007_R1_001.fastq.gz \
/projects/nehard/SingleCell/LifeSpan/fastq/JB18031/JB18031_GT18-06631_SI-GA-F4_S7_L007_R2_001.fastq.gz  \

#--- Cell ranger (v3) + Velocito 

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

