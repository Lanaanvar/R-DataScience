data(mtcars)

hist_data <- hist(mtcars$mpg, breaks = 10, plot = FALSE)
color <- colorRampPalette(c("lightblue", "blue"))(max(hist_data$counts))
bin_col <- color[hist_data$counts]

hist(mtcars$mpg, 
     main = "Histogram of Miles Per Gallon (mpg)",
     xlab = "Miles Per Gallon (mpg)", 
     ylab = "Frequency",
     breaks = 10, 
     col = bin_col, 
     xlim = c(10,35),
     ylim = c(0,10),
     border = "white")

mean_mpg <- mean(mtcars$mpg)
sd_mpg <- sd(mtcars$mpg)

abline(v = mean_mpg, col="red", lwd = 2, lty = 2 )
abline(v = c(mean_mpg + sd_mpg, mean_mpg-sd_mpg), col = "black", lwd= 2, lty = 2)

text(mean_mpg, max(hist_data$counts)*0.9, paste("Mean = ", round(mean_mpg, 2)), col = "red", pos = 4)
text(mean_mpg, max(hist_data$counts)*0.8, paste("SD = ", round(sd_mpg, 2)), col = "black", pos = 4)