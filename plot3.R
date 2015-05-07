##Reading and subsetting the data

power<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)
power<-transform(power,datetime=interaction(power$Date,power$Time,sep=' '))
times<-strptime(power$datetime,"%d/%m/%Y %H:%M:%S")
power$datetime=times
power<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]

##Plotting
with(power, plot(datetime, Sub_metering_1,"l",xlab="",ylab="Energy sub metering"))
with(power,lines(datetime,Sub_metering_2,col="orange"))
with(power,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","orange","blue"),lty=1)