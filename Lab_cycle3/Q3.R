# mtcars - pearson correlation

data("mtcars")

head(mtcars)

correlation <- cor.test(mtcars$hp, mtcars$mpg, method = "pearson")

print(correlation)