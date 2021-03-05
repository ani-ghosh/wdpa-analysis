library(terra)
library(raster)

# distance in terra!
r <- rast("data/wdparas_land_1km.tif")

# test area
e <- ext(c(19, 27, 6, 14))
r1 <- crop(r, e)
d1 <- distance(r1) # crashes R

# test raster
library(raster)
r2 <- raster(r1)
d2 <- distance(r2) # takes long time, didn't wait for it to finish