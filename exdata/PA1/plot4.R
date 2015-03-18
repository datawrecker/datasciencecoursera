epc <- read.table("household_power_consumption.txt",
                  header=T, sep=";", colClasses=
                  c("character", "character", "numeric",
                    "numeric", "numeric", "numeric",
                    "numeric", "numeric", "numeric"),
                  na.strings="?"
       )[66637:(66637+2879), ]

dt <- paste(epc$Date, epc$Time)
# have to take this clumsy way to construct the POSIXlt vector
# as.Date.POSIXct, as.POSIXlt, lapply, they all don't work
Datetime <- strptime(dt[1], "%e/%m/%Y %H:%M:%S")
for (i in 2:length(dt))
    Datetime <- c(Datetime, strptime(dt[i], "%e/%m/%Y %H:%M:%S"))
nepc <- cbind(Datetime, epc)


png("plot4.png", height=480, width=480)

par(mfrow=c(2, 2))

plot(nepc$Global_active_power ~ nepc$Datetime,
    type="l", xlab="",
    ylab="Global Active Power")

plot(nepc$Voltage ~ nepc$Datetime,
    type="l", xlab="datetime",
    ylab="Voltage")

plot(nepc$Sub_metering_1 ~ nepc$Datetime,
    type="l", xlab="", ylab="Energy sub metering")
lines(nepc$Sub_metering_2 ~ nepc$Datetime,
    type="l", col="red")
lines(nepc$Sub_metering_3 ~ nepc$Datetime,
    type="l", col="blue")
legend("topright",
    c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
    lty=c(1, 1, 1),
    col=c("black", "red", "blue"))

plot(nepc$Global_reactive_power ~ nepc$Datetime,
    type="l", xlab="datetime",
    ylab="Global_reactive_power")

dev.off()

