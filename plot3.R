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

# Plot a line graph of Date vs each sub metering energy
png("plot3.png")
plot(datos2$Date, datos$Sub_metering_1, type="line", xlab = "", ylab="Energy sub metering")
lines(datos2$Date, datos2$Sub_metering_2, col = "red")
lines(datos2$Date, datos2$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
dev.off()

