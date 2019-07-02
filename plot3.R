
#change locale to show week names in English
Sys.setlocale("LC_TIME", "English")

#read data
data <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

#create datetime column as Posixlt
data$datetime <- strptime(x = paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#select only rows from 01 feb 2007 and 02 feb 2007
selectedDates <- subset(data, as.Date(data$datetime) >= as.Date("2007-02-01") & as.Date(data$datetime) <= as.Date("2007-02-02"))

#create png with plot
png(filename="plot3.png", width=480, height=480, units="px")

with(selectedDates, plot(datetime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering"))
with(selectedDates, points(datetime, Sub_metering_2, col="red", type="l"))
with(selectedDates, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1)

dev.off()
