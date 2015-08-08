## plot1.R

## Read the source data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

## Combine Date and Time columns into one new column DateTime
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

## Subset the data as we only want to examine how household energy usage varies between 1 and 2 Feb 2007
power <- subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) <= "2007-02-02")

## Plot 1: Histogram of Frequency vs Global Active Power
hist(power$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

## Saves data to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()