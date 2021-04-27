library(data.table)
library(lubridate)
library(dplyr)

#read data
data_electric_power <- fread("household_power_consumption.txt")
names(data_electric_power) <- tolower(names(data_electric_power))

#subset data
data_subset <- data_electric_power %>% 
    filter(date == "1/2/2007"  | date == "2/2/2007"  ) %>% 
    mutate(global_active_power = as.numeric(global_active_power))

#combine date_time
data_plot2 <- data_subset %>% 
    mutate(date_time = strptime(paste(date, time), format = "%d/%m/%Y %H:%M:%S"))



png(filename="plot2.png", width=700,height=700)
plot(
    data_plot2$date_time,
    data_plot2$global_active_power,
    type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = ""
)
dev.off ()
