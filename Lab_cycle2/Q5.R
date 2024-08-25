# Create the box plot
boxplot(hp ~ gear, data = mtcars,
        xlab = "Number of Gears", ylab = "Horsepower",
        main = "Box Plot of Horsepower by Number of Gears",
        col = c("lightblue", "lightgreen", "lightpink"),
        outpch = 8, outcol = "red")

# Add points with different shapes for each gear category
points(jitter(as.numeric(factor(mtcars$gear)), amount = 0.2), 
       mtcars$hp, 
       pch = c(16, 17, 18)[factor(mtcars$gear)],
       col = "black",
       cex = 1.5)

# Add a legend
legend("topright", legend = unique(mtcars$gear), 
       pch = c(16, 17, 18), title = "Gears")

# Identify outliers
outliers <- boxplot.stats(mtcars$hp)$out

# Label outliers
text(rep(3.2, length(outliers)), outliers, 
     labels = rownames(mtcars)[mtcars$hp %in% outliers], 
     pos = 4, cex = 0.8)
