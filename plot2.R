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

#draw plot2.R 
plot(epower.trim$Time, epower.trim$Global_active_power, 
     type = "l", #line graph
     ylab = "Global Active Power (kilowatts)",
     xlab = "" #no x label
)
#copy plot to file device and save file as 480x480 png image
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off() #close the device