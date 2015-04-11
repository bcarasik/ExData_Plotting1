#
# Exploratory Data Analysis Project 1 graph 1
#
# library(sqldf)
# setwd("~/Bob/ExploratoryAnalysis")
# df <- read.csv("household_power_consumption.txt", 
#  header = TRUE, sep = ";", na.strings = "?")
#
# now subset for the two days
#
# create a date-time column, like: tm <- as.POSIXlt(paste("2013-07-24", " 23:55:26"))
#
thedata <- df[ df$Date == "1/2/2007" , ]
thedata <- rbind(thedata, df[ df$Date == "2/2/2007" , ])
thedata$datetime <- 
  as.POSIXlt(paste(as.Date(thedata$Date, format = "%d/%m/%Y" ), thedata$Time))
# set parameters for each plot
par(bg="white")
par(mfrow = c(1,1))
with(thedata, hist( Global_active_power, xlab="Global Active Power (kilowatts)",
                     ylab = "Frequency", main = "Global Active Power", col = "red" ))
dev.copy(png, file = "plot1.png")
## Don't forget to close the PNG device!
dev.off()  

