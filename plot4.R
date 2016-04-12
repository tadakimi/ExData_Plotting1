#Assgnment1, Wk1, Tadakimi Tomita
###Common operation
#read text file, specify separator and NA
epower <- read.table("./household_power_consumption.txt", 
                     sep = ";", na.strings = "?", 
                     header = TRUE, 
                     stringsAsFactors = FALSE
)

#subset 2/1/2007 or 2/2/2007 only
epower.trim <- subset(epower, 
                      epower$Date == "1/2/2007" | epower$Date == "2/2/2007")
#convert from character to time format
epower.trim$Time <- strptime(paste(epower.trim$Date, 
                                   epower.trim$Time), 
                             "%d/%m/%Y %H:%M:%S")

### draw plot 4
par(mfrow = c(2,2), mar = c(3.5, 4.5, 3, 1))
plot(epower.trim$Time, epower.trim$Global_active_power,
     type = "l", 
     ylab = "Global Active Power",
     xlab = "") #plot number one upper left
plot(epower.trim$Time, epower.trim$Voltage, #plot number 2, upper right
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(epower.trim$Time, epower.trim$Sub_metering_1, #plot number 3 lower left
     type = "l", #line graph
     ylab = "Energy sub metering",
     xlab = "" #no x label
    )
points(epower.trim$Time, epower.trim$Sub_metering_2, #add metering 2 as red line
       type = "l", col = "red")
points(epower.trim$Time, epower.trim$Sub_metering_3, #add metering 3 as red line
       type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), 
       col = c("black","red","blue"),
       y.intersp = 0.7,
       bty = "n") #add legend
plot(epower.trim$Time, epower.trim$Global_reactive_power,
     type = "l",
     xlab = "datetime"
    )
#copy plot to file device and save file as 480x480 png image
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off() #close the device