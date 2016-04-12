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


###draw plot3.R
plot(epower.trim$Time, epower.trim$Sub_metering_1, 
     type = "l", #line graph
     ylab = "Energy sub metering",
     xlab = "", #no x label
     ylim = c(0, 40)
)
#add metering 2 as red line
points(epower.trim$Time, epower.trim$Sub_metering_2, 
       type = "l", col = "red")
#add metering 3 as red line
points(epower.trim$Time, epower.trim$Sub_metering_3, 
       type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), 
       col = c("black","red","blue"),
       y.intersp = 0.7,
       bty = "n") #add legend
#copy plot to file device and save file as 480x480 png image
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off() #close the device
