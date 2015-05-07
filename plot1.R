##Reading and subsetting the data

power<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)
power<-transform(power,datetime=interaction(power$Date,power$Time,sep=' '))
times<-strptime(power$datetime,"%d/%m/%Y %H:%M:%S")
power$datetime=times
power<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]

##Plotting
hist(power$Global_active_power,col="orange",main = "Global Active Power")
