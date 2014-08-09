plot3 <- function() {
    ## read the file in, and subset to the two days used for the plots
    dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses="character")
    dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## change the plotting column to numeric
    sm1 = as.numeric(dat$Sub_metering_1)
    sm2 = as.numeric(dat$Sub_metering_2)
    sm3 <- as.numeric(dat$Sub_metering_3)
    
    ## get the date/time values
    time <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
    
    ## open a png device, plot, and close
    png(filename = "plot3.png")
    plot (test, sm1, type = 'l', ylim=c(0.0, 40.0), xlab="", ylab="Energy sub metering")
    par(new = T)
    plot(test, sm2, type='l', col='red', ylim=c(0.0, 40.0), xlab="", ylab="")
    par(new = T)
    plot(test, sm3, type='l', col='blue', ylim=c(0.0, 40.0), xlab="", ylab="")
    legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
    dev.off()
}