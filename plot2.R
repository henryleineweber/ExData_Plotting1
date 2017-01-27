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
date <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(date, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
