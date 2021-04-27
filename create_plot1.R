library(data.table)
library(lubridate)
library(dplyr)

#read data
data_electric_power <- fread("household_power_consumption.txt")
names(data_electric_power) <- tolower(names(data_electric_power))

#subset
data_plot1 <- data_electric_power %>% 
    filter(date == "1/2/2007"  | date == "2/2/2007"  ) %>% 
    mutate(global_active_power = as.numeric(global_active_power))

png(filename="plot1.png", width=700,height=700)
hist(data_plot1$global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
)
dev.off ()
