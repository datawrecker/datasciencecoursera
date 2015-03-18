library(XML)
doc <- xmlTreeParse("getdata_data_restaurants.xml", useInternal=T)
rootNode <- xmlRoot(doc)
# How many restaurants have zipcode 21231?
all <- xpathSApply(rootNode, "//zipcode", xmlValue)
print(sum(all == "21231"))

