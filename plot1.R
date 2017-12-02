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

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()




