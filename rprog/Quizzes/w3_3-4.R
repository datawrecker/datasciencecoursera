library(datasets)
data(mtcars)

# the average miles per gallon (mpg) by
# number of cylinders in the car (cyl)
print(tapply(mtcars$mpg, mtcars$cyl, mean))

# the absolute difference between the average horsepower of
# 4-cylinder cars and the average horsepower of 8-cylinder cars
print(abs(mean(mtcars$hp[mtcars$cyl == 4]) - mean(mtcars$hp[mtcars$cyl == 8])))

