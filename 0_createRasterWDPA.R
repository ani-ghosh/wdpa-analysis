# step 1: create the 1km raster in GEE
# GEE code link: https://code.earthengine.google.com/f3eee668a2f955bf95a6b52ef5abd1a6
# step 2: mosaic tiles in R

library(terra)

datadir <- "G:/My Drive/GEE_export_eia"
ff <- list.files(path = datadir, pattern = "wdparas_land*",
                 full.names = TRUE)
r1 <- rast(ff[1])
r2 <- rast(ff[2])
m <- mosaic(r1, r2)
m <- classify(m, cbind(NaN, NA))
writeRaster(m, "data/wdparas_land_1km.tif", 
            overwrite=TRUE, gdal=c("COMPRESS=LZW", "TFW=YES","of=COG"), datatype='INT1U')