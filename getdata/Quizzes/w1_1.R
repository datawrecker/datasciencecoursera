housing <- read.csv("getdata_data_ss06hid.csv")
# VAL(Property value): 24 .$1000000+
print(sum(housing$VAL == 24, na.rm=T))

