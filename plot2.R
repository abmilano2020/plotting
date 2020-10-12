### load library 
library(lubridate)
### load data
dati = read.csv("household_power_consumption.txt", header = TRUE,
                sep = ";", dec = ".")[-c(1:66636,69517:2075259),]
### modify data
dati$Date = dmy(dati$Date)
dati$Global_active_power = as.numeric(dati$Global_active_power)
### create png 
png("plot2.png", width = 480, height = 480)
### create plot
plot(dati$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     axes = FALSE)
axis(1, at = c(0,1440,2881), labels = c("Thu","Fri","Sat"),cex.axis=0.8)
axis(2, at = c(0,2,4,6), labels = c(0,2,4,6), cex.axis=0.8)
box()
### save png
dev.off()