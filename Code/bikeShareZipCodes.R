#The following code reverse geocodes the longitude and latitude to an address, from which a zip code is extracted. 
#The zipcode is used to join the citibike trip data with weather data. 
#By Allison Grimsted
library(stringr)
locations <- data.frame(bike_share$start.station.longitude, bike_share$start.station.latitude)
uniqLocs <- unique(locations)
uniqLocs$zipCode <- integer(length(uniqLocs[,1]))
regexp <- "[[:digit:]]+"
for(i in 1:length(uniqLocs[,1])){
  address <- revgeocode(as.numeric(data.matrix((uniqLocs[i, 1:2]))))
  start_ind <- str_locate(address, ", NY ")[2]+1
  uniqLocs[i, 3] <- strtoi(str_sub(address, start_ind, start_ind+4))
}