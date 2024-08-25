data("mtcars")

colors <- colorRampPalette(c("lightblue", "blue"))(length(unique(mtcars$carb)))
sizes <- seq(2, 4, length = length(unique(mtcars$carb)))

plot(x= mtcars$disp, y= mtcars$wt, xlab = "Displacement", ylab = "Weight", main = "Displacement VS Weight",
     pch = 21, bg = colors[factor(mtcars$carb)],
     col = "black", cex = sizes[factor(mtcars$carb)], )

abline()

legend("bottomright", legend = unique(mtcars$carb),
       title = "Number of Carburetors",
       col = colors, pch = 16, pt.cex = sizes)

loess_fit <- loess(wt ~ disp, data = mtcars)

disp_sorted <- sort(mtcars$disp)
lines(disp_sorted, predict(loess_fit, newdata = data.frame(disp = disp_sorted)), 
      lwd = 2, col = "black")
