data <- read.csv("hw1_data.csv")

# q11
print(names(data))

# q12
print(head(data, n=2))

# q13
print(nrow(data))

# q14
print(tail(data, n=2))

# q15
print(data$Ozone[[47]])

# q16
print(sum(is.na(data$Ozone)))

# q17
print(mean(data$Ozone, na.rm=T))

# q18
print(mean(data$Solar.R[data$Ozone > 31 & data$Temp > 90], na.rm=T))

# q19
print(mean(data$Temp[data$Month == 6]))

# q20
print(max(data$Ozone[data$Month == 5], na.rm=T))

