# project 1 - Cindy Lugo ------------------------------------------------------------------
#### data libraries ####

library(tidyr)
library(dplyr)
library(readr)

#### data import ####
household_power_consumption <- read_delim("GitHub/Exploratory_Analysis_JHU/household_power_consumption.txt",";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"),Time = col_time(format = "%H:%M:%S")),trim_ws = TRUE)

#### data filtering ####
hhpc<-household_power_consumption%>%filter(Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
hhpc

hhpc$Time_2<-make_datetime(year = year(hhpc$Date),month = month(hhpc$Date),day = day(hhpc$Date),
                           hour = hour(hhpc$Time),min =minute(hhpc$Time),sec = second(hhpc$Time))

daterange<-c(as.POSIXlt(min(hhpc$Time_2)), as.POSIXlt(max(hhpc$Time_2)+100))


#### figure 4 ####

par(mfrow=c(2,2))

hist(hhpc$Global_active_power,col="red",main="",xlab = "Global Active Power (kilowatts)")


plot(x = hhpc$Time_2, y=hhpc$Voltage,type="l",
     xaxt='n',ylab="Voltage",xlab="datetime")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")


plot(hhpc$Time_2,hhpc$Sub_metering_1,type="l",ylab="Energy Sub metering",
     xaxt='n',xlab="")
lines(hhpc$Time_2,hhpc$Sub_metering_2,col="red")
lines(hhpc$Time_2,hhpc$Sub_metering_3,col="blue")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")


plot(x = hhpc$Time_2, y=hhpc$Global_reactive_power,type="l",
     xaxt='n',ylab="Global reactive power",xlab="datetime")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")



png("Plot4.png", 480, 480)
par(mfrow=c(2,2))

hist(hhpc$Global_active_power,col="red",main="",xlab = "Global Active Power (kilowatts)")


plot(x = hhpc$Time_2, y=hhpc$Voltage,type="l",
     xaxt='n',ylab="Voltage",xlab="datetime")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")


plot(hhpc$Time_2,hhpc$Sub_metering_1,type="l",ylab="Energy Sub metering",
     xaxt='n',xlab="")
lines(hhpc$Time_2,hhpc$Sub_metering_2,col="red")
lines(hhpc$Time_2,hhpc$Sub_metering_3,col="blue")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")


plot(x = hhpc$Time_2, y=hhpc$Global_reactive_power,type="l",
     xaxt='n',ylab="Global reactive power",xlab="datetime")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")
dev.off()
