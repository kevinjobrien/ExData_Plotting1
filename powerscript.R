setwd("C:/Users/kobrien1/Desktop/datasciencecoursera/exploratory")
download.file(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,power.zip)
unzip(power.zip)
power<-read.csv("household_power_consumption.txt", sep = ";")
power$datetime<-strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
powerfeb<-subset(power, power$datetime < "2007-02-03" & power$datetime 
                 >= "2007-02-01")
powerfeb<-transform.data.frame(powerfeb, Global_active_power = as.numeric(Global_active_power), 
                               Voltage = as.numeric(Voltage), 
                               Global_intensity = as.numeric(Global_intensity), 
                               Sub_metering_1 = as.numeric(Sub_metering_1), 
                               Sub_metering_2 = as.numeric(Sub_metering_2), 
                               Sub_metering_3 = as.numeric(Sub_metering_3))
plot1<-function(){
        png(filename = "plot1.png")
        hist(powerfeb$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
}
plot2<-function(){
        png(filename = "plot2.png")
        plot(powerfeb$datetime, powerfeb$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        dev.off()   
}        
plot3<-function(){
        png(filename = "plot3.png")
        plot(powerfeb$datetime, powerfeb$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(powerfeb$datetime, powerfeb$Sub_metering_1, col = "black")
        lines(powerfeb$datetime, powerfeb$Sub_metering_2, col = "red")
        lines(powerfeb$datetime, powerfeb$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), lwd = c(2.5,2.5), col = c("black","red","blue"))
        dev.off()
}
plot4<-function(){
        png(filename = "plot4.png")
        par(mfrow = c(2,2))
        plot(powerfeb$datetime,powerfeb$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
        plot(powerfeb$datetime,powerfeb$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
        plot(powerfeb$datetime, powerfeb$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(powerfeb$datetime, powerfeb$Sub_metering_1, col = "black")
        lines(powerfeb$datetime, powerfeb$Sub_metering_2, col = "red")
        lines(powerfeb$datetime, powerfeb$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill = c("black","red","blue"))
        plot(powerfeb$datetime,powerfeb$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
        dev.off()
}
