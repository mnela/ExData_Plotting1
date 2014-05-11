#get and read in appropriate data
file<-"household_power_consumption.txt"
library(sqldf)
require(sqldf)
mySql<-"SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv2.sql(file, mySql)

#adjust data so data can be read appropriately
datetime<- paste(data$Date, data$Time, sep = " ")
data$Time <- scrptime(datetime, "%d/%m/%Y %X")

#open plotting device and make plot
png("plot4.png", 480, 480)
par(mfrow = c(2, 2)) 
with(data, {
      plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
      plot(Time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
      plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_2, col = "red")
      lines(Time, Sub_metering_3, col = "blue")
      legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = 
                   c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Time, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
      
})     
dev.off()