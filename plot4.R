# Read data:

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dim(data)  # 2075259 9, Ok
str(data)

# Only "2007-02-01" and "2007-02-02":

data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
dim(data)  # 2880 9, Ok: 24h * 60min * 2days

# Convert the Date and Time variables to Date/Time classes:

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
class(data$Date)  # "Date"
head(data$Date)   # "2007-02-01"...

data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
class(data$Time)  # "POSIXlt" "POSIXt"
head(data$Time)   # "2007-02-01 00:00:00 CET"...

# Check the variables:

summary(data)
View(data)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels:

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
  # 1
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  # 2
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  # 3
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
  # 4
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()




