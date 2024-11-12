# one way ANOVA

data("mtcars")

# Convert gear to a factor as it's a categorical variable
mtcars$gear <- as.factor(mtcars$gear)

# one-way ANOVA
anova_result <- aov(disp ~ gear, data = mtcars)

summary(anova_result)