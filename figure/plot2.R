plot2 <- function() {
    ## read the file in, and subset to the two days used for the plots
    dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses="character")
    dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## change the plotting column to numeric
    gap <- as.numeric(dat$Global_active_power)
    
    ## get the date/time values
    time <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
    
    ## open a png device, plot, and close
    png(filename = "plot2.png")
    plot (time, gap, type = "l", ylab = "Global Active Power (killowatts)", xlab = "")
    dev.off()
}