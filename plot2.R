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

# Plot a line graph of Date vs. Global Active Power
png("plot2.png")
with(datos2, plot(Date, Global_active_power, type = "line",xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

