### load library 
library(lubridate)
### load data
dati = read.csv("household_power_consumption.txt", header = TRUE,
                sep = ";", dec = ".")[-c(1:66636,69517:2075259),]
### modify data
dati$Date = dmy(dati$Date)
dati$Sub_metering_1 = as.numeric(dati$Sub_metering_1)
dati$Sub_metering_2 = as.numeric(dati$Sub_metering_2)
dati$Sub_metering_3 = as.numeric(dati$Sub_metering_3)
### create png 
png("plot3.png", width = 480, height = 480)
### create plot
plot(dati$Sub_metering_1, type = "n",
     ylab = "Energy sub metering",
     xlab = "",
     axes = FALSE)
lines(dati$Sub_metering_1, col = "black")
lines(dati$Sub_metering_2, col = "red")
lines(dati$Sub_metering_3, col = "blue")
axis(1, at = c(0,1440,2881), labels = c("Thu","Fri","Sat"),cex.axis=0.8)
axis(2, at = c(0,10,20,30), labels = c(0,10,20,30), cex.axis=0.8)
legend("topright", lty = c(1,1,1) , col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex =0.8)
box()
### save png
dev.off()