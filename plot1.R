# Reading data - The data is not by default in the repo (too heavy), it needs to be added
c1<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings ="?")

# Subsetting
ds = c("1/2/2007", "2/2/2007")
d1 <- c1[is.element(c1$Date, ds),]

# Building the plot
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(d1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()