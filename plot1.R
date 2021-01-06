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

#### figure 1 ####
png("Plot1.png", 480, 480)
hist(hhpc$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
