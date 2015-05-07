##Reading and subsetting the data

power<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)
power<-transform(power,datetime=interaction(power$Date,power$Time,sep=' '))
times<-strptime(power$datetime,"%d/%m/%Y %H:%M:%S")
power$datetime=times
power<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]

##Plotting
par(mfrow = c(2, 2),cex=0.6,mar=c(4,4,2,4))

##Plot 1,2
with(power, {
        plot(datetime, Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")
        plot(datetime, Voltage,"l",xlab="Datetime",ylab="Voltage")
})
##Plot 3
with(power, plot(datetime, Sub_metering_1,"l",xlab="",ylab="Energy sub metering"))
with(power,lines(datetime,Sub_metering_2,col="orange"))
with(power,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","orange","blue"),lty=1)
##Plot 4
with(power, plot(datetime, Global_reactive_power,"l",xlab="Datetime"))