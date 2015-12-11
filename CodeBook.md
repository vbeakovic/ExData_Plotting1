# Exploratory Data Analysis - Course Project 1

## Introduction
The final dataset of this project was created by tidying and subsetting the source data set from the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, the "Individual household
electric power consumption Data Set" is used.

## About the source data
The data contains measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.

## Variables in the source dataset

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Files used to import data, after extraction from the zip file
* data/household_power_consumption.txt


## Transformations
The final data set was obtained by reading in the source dataset. Date and Time varibales were merged into one POSIXct variable. The colum with date and time has been
renamed to date_time. To conform with tidy dataset principles the Date column has been removed since the date info is now in the date_time variable.
After tidying the data has been subsetted, the final dataset contains Electric Power Consumption for two days in February 2007. (from 01.02.2007 to 02.02.2007)
The subsetted data have been used to produce the plots.



## Data types
* date_time - POSIXct
* global_active_power - numeric
* global_reactive_power - numeric
* voltage - numeric
* global_intensity - numeric
* Sub_metering_1 - numeric
* Sub_metering_2 - numeric
* Sub_metering_3 - numeric


## Acknowledgements
This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>








