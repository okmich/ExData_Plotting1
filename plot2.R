filename <-  "household_power_consumption.txt"
#read file into dat
dat <- read.delim(filename, sep=";", colClasses=c(rep(character(), 2), rep(numeric(), 7)), na.strings="?")
#subset dat by the dates 2/2/2007' and '1/2/2007'
dat <- dat[which(dat$Date == '1/2/2007' | dat$Date == '2/2/2007'),]
#create a new column called datetime 
dat <- cbind(dat, datetime=strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
png(filename="plot2.png")
#plot the histogram
with(dat,
        plot(Global_active_power~datetime, type='l', ylab="Global active power (Kilowatts)", xlab=" "))

dev.off()