library(jpeg)
pic <- readJPEG("getdata_jeff.jpg", native=T)
print(quantile(pic, probs=c(0.3, 0.8)))

