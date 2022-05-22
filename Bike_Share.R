########### Packages required
library(tidyverse)
library(lubridate)
library(ggplot2)
library(readxl)
library(skimr)

getwd()
setwd("./Case Study Bike/divvy-tripdata(JAN-DEC_2021)")

# Get the paths to each file:
files <- list.files(
  path = ".",
  pattern = ".xlsx",
  full.names = TRUE)

files

# read the files
files <- lapply(files, function(i){x=read_xlsx(i,sheet=1)
  x})

#combine files
all_trips=do.call("rbind.data.frame",files)


#remove unwanted col
all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng))

#issue in ride length so recalculate
all_trips <- all_trips %>%  
  select(-c(ride_length,day_of_week))
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)

#info about new data
colnames(all_trips)  #List of column names
nrow(all_trips)  #no of rows in data frame
dim(all_trips)  #Dimensions of the data frame
head(all_trips)  #the first 6 rows of data frame.
str(all_trips)  #ist of columns and data types
summary(all_trips)  #Statistical summary of data. Mainly for numerics


#add cols
all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)

#skim data
all_trips_v2 <- all_trips[!(all_trips$ride_length<0),]


#basic EDA
summary(all_trips_v2$ride_length)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)

aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

# analyze ridership data by type and weekday
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  
  group_by(member_casual, weekday) %>%  
  summarise(number_of_rides = n()							
            ,average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday)				

all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")

all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

aggregate(all_trips_v2$ride_length ~ all_trips_v2$rideable_type+all_trips_v2$member_casual+all_trips_v2$day_of_week, FUN = mean)

counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
counts
#download as excel for further analysis

write.csv(all_trips_v2, "cleaned_bike_case_data.csv")
