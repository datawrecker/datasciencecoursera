dat <- read.csv("getdata_data_ss06hid.csv")

# the households on greater than 10 acres
# who sold more than $10,000 worth of agriculture products
agricultureLogical <- dat$ACR == 3 & dat$AGS == 6

print(which(agricultureLogical)[1:3])

