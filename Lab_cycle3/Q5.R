# Install necessary packages if not already installed
install.packages("forecast")
install.packages("dplyr")

# Load libraries
library(forecast)
library(dplyr)

# Load the data
url <- "https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv"
covid_data <- read.csv(url)

head(covid_data)

# Filter data for India and between the specified dates
covid_india <- covid_data %>%
  filter(Country.Region == "India" & Date >= "2020-01-22" & Date <= "2020-12-15")

# Convert Date column to Date format
covid_india$Date <- as.Date(covid_india$Date)

# Aggregate data weekly (sum of cases and deaths each week)
covid_weekly <- covid_india %>%
  group_by(week = as.numeric(format(Date, "%U")), year = as.numeric(format(Date, "%Y"))) %>%
  summarize(TotalCases = max(Confirmed), TotalDeaths = max(Deaths))

# Sort the data by year and week
covid_weekly <- covid_weekly %>%
  arrange(year, week)

#############################################################################

# Create a time series object for total cases
cases_ts <- ts(covid_weekly$TotalCases, start = c(2020, 4), frequency = 52)

# Plot the time series of total cases
plot.ts(cases_ts, main = "Weekly COVID-19 Cases in India (2020)", ylab = "Total Cases", xlab = "Week")

############################################################################

# Create a multivariate time series object
covid_mts <- ts(cbind(TotalCases = covid_weekly$TotalCases, TotalDeaths = covid_weekly$TotalDeaths), 
                start = c(2020, 4), frequency = 52)

# Plot both series on the same chart
plot(covid_mts, main = "Weekly COVID-19 Cases and Deaths in India (2020)", xlab = "Week", col = c("blue", "red"))
legend("topleft", legend = c("Total Cases", "Total Deaths"), col = c("blue", "red"), lty = 1)

##########################################################################

# Fit ARIMA model for total cases
auto_arima_model <- auto.arima(cases_ts)
summary(auto_arima_model)

# Forecast the next 5 weeks
forecasted_values <- forecast(auto_arima_model, h = 5)
print(forecasted_values)

# Plot forecasted values
plot(forecasted_values, main = "COVID-19 Cases Forecast for Next 5 Weeks", ylab = "Total Cases", xlab = "Week")