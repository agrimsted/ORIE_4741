
## Citibike Trip Duration: Midterm Report
#### Allison Grimsted, Callie Busch Jasmine Ng.


### About the Dataset:
We used the CitiBike data from [CitiBikeNYC.com.](https://s3.amazonaws.com/tripdata/index.html) The data was downloadable by month. Each of the twelve datasets had 1 to 4 million rows, so using the entire population of rides over the year 2018 would yield a dataset too large to manipulate on a PC. We instead took a random sample of 50,000 rows from each month’s dataset and appended them together to build the final dataset with 600,000 rows. Since the data doesn’t have a field for customer ID, selecting a random sample of rows helps to ensure that the sample was representative of all rides and users.  

The following features were extracted from CitiBike data: 
* **Trip_duration** is the dependent variable. It is a nonnegative real number where the time is measured in seconds. 
* **Start_month** is a nominal feature with numbers from 1-12. This feature is nominal as opposed to numerical because the relationship between months is not linear; the seasons are cyclical. We plan to test both categorical treatments and quadratic numerical treatments of this variable. 
* **Start_hour** is an integer from 0-23. We tested encoding start_hour as nominal and the test mean square error increased by .005%. 
* **Start_station_id** is a nominal value and it is the geographic feature of our model. 
* **User_type** is a binary variable. The user is either a customer or a subscriber. 
* **Birth_year** is an integer between 1918 and 2002; it denotes the year in which the user was born. 
* **Gender** is a nominal variable because the three options are male, female, and unspecified. 
* **Week_day** was added using the Dates package in Julia. This was encoded as a nominal variable because we believe that weekend days will correlate with different behavior than weekdays. The difference between these days will not be linear.


We temporarily added the zipcode of the starting station to be able to join external data to the sets. Using the longitude and latitude of the starting station, we used Google’s Geocoding API to reverse geocode the coordinates. We extracted the zipcode from the address returned. This allows us to add weather data. 
Weather data was added from Weather Source, which collects weather data from local weather stations since 2000. To find this data and join it with current data we used DataTiles, a product of the new start up, Nitrogen.ai. DataTiles supports uploading of data sets to find external data signals that correlate with the data uploaded. All weather data is nonnegative real numbers. The features from Weather Source are aggregated as specified in the feature name by the day. We added the following features from Weather Source:
* **total_precipitation_inches**
* **average_temperature_farenheit**
* **total_snowfall_inches**

After one hot encoding all the features, we had 803 features and an offset. 

### Cleaning & Unreliable Data
* All variables were cast to their appropriate type; categorical variables like gender were one-hot encoded. 
* 3 starting longitudes and latitudes did not align with locations in New York City, so those points were discarded because it was impossible to find the actual location. 
* There were some entries with birth years before 1918, which we thought seemed implausible. Since a user who would lie about their age on the sign-up form may lie about other demographic data, we decided these trips were unreliable, and removed these rows from the dataset. 
Overall, we removed 2,220 rows out of 600,000. 


### Exploratory Analysis & Visualisations

This histogram shows the distribution of trip duration in seconds, our response. Most of the trip durations are under 2000 seconds.

We created a box plot for each group of month in the year. We see that the shape is like a bell curve that peaks at the month of June (or in this graph, 6). We also see less variability in colder months. 


This histogram shows the distribution of trip duration in seconds, our response. Most of the trip durations are under 2000 seconds.
![p2.png](Midterm_Viz/p2.png) 
We created a box plot for each group of month in the year. We see that the shape is like a bell curve that peaks at the month of June (or in this graph, 6). We also see less variability in colder months. 
![p4.png](Midterm_Viz/p4.png)
This scatterplot shows the relationship between the total precipitation in a day (in inches) and trip duration. There is a fan pattern, so we need to perform a log transformation in the future. (This plot excludes high outliers for trip duration for readability.) Generally, users are more likely to have longer bike rides when there isn’t precipitation. 
![p5.png](Midterm_Viz/p5.png)

### First Models 
We first trained a basic linear regression on the weather and Citibike features with one hot encoding for nominal features. We used a simple train and test split. We scrambled the data and assigned the first 80% to the training set. The training set had an error of 2.33e8 and the test set had an error of 2.01e8. 

We have two hypothesis regarding why our current error rates are so large:
1. Response outliers. If a trip_duration outlier (say the ride lasts over 1 million seconds, which does occur in our dataset) is fit by our regression, it will slightly skew our predictor weights because our current loss function in quadratic. Likewise, if a trip_duration outlier is added to the test set, its predicted value could be millions of seconds off. This balloons our MSE. 
2. Our numerical variables like precipitation and hour have not been optimally transformed. 


### Validation and Next Steps

* Next, we plan to transform covariates that do not have a linear relationship with trip duration. For example, we see in the trip duration over various temperatures graph and the trip duration over precipitation graph that trip duration has a fan shaped relationship with the weather features. 
* Evaluate models using k-fold cross validation to ensure success of a model is not simply due to one random train/test split. 
* Monitor for overfitting by evaluating the training and test error rate for each model we build, and ensuring that they are similar. We will also continue to remove features with low significance. 
* Monitor underfitting by minimizing test set error as we continue to transform the data to minimize the test set error throughout the development of the rest of the project. 

