
data(mtcars)


colors <- c("red", "green", "blue")
color_map <- colors[as.factor(mtcars$cyl)]

plot(mtcars$disp, mtcars$mpg, 
     col = color_map, 
     pch = 19, 
     xlab = "Displacement (cu.in.)", 
     ylab = "Miles per Gallon (mpg)", 
     main = "Scatterplot of MPG vs Displacement by Cylinder Count")

lines(lowess(mtcars$disp, mtcars$mpg), col = "black", lwd = 2)


legend("topright", 
       legend = levels(as.factor(mtcars$cyl)), 
       col = colors, 
       pch = 19, 
       title = "Cylinders")


grid()
