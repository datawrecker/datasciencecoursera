NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# motor vehicle sources sources
VehicleSCC <- grep('Vehicle', SCC$EI.Sector)
VehicleIdx <- NEI$SCC %in% SCC$SCC[VehicleSCC]

TwoCitiesVehicleEI <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & VehicleIdx, ]

# total PM2.5 emissions in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008
sumByYear <- with(TwoCitiesVehicleEI, aggregate(Emissions, by=list(year, fips), sum))
names(sumByYear) <- c("year", "fips", "totalEmissions")
sumByYear$fips[sumByYear$fips == "24510"] <- "Baltimore City, Maryland"
sumByYear$fips[sumByYear$fips == "06037"] <- "Los Angeles County, California"

png("plot6.png")
library(ggplot2)
qplot(year, totalEmissions, data=sumByYear,
    geom="line", facets=.~fips,
    xlab="Year", ylab="Total Emissions (tons)",
    main="PM2.5 Emissions from Motor Vehicle"
)
dev.off()

