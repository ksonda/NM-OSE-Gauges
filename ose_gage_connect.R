##########################
# Purpose: Link features in OSE_Gauges.zip to Gage landing pages at meas.ose.state.nm.us
# Author: Kyle Onda
#
#
##########################


# Load libraries
################
library(httr)
library(xml2)
library(sf)


# Import data
unzip ("data/OSE_Gauges.zip", exdir="data")
gages <- read_sf("data/OSE_Gauges/NM2015_Gauges_OSE.shp")

# Parse website
url <- 