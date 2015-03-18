dat <- read.fwf("getdata_wksst8110.for", c(10, 9, 4, 9, 4, 9, 4, 9, 4), skip=4)
print(sum(dat[, 4]))

