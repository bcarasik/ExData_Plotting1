#
# Exploratory Data Analysis Project 1 graph 4
#
library(lattice)
# setwd("~/Bob/ExploratoryAnalysis")
# df <- read.csv("household_power_consumption.txt", 
#  header = TRUE, sep = ";", na.strings = "?")
#
# Plot 4, use lattice
#
# create a date-time column, like: tm <- as.POSIXlt(paste("2013-07-24", " 23:55:26"))
#
td <- df[ df$Date == "1/2/2007" , ]
td <- rbind(td, df[ df$Date == "2/2/2007" , ])
td$datetime <- 
  as.POSIXct(paste(as.Date(td$Date, format = "%d/%m/%Y" ), td$Time))
#
# set parameters for multiple panels
par(mfrow = c(2,2))
par(bg="white")
#
with ( td,  {
# 1,1 is same as plot 2
 plot(  datetime, Global_active_power, type="o", pch = ".",   xlab="", 
                 ylab="Global Active Power " )
# 1, 2 plots voltage
 plot(  datetime, Voltage, type="o", pch = ".", xlab = "datetime",  
                 ylab="Voltage" )
# 2,1 same as plot 3
 plot(  datetime, Sub_metering_1, type="n", pch = ".", col="black", xlab="", ylab="Energy sub metering")  
 points(  datetime, Sub_metering_1, type="o", pch = ".", col="black") 
 points (  datetime, Sub_metering_2, type="o", pch = ".", col="red")
 points (  datetime, Sub_metering_3, type="o", pch = ".", col="blue")
#
# 2,2 plots reactive power
 plot(  datetime, Global_reactive_power, type="o", pch = ".", xlab = "datetime")            
}
)
## copy to png file
dev.copy(png, file = "plot4.png")
## close the PNG device
dev.off()
  

