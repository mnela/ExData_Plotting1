#name file we are using
file <-"household_power_consumption.txt"
#mysql script to select Feb 1&2 dates
mySql <- "SELECT * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'"
#load and require sql in R
library(sqldf)
require(sqldf)
#read in selected data
data <- read.csv2.sql(file, mySql)
#make data and time POSIX instead of characters
dateTime <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")

#open print devide png size to 480
png ("plot3.png", 480, 480)
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = 
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
