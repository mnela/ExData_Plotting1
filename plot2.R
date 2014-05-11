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
png("plot2.png", 480, 480)
plot(data$Time, data$Global_active_power, ylab = "Global Active Power (kilowatts", xlab = "")
dev.off()