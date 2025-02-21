# Reading data - The data is not by default in the repo (too heavy), it needs to be added
c1<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings ="?")

# Subsetting
ds = c("1/2/2007", "2/2/2007")
d1 <- c1[is.element(c1$Date, ds),]

# Formatting datetimes
d1$Date <- as.Date(d1$Date, format = "%d/%m/%Y")  
times <- paste(d1$Date, d1$Time)
formatted_times <- strptime(times, format = "%Y-%m-%d %H:%M:%S")  

# Setting the format, with size and a transparent background as the example
png("plot3.png", width = 480, height = 480, bg = "transparent")

# Building the plot
plot(formatted_times, d1$Sub_metering_1, type = "l", xlab= "", ylab = "Energy sub metering", col = "black")
lines(formatted_times, d1$Sub_metering_2, col = "red")
lines(formatted_times, d1$Sub_metering_3, col = "blue")

# Adding a legend
legend("topright", lty=c(1,1), lwd=c(1,1), col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()