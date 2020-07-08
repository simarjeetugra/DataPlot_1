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
with(subset,{
  plot(x=Datetime,y=Sub_metering_1,ylab = "Energy sub meeting",type="l",xlab = "")
  lines(x=Datetime,y=Sub_metering_2,col="red")
  lines(x=Datetime,y=Sub_metering_3,col="blue")
})
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot_3.png")
dev.off()
