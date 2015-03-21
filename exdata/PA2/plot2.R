NEI <- readRDS("summarySCC_PM25.rds")

# total PM2.5 emissions in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008
BaltimoreEI <- NEI[NEI$fips == "24510", ]
sumByYear <- with(BaltimoreEI, aggregate(Emissions, by=list(year), sum))
names(sumByYear) <- c("year", "totalEmissions")

png("plot2.png")
with(sumByYear, plot(totalEmissions ~ year, type="b", pch=19,
                    xlab="Year",
                    ylab="Total Emissions (tons)",
                    main="Total PM2.5 Emissions in Baltimore City, Maryland")
)
dev.off()

