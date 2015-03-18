library(sqldf)
acs <- read.csv("getdata_data_ss06pid.csv")
res1 <- acs[acs$AGEP < 50, ]$pwgtp1
res2 <- sqldf("select pwgtp1 from acs where AGEP < 50")[, 1]
print(length(res1) == length(res2))
print(sum(res1 == res2) == length(res1))


res3 <- unique(acs$AGEP)
res4 <- sqldf("select distinct AGEP from acs")[, 1]
print(length(res3) == length(res4))
print(sum(res3 == res4) == length(res3))

