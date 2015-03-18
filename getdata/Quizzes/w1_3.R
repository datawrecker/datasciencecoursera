library(xlsx)
dat <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx", sheetIndex=1, startRow=18, endRow=23)
print(sum(dat$Zip*dat$Ext, na.rm=T))

