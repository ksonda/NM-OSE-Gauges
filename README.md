# NM OSE Gauges
 An activity to link OSE Gauge geospatial information to the New Mexico OSE/ISC Real-Time Water Measurement Information System

The purpose of this project is to link geospatial location information for the New Mexico Office of State Engineer stream gages to the New Mexico Office of the State Engineer/Interstate Stream Commission (OSE/ISC) [Real-Time Water Measurement Information System](http://meas.ose.state.nm.us/). This system links to real-time gage data from three sources:

1. Gage data managed by the NM Office of the State Engineer
1. USGS Gages
1. Colorado Department of Water Resources (CODWR) Gages.

The OSE/ISC has landing pages for each of the gages it publishes data directly for, and links out to the relevant USGS or CODWR data systems. This worlkflow will link the available geospatial dataset on the OSE/ISC gages to the OSE/ISC data landing pages. 

This will allow for the incorporation of these gages into the [Reference Gages](https://info.geoconnex.us/collections/gages) feature set as part of the Internet of Water [Geoconnex.us](https://geoconnex.us) system of linked environmental data. This will also improve the usefulness and discoverability of these data for the [New Mexico Water Data Initiative](https://newmexicowaterdata.org)


## Source data


An inventory of stream gages in New Mexico was conducted by the [Earth Data Analysis Center](https://edac.unm.edu/) as part of the [Stream Gage Analysis](https://nmflood.org/wp-content/uploads/2015/10/NM-Stream-Gage-Analysis.pdf) portion of the [NMFLOOD.org](https://nmflood.org) project in 2015. 

The dataset published for the OSE Gauges is a zipped shapefile in the `/data` directory.

## Script

The script `ose_gage_connect.R` parses the Real-Time Water Measurement Information System website for the names of all of the OSE Gauges and the landing pages they link to, and adds the landing page URLs to the correct record in the OSE_Gauges geospatial dataset. It exports a geojson version of the dataset to the file `OSE_Gauges_linked.geojson`



