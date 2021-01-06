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

#### figure 2 ####
hhpc$Time_2<-make_datetime(year = year(hhpc$Date),month = month(hhpc$Date),day = day(hhpc$Date),
                           hour = hour(hhpc$Time),min =minute(hhpc$Time),sec = second(hhpc$Time))

png("Plot2.png", 480, 480)
plot(x = hhpc$Time_2, y=hhpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xaxt='n',xlab="")

daterange<-c(as.POSIXlt(min(hhpc$Time_2)), as.POSIXlt(max(hhpc$Time_2)+100))
axis.POSIXct(1,at=seq(daterange[1], daterange[2],by="day"),format="%A")
dev.off()
