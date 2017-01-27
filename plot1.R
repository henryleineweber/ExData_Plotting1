# Set working directory, download data, and extract files to directory
setwd("./Week 1 Project")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip("data.zip")

# Read data into R
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# Subset dates
subset.data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Generate histogram
plot1 <- as.numeric(subset.data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
