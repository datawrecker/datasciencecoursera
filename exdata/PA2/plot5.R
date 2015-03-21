NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# motor vehicle sources sources
VehicleSCC <- grep('Vehicle', SCC$EI.Sector)
VehicleIdx <- NEI$SCC %in% SCC$SCC[VehicleSCC]

BaltimoreVehicleEI <- NEI[NEI$fips == "24510" & VehicleIdx, ]

# total PM2.5 emissions in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008
sumByYear <- with(BaltimoreVehicleEI, aggregate(Emissions, by=list(year), sum))
names(sumByYear) <- c("year", "totalEmissions")

png("plot5.png")
with(sumByYear, plot(totalEmissions ~ year, type="b", pch=19,
                    xlab="Year",
                    ylab="Total Emissions (tons)",
                    main="Baltimore PM2.5 Emissions from Motor Vehicle")
)
dev.off()

