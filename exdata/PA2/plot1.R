NEI <- readRDS("summarySCC_PM25.rds")

# total PM2.5 emissions in the United States from 1999 to 2008
sumByYear <- aggregate(NEI$Emissions, by=list(NEI$year), sum)
names(sumByYear) <- c("year", "totalEmissions")

png("plot1.png")
with(sumByYear, plot(totalEmissions ~ year, type="b", pch=19,
                    xlab="Year",
                    ylab="Total Emissions (tons)",
                    main="Nationwide Total PM2.5 Emissions")
)
dev.off()

