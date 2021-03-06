library(devtools) 
library(Seurat)
library(velocyto.R)
library(SeuratWrappers)

#- Install SeuratWrappers : devtools::install_github('satijalab/seurat-wrappers')
#- Install "velocyto.R" : install_github("velocyto-team/velocyto.R")


# If you don't have velocyto's example mouse bone marrow dataset, download with the CURL command
# curl::curl_download(url = 'http://pklab.med.harvard.edu/velocyto/mouseBM/SCG71.loom', destfile
# = '~/Downloads/SCG71.loom')

  ldat <- ReadVelocity(file = "path_to_loom/JB18036_HO4.loom")
  bm <- as.Seurat(x = ldat)
  bm <- SCTransform(object = bm, assay = "spliced")
  bm <- RunPCA(object = bm, verbose = FALSE)
  bm <- FindNeighbors(object = bm, dims = 1:20)
  bm <- FindClusters(object = bm)
  bm <- RunUMAP(object = bm, dims = 1:20)
  bm <- RunVelocity(object = bm, deltaT = 1, kCells = 25, fit.quantile = 0.02)
  ident.colors <- (scales::hue_pal())(n = length(x = levels(x = bm)))
  names(x = ident.colors) <- levels(x = bm)
  cell.colors <- ident.colors[Idents(object = bm)]
  names(x = cell.colors) <- colnames(x = bm)
  save(bm, file = 'path_to_rds/Velo_test1.rds')
  p <- show.velocity.on.embedding.cor(emb = Embeddings(object = bm, reduction = "umap"), 
                                 vel = Tool(object = bm, slot = "RunVelocity"),
                                 n = 200, scale = "sqrt", 
                                 cell.colors = ac(x = cell.colors, alpha = 0.5), 
                                 cex = 0.8, arrow.scale = 3, show.grid.flow = TRUE,
                                 min.grid.cell.mass = 0.5, grid.n = 40, arrow.lwd = 1, 
                                 do.par = FALSE, cell.border.alpha = 0.1)
  print(p)
  
  
