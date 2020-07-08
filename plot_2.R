## Data plotting ##
## using readr helps to import zip files
library(readr)
library(lubridate)
data<-read_csv2("exdata_data_household_power_consumption.zip")
data$Date
data$Date<-dmy(data$Date)
subset<-data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
date_time<-paste(ymd(subset$Date),subset$Time)
subset$Datetime<-as.POSIXct(date_time)
with(subset,plot(x=Datetime,y=Global_active_power,type="l"),ylab="Global Active Power (Kilowatts)")
dev.copy(png,file="plot_2.png")
dev.off()
