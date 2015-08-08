## plot3.R

## Read the source data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

## Combine Date and Time columns into one new column DateTime
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

## Subset the data as we only want to examine how household energy usage varies between 1 and 2 Feb 2007
power <- subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) <= "2007-02-02")

## Plot 3, Add Black line for Sub_metering_1
plot(power$DateTime,
     power$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

## Add Blue line for Sub_metering_2 
lines(power$DateTime, power$Sub_metering_2, col="red")
## Add Blue line for Sub_metering_3
lines(power$DateTime, power$Sub_metering_3, col="blue")

## Add Legand for Sub_metering_1, Sub_metering_2 & Sub_metering_3
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saves data to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()