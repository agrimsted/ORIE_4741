#Project Proposal 
##CitiBike Station Prediction
###Callie Busch, Allison Grimsted & Jasmine Ng 

###Context:
CitiBike is a bike share company in New York City with an average of 80,000 rides per day. A user pays to unlock a bike from a station, and returns it to an available station at the end of their trip. CitiBike loses bikes to theft and misplacement, at an alarming rate: during two weeks in September, CitiBike lost 1,946 bikes, leaving the company with about 9,112 active bikes. When CitiBike launched in 2013, its contract with the New York City government stipulated that they can have a monopoly on the bikeshare system through 2029 if CitiBike keeps an average of 12,000 bikes in service. Failing to combat bike theft could result in the company losing market exclusivity in NYC ([Source](https://bit.ly/2mJxpVg)).

###Question:
What is the expected duration of a CitiBike trip given covariates describing user profile, geography, and daily conditions at the start of the ride?

###Goal:
Using this analysis, we can flag bikes that are out of doc for significantly longer than our model predicts as potentially stolen. This will allow CitiBike to use preventative measures early-on before a bike goes missing. 

###Dataset:
We have a dataset of citybike logs in New York City for the year of 2018. There are 15 covariates: notably, bike check-out date and time, station location, and the user’s gender, subscription type, and age. Our response variable will be trip duration (seconds). Each csv file describes the bike log for a month of a year; therefore, we will concatenate 12 .csv files into one dataset for trips in 2018. This will be a considerably large dataset with about ten million rows. 

Our data was collected from Citibikenyc.com
https://s3.amazonaws.com/tripdata/index.html

We also plan on using the National Oceanic and Atmospheric Administration’s Climatological Data to add weather in New York City as a covariate and the Federal Bureau of Investigation's National Incident Reporting System for crime in the zipcode as a covariate. 

###Project Value:
We believe that predicting the expected duration of a Citibike trip would address issues around bike theft--which is a serious concern for most bike sharing companies. These companies are constantly trying to find ways to minimize the occurrences of bike theft and losses. Our analysis will allow companies like CitiBike to build a warning system or initiate extra security measures if it is known that a particular bike has significantly exceeded our predicted duration. 
