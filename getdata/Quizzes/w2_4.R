fileUrl <- "http://biostat.jhsph.edu/~jleek/contact.html"
doc <- readLines(fileUrl)
print(nchar(doc[10]))
print(nchar(doc[20]))
print(nchar(doc[30]))
print(nchar(doc[100]))

