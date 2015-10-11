# Reading data - The data is not by default in the repo (too heavy), it needs to be added
c1<-read.table("household_power_consumption.txt", sep=";", header = TRUE,na.strings ="?")

# Subsetting
ds = c("1/2/2007", "2/2/2007")
d1 <- c1[is.element(c1$Date, ds),]
gap <- d1$Global_active_power

# Formatting datetimes
d1$Date <- as.Date(d1$Date, format = "%d/%m/%Y")  
times <- paste(d1$Date, d1$Time)
formatted_times <- strptime(times, format = "%Y-%m-%d %H:%M:%S")  

# Building the plot
png("plot2.png", width = 480, height = 480)
plot(formatted_times, gap, type = "l", xlabel= "", ylabel = "Global Active Power (kilowatts)")
dev.off()