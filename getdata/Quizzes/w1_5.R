DT <- read.csv("getdata_data_ss06pid.csv")

print(system.time(sapply(split(DT$pwgtp15,DT$SEX),mean)))
print(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
print(system.time(mean(DT[DT$SEX==1,]$pwgtp15)))
print(system.time(mean(DT[DT$SEX==2,]$pwgtp15)))

