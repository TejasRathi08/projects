# 📈 Stock Analysis in R using quantmod and PerformanceAnalytics

This project demonstrates how to perform basic stock market data analysis in R using the **`quantmod`** and **`PerformanceAnalytics`** packages. It covers:

- Downloading data for companies like Microsoft (MSFT), Tesla (TSLA), and Airbnb (ABNB)
- Converting data into a usable format
- Calculating daily returns
- Merging datasets
- Plotting data
- Performing annualized return analysis

---

## 🔧 Requirements

- **R** (version ≥ 4.0.0)
- **Internet connection** (to download stock data from Yahoo Finance)

---

## 📦 Install Required Packages

```r
install.packages("quantmod")
install.packages("PerformanceAnalytics")
```


# 📊 Code Explanation – Stock Analysis using quantmod & PerformanceAnalytics in R

This README provides a detailed breakdown of R code used for fetching stock data, performing financial analysis, and generating insights using the **quantmod** and **PerformanceAnalytics** packages in R.

---

## 🔹 1️⃣ Load `quantmod` and Fetch MSFT Stock Data

```r
library(quantmod)
MSFT <- getSymbols("MSFT", auto.assign = FALSE)
```

# 📊 Stock Market Analysis in R

This project demonstrates how to use **R** and the **quantmod** and **PerformanceAnalytics** packages to fetch, explore, and analyze stock market data. The analysis includes downloading stock data, calculating daily returns, merging stock time series, plotting comparisons, and calculating annualized performance metrics.

---

## 🔍 Basic Data Exploration

```r
head(MSFT)
dim(MSFT)
MSFT["2007-01-03"]
```
