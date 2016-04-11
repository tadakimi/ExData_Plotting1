#Assgnment1, Wk1, Tadakimi Tomita
file.size("./household_power_consumption.txt") #check the file size
#size is about 133MB

#read text file, specify separator and NA
epower <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#subset 2/1/2007 or 2/2/2007 only
epower.trim <- subset(epower, 
                      epower$Date == "2/1/2007" | epower$Date == "2/2/2007")
epower.trim$Time
#convert from character to Date format
#epower.trim$Date <- as.Date(epower.trim$Date, "%m/%d/%Y")
#convert from character to time format
epower.trim$Time <- strptime(paste(epower.trim$Date, 
                                   epower.trim$Time), 
                             "%m/%d/%Y %H:%M:%S")

### draw plot 4
par(mfrow = c(2,2))
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
     xlab = "", #no x label
     ylim = c(0, 40)
)
points(epower.trim$Time, epower.trim$Sub_metering_2, #add metering 2 as red line
       type = "l", col = "red")
points(epower.trim$Time, epower.trim$Sub_metering_3, #add metering 3 as red line
       type = "l", col = "blue")
plot(epower.trim$Time, epower.trim$Global_reactive_power,
     type = "l",
     xlab = "datetime"
)
#copy plot to file device and save file as 480x480 png image
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off() #close the device