file<-"household_power_consumption.txt"
library(sqldf)
require(sqldf)
mySql<-"SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
class(mySql)
data <- read.csv2.sql(file, mySql)
png("plot1.png", 480, 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     col = "red")
dev.off()