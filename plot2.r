# read the data from the file
data <- read.csv(file = "household_power_consumption.txt", sep = ";",
            na.strings = "?", stringsAsFactors = FALSE)

# convert the Date column from a character to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset the data based on the start and end dates
start <- as.Date("1/2/2007", format = "%d/%m/%Y")
end   <- as.Date("2/2/2007", format = "%d/%m/%Y")
data  <- subset(data, Date >= start & Date <= end)

# add a column for the formatted date/time
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))

# plot Global Active Power against Time
png("plot2.png", width = 480, height = 480)
plot(x = data$DateTime, y = data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()