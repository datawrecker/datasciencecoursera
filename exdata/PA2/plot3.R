NEI <- readRDS("summarySCC_PM25.rds")

# total PM2.5 emissions in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008
BaltimoreEI <- NEI[NEI$fips == "24510", ]

sumByTypeYear <- with(BaltimoreEI, aggregate(Emissions, by=list(type, year), sum))
names(sumByTypeYear) <- c("type", "year", "totalEmissions")

png("plot3.png")
library(ggplot2)
qplot(year, totalEmissions, data=sumByTypeYear,
    geom="line", facets=type~.,
    xlab="Year", ylab="Total Emissions (tons)",
    main="PM2.5 Emissions in Baltimore City, Maryland"
)
dev.off()

