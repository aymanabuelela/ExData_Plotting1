# Loading data
con <- file("household_power_consumption.txt")
open(con)
cols <- read.table(con, nrow = 1, sep = ";", header = T)
datos <- read.table(con, skip = 66636, nrow = 2880, sep = ";", na.strings="?")
close(con)
colnames(datos) <- colnames(cols)

# Plot a histogram of Global Active Power
png("plot1.png")
hist(datos$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

