all_data <- read.csv("../../household_power_consumption.txt", header = TRUE, sep = ";")
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
library(chron)
all_data$Time <- times(all_data$Time)
data1 <- all_data[(all_data$Date == as.Date("2007-02-01")),]
data2 <- all_data[(all_data$Date == as.Date("2007-02-02")),]
data <- rbind(data1, data2)

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(data$Global_active_power)), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
