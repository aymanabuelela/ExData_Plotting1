# Loading data
con <- file("household_power_consumption.txt")
open(con)
cols <- read.table(con, nrow = 1, sep = ";", header = T)
datos <- read.table(con, skip = 66636, nrow = 2880, sep = ";", na.strings="?")
close(con)
colnames(datos) <- colnames(cols)

#Convert Date and Time volumns into Date/Time class
datetime <- paste (datos$Date, datos$Time)
Date <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
datos2 <- cbind(Date, datos[,3:9])

# Plot 4 plots
png("plot4.png")
par(mfcol=c(2,2))

#plot 1
with(datos2, plot(Date, Global_active_power, type = "line",xlab = "", ylab = "Global Active Power (kilowatts)"))

#plot2
plot(datos2$Date, datos$Sub_metering_1, type="line", xlab = "", ylab="Energy sub metering")
lines(datos2$Date, datos2$Sub_metering_2, col = "red")
lines(datos2$Date, datos2$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)

#plot3
plot(datos2$Date, datos2$Voltage, type = "line", xlab = "datetime", ylab = "Voltage")

#plot4
plot(datos2$Date, datos2$Global_reactive_power, type = "line", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

