plot1 <- function() {
    ## read the file in, and subset to the two days used for the plots
    dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses="character")
    dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## change the plotting column to numeric
    gap <- as.numeric(dat$Global_active_power)
    
    ## open a png device, plot, and close
    png(filename = "plot1.png")
    hist(gap, col="red", xlab="Global Active Power (killowatts)", main = "Global Active Power")
    dev.off()
}