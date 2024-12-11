# Install necessary packages if not already installed
install.packages("MASS")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("corrplot")
install.packages("caTools")
install.packages("caret")

# Load libraries
library(MASS)     # For Boston dataset
library(ggplot2)  # For visualization
library(dplyr)    # For data manipulation
library(corrplot) # For correlation matrix visualization
library(caTools)  # For data splitting
library(caret)    # For regression model evaluation

# Load the Boston dataset
data("Boston")

#########################################################################

# Check the structure and summary of the dataset
str(Boston)
summary(Boston)

# Check for missing values in the dataset
sum(is.na(Boston))

# Histogram for the target variable (medv - median home values)
ggplot(Boston, aes(x = medv)) +
  geom_histogram(bins = 30, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Median Value of Homes", x = "Median Value (in $1000s)", y = "Frequency") +
  theme_minimal()

# Correlation matrix of the dataset
cor_matrix <- cor(Boston)
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.8, main = "Correlation Matrix")

# Scatter plot for RM (average number of rooms per dwelling) vs MEDV (Median value of owner-occupied homes)
ggplot(Boston, aes(x = rm, y = medv)) +
  geom_point(alpha = 0.6) +
  labs(title = "Average Number of Rooms vs. Median Home Value", x = "Average Number of Rooms", y = "Median Value") +
  theme_minimal()

# Scatter plot for LSTAT (percentage of lower status of the population) vs MEDV
ggplot(Boston, aes(x = lstat, y = medv)) +
  geom_point(alpha = 0.6, color = "red") +
  labs(title = "Percentage of Lower Status Population vs. Median Home Value", x = "LSTAT", y = "Median Value") +
  theme_minimal()

#####################################################################

set.seed(123)  # For reproducibility
split <- sample.split(Boston$medv, SplitRatio = 0.7)
train_data <- subset(Boston, split == TRUE)
test_data <- subset(Boston, split == FALSE)

# Fit a linear regression model
lm_model <- lm(medv ~ ., data = train_data)
summary(lm_model)

# Predict on test data
predictions <- predict(lm_model, newdata = test_data)

# Calculate RMSE and R-squared
rmse <- sqrt(mean((predictions - test_data$medv)^2))
r_squared <- cor(predictions, test_data$medv)^2

cat("RMSE:", rmse, "\n")
cat("R-squared:", r_squared, "\n")

#######################################################################

# Example input for prediction
new_data <- data.frame(
  crim = 0.1, zn = 18, indus = 2.31, chas = 0, nox = 0.538, rm = 6.575, 
  age = 65.2, dis = 4.09, rad = 1, tax = 296, ptratio = 15.3, b = 396.9, 
  lstat = 4.98
)

# Predict the median value for the new input
predicted_value <- predict(lm_model, newdata = new_data)
cat("Predicted Median Value:", predicted_value, "\n")