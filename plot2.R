library(tidyr)
library(tidyverse)
library(lubridate)

# Download and load the datasets

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileurl, destfile = "powerconsumption.zip")

unzip("powerconsumption.zip")

data <- read.csv2("household_power_consumption.txt")

# Subsetting the data

data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Create a DateTime Variable and Convert other columns from factor to numeric.

data2 <- data1 %>% 
  mutate(
    DateTime = dmy_hms(paste(Date, Time)),
    Global_active_power = as.numeric(as.character(Global_active_power)),
    Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
    Voltage = as.numeric(as.character(Voltage)),
    Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
    Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
    Sub_metering_3 = as.numeric(as.character(Sub_metering_3))
  )

# Creating Plot 2

glimpse(data2)

plot(type = "l", data2$DateTime, data2$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", width = 480, height = 480)

dev.off()
