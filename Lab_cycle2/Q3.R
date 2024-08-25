data(mtcars)

cyl_am_table <- table(mtcars$cyl, mtcars$am)

colors <- c("red", "blue")

barplot(cyl_am_table, beside = TRUE, col = colors, main = "Number of Cars by Cylinder Count and Transmission Type",
        xlab = "Number of Cylinders",
        yla = "Frequency",
        legend = c("Automatic", "Manual"),
        args.legend = list(title = "Transmission", x = "topright"))

grid()
