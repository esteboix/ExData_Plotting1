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

## PLOT 2
png(filename = "plot2.png", width = 480, height = 480)
plot(x = data$datetime, y = data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
