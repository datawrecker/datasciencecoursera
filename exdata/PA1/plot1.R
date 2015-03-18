epc <- read.table("household_power_consumption.txt",
                  header=T, sep=";", colClasses=
                  c("character", "character", "numeric",
                    "numeric", "numeric", "numeric",
                    "numeric", "numeric", "numeric"),
                  na.strings="?"
       )[66637:(66637+2879), ]

png("plot1.png", height=480, width=480)
hist(epc$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")
dev.off()

