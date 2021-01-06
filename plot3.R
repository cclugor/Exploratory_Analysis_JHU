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


#### figure 3 ####
png("Plot3.png", 480, 480)
plot(hhpc$Time_2,hhpc$Sub_metering_1,type="l",ylab="Energy Sub metering",
     xaxt='n',xlab="")
lines(hhpc$Time_2,hhpc$Sub_metering_2,col="red")
lines(hhpc$Time_2,hhpc$Sub_metering_3,col="blue")
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")
legend("topright", legend=c("Sub metering 1", "Sub metering 2","Sub metering 3"),
       col=c("black", "red", "blue"), lty=5:1, cex=0.6)
dev.off()
