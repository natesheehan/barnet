library(pct)
library(tmap)
library(dplyr)
library(sf)
rnet = pct::get_pct_rnet(region = "london")
#Calculate road length
rnet$segment_length = as.numeric(sf::st_length(rnet))
#Calculate daily km's cycled
rnet$m_cycled_per_working_day = rnet$segment_length * rnet$bicycle

# Get road network for preselected region
zones = pct::get_pct_zones(region = "london")
zones = zones %>% filter(lad_name == "Barnet")

sf::write_sf(cycled_m_per_zone,"data/shapefile/barnet-roads.shp")
