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

png("plot2.png", height=480, width=480)
plot(nepc$Global_active_power ~ nepc$Datetime,
    type="l", xlab="",
    ylab="Global Active Power (kilowatts)")
dev.off()

