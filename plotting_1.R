## Data plotting ##
## using readr helps to import zip files
library(readr)
library(lubridate)
data<-read_csv2("exdata_data_household_power_consumption.zip")
data$Date
data$Date<-dmy(data$Date)
subset<-data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
plot_1<-hist(as.numeric(subset$Global_active_power),col="red",xlab = "Global Active Power (Kilowatts)",ylab="Frequency",Main="Global Active Power")
dev.copy(png,file="plot_1.png")
dev.off()
