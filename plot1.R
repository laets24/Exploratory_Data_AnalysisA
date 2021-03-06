#ASSIGNMENT : EXPLORATORY DATA ANALYSIS
#-----------------------------------------

#Loading the data from 2007-02-01 to 2007-02-01

setwd("//baal/fldredir$/ldesousa/Mes documents/Perso/Coursera/Course4/Week1")
file<- file("household_power_consumption.txt")

DataPower<- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),
                   col.names = c("Date", "Time", "Global_active_power", 
                   "Global_reactive_power", "Voltage", "Global_intensity", 
                   "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                    sep = ";", header = TRUE)


#Converting Date and Time in the right format
library(lubridate)
DataPower$Dateconvert<-strptime(DataPower$Date,format="%d/%m/%Y")
DataPower$Timeconvert<-as.POSIXlt(DataPower$Time)


# Plot 1
#----------------------
png(filename='plot1.png', width=480, height=480, units='px') 
hist(DataPower$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)") 
dev.off() 


