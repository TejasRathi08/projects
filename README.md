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
Code Explanation
1️⃣ Load quantmod and Fetch MSFT Stock Data
r
Copy
Edit
library(quantmod)
MSFT <- getSymbols("MSFT", auto.assign = FALSE)
getSymbols() fetches stock data (from Yahoo Finance by default).

auto.assign = FALSE keeps the result in a variable instead of assigning it to the global environment.

2️⃣ Basic Data Exploration
r
Copy
Edit
head(MSFT)
dim(MSFT)
MSFT["2007-01-03"]
head() shows the first few rows.

dim() returns the number of rows and columns.

MSFT["2007-01-03"] retrieves the stock data for a specific date.

3️⃣ Convert to Data Frame
r
Copy
Edit
df <- as.data.frame(MSFT)
class(df)
Converts the xts time series data to a traditional data frame.

Useful for operations that require base R syntax.

4️⃣ Tesla (TSLA) Data & Return Plotting
r
Copy
Edit
tsla <- getSymbols("TSLA", auto.assign = FALSE)
head(dailyReturn(tsla$TSLA.Adjusted))
plot(dailyReturn(tsla$TSLA.Adjusted), type = "l")
Gets adjusted closing prices and plots daily returns using a line plot (type = "l").

dailyReturn() calculates simple daily returns based on price change.

5️⃣ Get Adjusted Prices & Returns for MSFT
r
Copy
Edit
MSFT_Ad <- Ad(MSFT)
msft_daily <- dailyReturn(MSFT_Ad)
Ad() extracts the Adjusted Close prices.

dailyReturn() calculates the percentage change from one day to the next.

6️⃣ Shortcut Method for Daily Return
r
Copy
Edit
new_msft <- dailyReturn(Ad(getSymbols("MSFT", auto.assign = FALSE)))
One-liner for fetching MSFT data and computing its daily returns.

7️⃣ Airbnb (ABNB) Data and Merging
r
Copy
Edit
ABNB <- getSymbols("ABNB", auto.assign = FALSE)
ABNB_ad <- Ad(ABNB)
ABNB_daily <- dailyReturn(ABNB_ad)
Similar steps repeated for ABNB stock.

8️⃣ Combining Datasets
r
Copy
Edit
comb <- merge(new_msft, new_ABNB)
comb_traded <- merge(new_msft, new_ABNB, all = FALSE)
merge() combines time series based on dates.

all = FALSE keeps only common dates (intersection).

9️⃣ Visualizing Combined Data
r
Copy
Edit
chartSeries(comb_traded, main = "ABNB vs MSFT")
Plots a combined chart of daily returns for ABNB and MSFT.

🔟 Performance Analytics
r
Copy
Edit
library(PerformanceAnalytics)
table.AnnualizedReturns(comb_traded, scale = 252, Rf = .004/252)
Analyzes annualized returns of both stocks.

scale = 252 assumes 252 trading days in a year.

Rf = .004/252 sets the daily risk-free rate (~0.4% annualized).
