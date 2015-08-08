## plot4.R

## Read the source data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

## Combine Date and Time columns into one new column DateTime
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

## Subset the data as we only want to examine how household energy usage varies between 1 and 2 Feb 2007
power <- subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) <= "2007-02-02")

## Set the 2 X 2 space
par(mfrow=c(2,2))

## Add Plot 1
plot(power$DateTime,
     power$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

## Add Plot 2
plot(power$DateTime,
     power$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

## Add Plot 3
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
legend("topright", col=c("black", "red", "blue"), lty = c(1,1), lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Add Plot 4
plot(power$DateTime,
     power$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


## Saves data to file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()