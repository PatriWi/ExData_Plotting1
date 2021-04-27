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
data_plot3 <- data_subset %>% 
    mutate(date_time = strptime(paste(date, time), format = "%d/%m/%Y %H:%M:%S"))



png(filename="plot3.png", width=700,height=700)
plot(
    data_plot3$date_time,
    data_plot3$sub_metering_1,
    type = "n",
    ylab = "Energy sub metering",
    xlab = ""
)
with(data_plot3, lines(date_time, sub_metering_1))
with(data_plot3, lines(date_time, sub_metering_2, col = "red"))
with(data_plot3, lines(date_time, sub_metering_3, col = "blue"))
legend(
    x = "topright",
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1,
    col = c("black","red", "blue")
)
dev.off ()
