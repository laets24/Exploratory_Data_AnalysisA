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
DataPower$DateTime<-dmy(DataPower$Date)+hms(DataPower$Time)


#--------------------------------------------
# Plot 3

png(filename='plot3.png', width=480, height=480, units='px') 
plot(DataPower$DateTime,DataPower$Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering') 
lines(DataPower$DateTime,DataPower$Sub_metering_2,type='l',col='red') 
lines(DataPower$DateTime,DataPower$Sub_metering_3,type='l',col='blue') 

legend ('topright', col=c('black','red','blue'), 
        legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),  lty=c(1, 1, 1))

dev.off() 



