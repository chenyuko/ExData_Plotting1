#load data
setwd("C:\\Users\\Yoyo\\Documents\\coursera\\Exploratory_data")
house_power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, na.strings = "?")
house_power$Date=as.Date(house_power$Date,format="%d/%m/%Y")
house_power1=subset(house_power,Date=="2007-02-01"|Date=="2007-02-02")
house_power1[,3]=as.numeric(house_power1[,3])

#convert date and time
house_power1$datetime <- strptime(paste(house_power1$Date, house_power1$Time), "%Y-%m-%d %H:%M:%S") #POSIXlt
house_power1$datetime <- as.POSIXct(house_power1$datetime)
#plot
attach(house_power1)
plot(house_power1$Global_active_power ~ house_power1$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#save in png
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()
