## plot2.R

## Read the source data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

## Combine Date and Time columns into one new column DateTime
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

## Subset the data as we only want to examine how household energy usage varies between 1 and 2 Feb 2007
power <- subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) <= "2007-02-02")

## Plot 2: Plot type "l" for Line
plot(power$DateTime,
     power$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

## Saves data to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()