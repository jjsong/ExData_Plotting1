# Plot3

# style(date, time) arranged
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Read data 
houseData <- read.table('./data/household_power_consumption.txt',
                        sep=';', header=T, 
                        colClasses = c('character', 'character', 'numeric',
                                       'numeric', 'numeric', 'numeric', 
                                       'numeric', 'numeric', 'numeric'),
                        na.strings='?')


# reading and setting Date 
houseData$DateTime <- strptime(paste(houseData$Date, houseData$Time),
                               "%d/%m/%Y %H:%M:%S")

# subsetting the condition (2-day period)
houseData <- subset(houseData, as.Date(DateTime) >= as.Date("2007/02/01") & 
                            as.Date(DateTime) <= as.Date("2007/02/02"))




# open PNG file with 480x480
png("plot3.png", height=480, width=480)



plot(houseData$DateTime, houseData$Sub_metering_1, 
     pch=NA, xlab="", ylab="Energy sub metering")
lines(houseData$DateTime, houseData$Sub_metering_1)
lines(houseData$DateTime, houseData$Sub_metering_2, col="red")
lines(houseData$DateTime, houseData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))
       
# close PNG file
dev.off()


