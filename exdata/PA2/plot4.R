NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# coal combustion-related sources
CoalCombSCC <- grep('Coal', SCC$EI.Sector)
CoalCombIdx <- NEI$SCC %in% SCC$SCC[CoalCombSCC]
CoalCombSrc <- NEI[CoalCombIdx, ]

# total PM2.5 emissions in the United States from 1999 to 2008
sumByYear <- with(CoalCombSrc, aggregate(Emissions, by=list(year), sum))
names(sumByYear) <- c("year", "totalEmissions")

png("plot4.png")
with(sumByYear, plot(totalEmissions ~ year, type="b", pch=19,
                    xlab="Year",
                    ylab="Total Emissions (tons)",
                    main="Nationwide PM2.5 Emissions from Coal Combustion")
)
dev.off()

