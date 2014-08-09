plot4 <- function() {
    ## read the file in, and subset to the two days used for the plots
    dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses="character")
    dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## change the plotting column to numeric
    gap <- as.numeric(dat$Global_active_power)
    voltage <- as.numeric(dat$Voltage)
    sm1 = as.numeric(dat$Sub_metering_1)
    sm2 = as.numeric(dat$Sub_metering_2)
    sm3 <- as.numeric(dat$Sub_metering_3)
    grp <- as.numeric(dat$Global_reactive_power)
    
    ## get the date/time values
    time <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
    
    ## open a png device, plot, and close
    png(filename = "plot4.png")
    par(mfrow = c(2,2))
    
    ## first chart
    plot (time, gap, type = "l", ylab = "Global Active Power", xlab = "")
    
    ## second chart
    plot (time, voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    
    ## third chart
    plot (time, sm1, type = 'l', ylim=c(0.0, 40.0), xlab="", ylab="Energy sub metering")
    par(new = T)
    plot(time, sm2, type='l', col='red', ylim=c(0.0, 40.0), xlab="", ylab="")
    par(new = T)
    plot(time, sm3, type='l', col='blue', ylim=c(0.0, 40.0), xlab="", ylab="")
    legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty = "n")
    par(new = F)
    
    ## fourth chart
    plot (time, grp, type="l", ylab="Global_reactive_power", xlab="datetime")
    
    dev.off()
}