# Set working directory, download data, and extract files to directory
setwd("./Week 1 Project")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip("data.zip")

# Read data into R
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# Subset dates
subset.data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Generate graph
power <- as.numeric(subset.data$Global_active_power)
reactive <- as.numeric(subset.data$Global_reactive_power)
voltage <- as.numeric(subset.data$Voltage)
date <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(subset.data$Sub_metering_1)
sub2 <- as.numeric(subset.data$Sub_metering_2)
sub3 <- as.numeric(subset.data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(date, power, type="l", xlab="", ylab="Global Active Power")
plot(date, voltage, type="l", xlab="", ylab="Voltage")
plot(date, sub1, type="l", ylab="Energy Submetering", xlab="")
  lines(date, sub2, type="l", col="red")
  lines(date, sub3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(date, reactive, type="l", xlab="", ylab="Global Reactive Power")

dev.off()
