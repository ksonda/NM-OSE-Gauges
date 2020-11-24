##########################
# Purpose: Link features in OSE_Gauges.zip to Gage landing pages at meas.ose.state.nm.us
##########################


# Load libraries
################
library(httr)
library(xml2)
library(sf)
library(dplyr)
library(fuzzyjoin)

#Make link scrape function
##########################################
scrapelinks <- function(url){
  # Create an html document from the url
  webpage <- xml2::read_html(url)
  # Extract the URLs
  url_ <- webpage %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  # Extract the link text
  link_ <- webpage %>%
    rvest::html_nodes("a") %>%
    rvest::html_text()
  return(tibble(link = link_, url = url_))
}
############################################

# Import data
unzip ("data/OSE_Gauges.zip", exdir="data")
gages <- sf::read_sf("data/OSE_Gauges/NM2015_Gauges_OSE.shp")
districts <- sf::read_sf("data/OSE_District_Boundary-shp/OSE_Districts.shp")
# Parse website into table of gauge names and landing page URLs
links <- scrapelinks(url)
links <- links %>% filter(substr(url,1,5)=="site.") %>%
  mutate(url = paste0(.GlobalEnv$url,url)) %>%
  mutate(link = gsub("\r\n","",link)) %>%
  mutate(link = gsub(" ","",link))

#
links$name <- links$link
gages$name <- gages$Gauge_name
gages <- filter(gages,!is.na(name))
gages$geometry<-NULL
Test <- stringdist_left_join(links,gages,by="name",method="soundex")
