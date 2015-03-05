filename <-  "household_power_consumption.txt"
#read file into dat
dat <- read.delim(filename, sep=";", colClasses=c(rep(character(), 2), rep(numeric(), 7)), na.strings="?")
#subset dat by the dates 2/2/2007' and '1/2/2007'
dat <- dat[which(dat$Date == '1/2/2007' | dat$Date == '2/2/2007'),]
#create a new column called datetime 
dat <- cbind(dat, datetime=strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
#store old device parameter
old.par <- par(no.readonly = FALSE)
png(filename="plot4.png")
par(mfrow=c(2,2))
#for cell (0,0)
plot(dat$Global_active_power~dat$datetime, type='l', ylab="Global active power (Kilowatts)", xlab=" ")
#for cell (0,1)
plot(dat$Voltage~dat$datetime, type='l', ylab="Voltage", xlab=" datetime ")
#for cell (1,0)
    #plot the line graphs
plot(dat$Sub_metering_1~dat$datetime, type='l', col='black', ylab="Energy sub metering", xlab=" ")
    #plot the line for the other two 
lines(dat$Sub_metering_2~dat$datetime, type='l', col='red')
lines(dat$Sub_metering_3~dat$datetime, type='l', col='blue')
    #add the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
#for cell (1,1)
plot(dat$Global_reactive_power~dat$datetime, type='l', ylab="Global_reactive_power", xlab=" datetime ")
dev.off()
#result parameters
par(old.par)