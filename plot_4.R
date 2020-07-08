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
par(mfrow=c(2,2))
with(subset,{
  plot(Global_active_power~Datetime,xlab="",ylab = "Global Active Power",type="l")
  plot(x=Datetime,y=Sub_metering_1,ylab = "Energy sub meeting",type="l",xlab = "")
  lines(x=Datetime,y=Sub_metering_2,col="red")
  lines(x=Datetime,y=Sub_metering_3,col="blue")
  plot(Voltage~Datetime,ylab="Voltage",type="l")
  plot(Global_reactive_power~Datetime,ylab = "global_reactive_power",type="l")
})
dev.copy(png,file="plot_4.png")
dev.off()
