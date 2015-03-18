# the file "getdata_data_GDP.csv" has been manually processed
# by removing the rows with missing "Ranking" value
gdp <- read.table("getdata_data_GDP.csv", sep=",", skip=5, quote="\"")
names(gdp)[1] = "CountryCode"
names(gdp)[2] = "Ranking"
names(gdp)[4] = "CountryName"

country <- read.csv("getdata_data_EDSTATS_Country.csv")

mergedData = merge(gdp, country, by.x="CountryCode", by.y="CountryCode", all=F)
print(length(mergedData$CountryCode))

ord <- order(-mergedData$Ranking)
print(mergedData[ord[13], ]$Short.Name)



print(aggregate(mergedData$Ranking, by=list(mergedData$Income.Group), mean))



ord <- order(mergedData$Ranking)
sortedByRanking <- mergedData[ord, ]
library(Hmisc)
sortedByRanking$RG = cut2(sortedByRanking$Ranking, g=5)
print(table(sortedByRanking$Income.Group, sortedByRanking$RG))

