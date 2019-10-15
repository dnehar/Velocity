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
