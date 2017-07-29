#load file
rm(list = ls())
setwd("C:\\Users\\Yoyo\\Documents\\coursera\\Exploratory_data")
house_power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, na.strings = "?")

#date convert
house_power$Date=as.Date(house_power$Date,format="%d/%m/%Y")
house_power1=subset(house_power,subset=(Date>="2007-02-01"& Date<="2007-02-02"))
house_power1$datetime<-strptime(paste(house_power1$Date,house_power1$Time),"%Y-%m-%d %H:%M:%S")
house_power1$datetime<-as.POSIXct(house_power1$datetime)

#plot
png("plot4.png",width=480, height=480)
p<-par()
par(mfrow=c(2,2))
#4-1
with(house_power1,hist(Global_active_power,col="red",main="Global_active_power",xlab="Global_active_power(kilowatts)"))
#4-2
attach(house_power1)
plot(Voltage~datetime,type="l")
#4-3
allrange<-range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))
plot(Sub_metering_2 ~ datetime,ylim=allrange,type="n",ylab = "Energy sub metering")
points(Sub_metering_1~datetime,type="l")
points(Sub_metering_2~datetime,type="l",col="red")
points(Sub_metering_3~datetime,type="l",col="blue")
legend("topright",lty = 1,,legend=c("Sub_meltering1","Sub_meltering2","Sub_meltering3")
       ,col=c("black","red","blue"))
#4-4
plot(Global_reactive_power~datetime,type="l")

detach(house_power1)
dev.off()
