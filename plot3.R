## Optional code to set the working directory and install the lubridate package
## setwd("your_directory")
## install.packages("lubridate)

## First we load the lubridate and read the data
library(lubridate)
variables <- t(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
data <- read.table ("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", na.strings = "?", col.names = variables)

## We then convert the date and time variables to date and time and combine them in a single variable
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$datetime <- data$Date+data$Time

## PLOT 3
png(filename = "plot3.png", width = 480, height = 480)
with(data, {
  plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
