#
# Exploratory Data Analysis Project 1 graph 2
#
library(sqldf)
# setwd("~/Bob/ExploratoryAnalysis")
# df <- read.csv("household_power_consumption.txt", 
#  header = TRUE, sep = ";", na.strings = "?")
#
# now subset for the two days
#
# create a date-time column, like: tm <- as.POSIXlt(paste("2013-07-24", " 23:55:26"))
#
td <- df[ df$Date == "1/2/2007" , ]
td <- rbind(td, df[ df$Date == "2/2/2007" , ])
td$datetime <- 
  as.POSIXct(paste(as.Date(td$Date, format = "%d/%m/%Y" ), td$Time))
# set parameters for each plot
par(bg="white")
par(mfrow = c(1,1))
with (td, plot(  datetime, Global_active_power, type="o", pch = ".", xlab = "time",  
                   ylab="Global Active Power (kilowatts)" ))
## copy to png file
dev.copy(png, file = "plot2.png")
## close the PNG device
dev.off()
  

