#--------------------- Comparing 'Cell ranger (v3) - Velocito' pipeline with kallisto + bustools + loompy (v3.0.6) :

# 1- kallisto + bustools + loompy (v3.0.6) : runing time ~ 1h (8 threads)
#-- Goal :  From fastq file to loom files that can be analyzed using the  scanpoy scvelo (Theis lab)  
#-- See. http://linnarssonlab.org/loompy/kallisto/index.html  
#-- Install loompy : pip install -U loompy  
#-- kallisto (https://pachterlab.github.io/kallisto/download.html)  
#-- bustools (https://github.com/BUStools/bustools)   
#-- h5py 2.9.0 : pip install h5py==2.9.0  


# 2- Cell ranger (v3) + Velocito: runing time ~ 10h  
#--  See. http://velocyto.org/velocyto.py/tutorial/cli.html#run10x-run-on-10x-chromium-samples  
