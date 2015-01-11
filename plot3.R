all_data <- read.csv("../../household_power_consumption.txt", header = TRUE, sep = ";")
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
library(chron)
all_data$Time <- times(all_data$Time)
data1 <- all_data[(all_data$Date == as.Date("2007-02-01")),]
data2 <- all_data[(all_data$Date == as.Date("2007-02-02")),]
data <- rbind(data1, data2)

png(filename = "plot3.png", width = 480, height = 480)

plot(as.POSIXct(strptime(paste(as.character(data$Date), " ", as.character(data$Time)), format = "%Y-%m-%d %H:%M:%S", tz = "")), as.numeric(as.character(data$Sub_metering_1)), type = "l", ylab = "Energy Sub Metering", xlab = "", col = "black")

points(as.POSIXct(strptime(paste(as.character(data$Date), " ", as.character(data$Time)), format = "%Y-%m-%d %H:%M:%S", tz = "")), as.numeric(as.character(data$Sub_metering_2)), type = "l", col = "red")

points(as.POSIXct(strptime(paste(as.character(data$Date), " ", as.character(data$Time)), format = "%Y-%m-%d %H:%M:%S", tz = "")), as.numeric(as.character(data$Sub_metering_3)), type = "l", col = "blue")

legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
