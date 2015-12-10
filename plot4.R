#### Load libraries ####
library(dplyr)


#### Set locale to English (my default is Croatian) ####
Sys.setlocale("LC_ALL", "en_GB.UTF-8")

#### Unzip data file ####
if (!file.exists("data/household_power_consumption.txt")) {
        unzip("data/exdata_data_household_power_consumption.zip", exdir = "data")   
}

### Read in data ####
electric_power_consumption <- read.table("data/household_power_consumption.txt", 
                                         sep = ";", na.strings = "?", 
                                         stringsAsFactors = FALSE, 
                                         header = TRUE)

#### Tidy and format data ####
electric_power_consumption$Time <- as.POSIXct(strptime(
        paste(electric_power_consumption$Date, electric_power_consumption$Time), 
        "%d/%m/%Y %H:%M:%S"))  

# Date variable not neccessary since it is now containted in the Time variable
electric_power_consumption$Date <- NULL

# rename time variable
electric_power_consumption <- rename(electric_power_consumption, 
                                     date_time = Time)

# variable names to lower case (this is my style...)
names(electric_power_consumption) <- tolower(names(electric_power_consumption))


#### Subset Electric Power Consumption Data ####
epc_subset <- filter(electric_power_consumption, 
                     date_time >= as.POSIXct("2007-02-01 00:00:00") 
                     & date_time < as.POSIXct("2007-02-03 00:00:00"))


#### Plot subsetted data to png file ####
png("plot4.png", width = 480, height = 480)
# two rows to columns
par(mfrow = c(2,2))
# Global Active Power
with(epc_subset, plot(date_time, global_active_power, type = "l", 
                      ylab = "Global Active Power", 
                      xlab = ""))
# Voltage
with(epc_subset, plot(date_time, voltage, type = "l", 
                      ylab = "Voltage", 
                      xlab = "datetime"))
# Energy sub metering
with(epc_subset, {
        plot(date_time, sub_metering_1, col = "black", type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(date_time, sub_metering_2, col = "red")
        lines(date_time, sub_metering_3, col = "blue")
        legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "n")
})
# Global reactive power
with(epc_subset, plot(date_time, global_reactive_power, type = "l", 
                      ylab = "Global_reactive_power", 
                      xlab = "datetime"))
dev.off()