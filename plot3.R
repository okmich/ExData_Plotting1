filename <-  "household_power_consumption.txt"
#read file into dat
dat <- read.delim(filename, sep=";", colClasses=c(rep(character(), 2), rep(numeric(), 7)), na.strings="?")
#subset dat by the dates 2/2/2007' and '1/2/2007'
dat <- dat[which(dat$Date == '1/2/2007' | dat$Date == '2/2/2007'),]
#create a new column called datetime 
dat <- cbind(dat, datetime=strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
png(filename="plot3.png")
#plot the line graphs
plot(dat$Sub_metering_1~dat$datetime, type='l', col='black', ylab="Energy sub metering", xlab=" ")
#plot the line for the other two 
lines(dat$Sub_metering_2~dat$datetime, type='l', col='red')
lines(dat$Sub_metering_3~dat$datetime, type='l', col='blue')
#add the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
dev.off()