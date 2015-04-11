#
# Exploratory Data Analysis Project 1 graph 3
#
# setwd("~/Bob/ExploratoryAnalysis")
# df <- read.csv("household_power_consumption.txt", 
#  header = TRUE, sep = ";", na.strings = "?")
#
# now subset for the two days
# create a date-time column, like: tm <- as.POSIXlt(paste("2013-07-24", " 23:55:26"))
#
# PLOT 3 
#
td <- df[ df$Date == "1/2/2007" , ]
td <- rbind(td, df[ df$Date == "2/2/2007" , ])
td$datetime <- 
  as.POSIXct(paste(as.Date(td$Date, format = "%d/%m/%Y" ), td$Time))
# set parameters for each plot
par(bg="white")
par(mfrow = c(1,1))
# set up plot, then add 3 lines
#
with (td,   plot(  datetime, Sub_metering_1, type="n", pch = ".", col="black", ylab="Energy sub metering"))  
with (td, points(  datetime, Sub_metering_1, type="o", pch = ".", col="black")) 
with (td, points (  datetime, Sub_metering_2, type="o", pch = ".", col="red"))
with (td, points (  datetime, Sub_metering_3, type="o", pch = ".", col="blue"))
legend("topright", pch =NA, lwd=1, col = c("black","red","blue"), 
         legend = c("Submetering1", "Submetering2", "Submetering3"))


## copy to png file
dev.copy(png, file = "plot3.png")
## close the PNG device
dev.off()
  

