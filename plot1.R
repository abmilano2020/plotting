### load library 
library(lubridate)
### load data
dati = read.csv("household_power_consumption.txt", header = TRUE,
                sep = ";", dec = ".")[-c(1:66636,69517:2075259),]
### modify data
dati$Date = dmy(dati$Date)
dati$Global_active_power = as.numeric(dati$Global_active_power)
### create png 
png("plot1.png", width = 480, height = 480)
### PNG 1
par("mar" = c(4,4,2,1), cex.lab = 0.8, cex.main = 0.9)
hist(dati$Global_active_power,
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
axis(2, at = seq(0,1200,200), labels= seq(0,1200,200))
### save png
dev.off()  