#### Load libraries ####
library(dplyr)


#### Set locale to English (default is Croatian) ####
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
png("plot2.png", width = 480, height = 480)
with(epc_subset, plot(date_time, global_active_power, type = "l", 
                      ylab = "Global Active Power (kilowatts)", 
                      xlab = ""))
dev.off()



