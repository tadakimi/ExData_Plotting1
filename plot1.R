#Assgnment1, Wk1, Tadakimi Tomita
file.size("./household_power_consumption.txt") #check the file size
#size is about 133MB

#read text file, specify separator and NA
epower <- read.table("./household_power_consumption.txt", 
                     sep = ";", 
                     na.strings = "?", 
                     header = TRUE, 
                     stringsAsFactors = FALSE)

#subset 2/1/2007 or 2/2/2007 only
epower.trim <- subset(epower, 
                      epower$Date == "2/1/2007" | epower$Date == "2/2/2007")

#convert from character to Date format
epower.trim$Date <- as.Date(epower.trim$Date, "%m/%d/%Y")
#convert from character to time format
epower.trim$Time <- strptime(epower.trim$Time, "%H:%M:%S")

#draw plot2.R histogram
hist(epower.trim$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
#copy plot to file device and save file as 480x480 png image
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off() #close the device