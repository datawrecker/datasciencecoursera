library(datasets)
data(iris)

print(mean(iris$Sepal.Length[iris$Species == "virginica"]))

print(apply(iris[, 1:4], 2, mean))

