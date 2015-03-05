filename <-  "household_power_consumption.txt"
#read file into dat
dat <- read.delim(filename, sep=";", colClasses=c(rep(character(), 2), rep(numeric(), 7)), na.strings="?")
#subset dat by the dates 2/2/2007' and '1/2/2007'
dat <- dat[which(dat$Date == '2/2/2007' | dat$Date == '1/2/2007'),]
png(filename="plot1.png")
#plot the histogram
hist(dat$Global_active_power, xlab = "Global active power (Kilowatts)",col = 'red', main = "Global Active Power", freq=T)

dev.off()