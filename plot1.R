# read power consumption data from "household_power_consumption.txt" for February 1st 2007 - February 2nd 2007
read_power_consumption_data <- function() {
        power_consumption_all <- read.csv("household_power_consumption.txt", sep = ";", dec = '.', na.strings = "?")
        power_consumption_all$Time <- strptime(paste(power_consumption_all$Date, power_consumption_all$Time), "%d/%m/%Y %H:%M:%S")
        power_consumption_all$Date <- as.Date(power_consumption_all$Date, format = "%d/%m/%Y")
        power_consumption <- subset(power_consumption_all, Date >= "2007-02-01" & Date <= "2007-02-02")
        rm(power_consumption_all)
        power_consumption
}

create_png1 <- function() {
        png(file = "plot1.png", width = 480, height = 480, units = "px")
        power_consumption <- read_power_consumption_data()
        
        hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

        dev.off()
}