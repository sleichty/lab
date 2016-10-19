#Clean up a data file so it is more useable  

#First, read it in to make it a dataframe with one header
#Select the line with the most useful information 
header_weather<-scan("weather.txt", skip = 1, nlines = 1, what = character(), sep = "\t")
#Select all the data
weather<-read.table("weather.txt", skip = 4, na.strings = "?", sep = "\t", stringsAsFactors = FALSE)
#Put the header and the data together
names(weather)<-header_weather

#Lets just work with time, total rainfall, total solar radiation, max air temp, and min air temp -- select these columns

weather[,c("TIMESTAMP", "Rain_in_Tot", "SlrMJ_Tot", "AirTF_Max", "AirTF_Min")]
cleandata<-weather
#Give the column new names -- "date", "total_rain_in", "total_rad_MJ", "max_temp_F", "min_temp_F"
colnames(cleandata)<-c("date", "total_rain_in", "total_rad_MJ", "max_temp_F", "min_temp_F")
head(cleandata)
#Filter the data to make sure you have reasonable values
  #Between 0 and 6 for total rain
  #Between 30 and 70 for total radiation
  #Between -50 and -10 for both temps
  #max temp cannot be lower than min temp

#Create a rain column in millimeters and temperature columns in degrees C

#Create a column which labels anything before Sept 22 as "summer" and Sept 22 and after as "autumn" 

#Now get the date column to read as a date in R  

#Make a few simple plots of your data to see if it looks okay and everything is the right class

#Write the data to a .csv to share with your collaborator
write.csv(clean, file="2016 weather.csv", row.names=FALSE, quote=FALSE)

