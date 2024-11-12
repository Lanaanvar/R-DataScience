#House pricing

library(ggplot2)

path <- 'C:/Users/lanaa/OneDrive/Desktop/R-DataScience'
data <- read.csv(path)

model <- lm(SalePrice ~ GrLivArea, data = data)

slope <- coef(model)[2]
intercept <- coef(model)[1]

cat("Slope:", slope, "\n")
cat("Intercept:", intercept, "\n")

ggplot(data, aes(x = GrLivArea, y = SalePrice)) +
  geom_point(alpha = 0.5) +  # Scatter plot of the data points
  geom_abline(slope = slope, intercept = intercept, col = 'olivedrab', linewidth = 1) +
  labs(title = "Linear Regression of House Prices vs Size",
       x = "Size (GrLivArea)",
       y = "Price (SalePrice)") +
  theme_minimal()