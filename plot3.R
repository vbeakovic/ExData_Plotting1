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
png("plot3.png", width = 480, height = 480)
with(epc_subset, {
        plot(date_time, sub_metering_1, col = "black", type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(date_time, sub_metering_2, col = "red")
        lines(date_time, sub_metering_3, col = "blue")
        legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()



