install.packages("quantmod")
library(quantmod) 
MSFT <- getSymbols("MSFT" , auto.assign = FALSE) 
head(MSFT) 
dim(MSFT)
MSFT["2007-01-03"]

df<- as.data.frame(MSFT) 
class(df)
head(df)

options(sciprn=9999)
tsla<- getSymbols("TSLA" , auto.assign = FALSE ) 
head(tsla, 21) 
head(dailyReturn(tsla$TSLA.Adjusted)) 
plot(dailyReturn(tsla$TSLA.Adjusted), type = "1") 


install.packages("quantmod")
library(quantmod) 
MSFT <- getSymbols("MSFT" , auto.assign = FALSE) 
MSFT_Ad<-Ad(MSFT)
head(MSFT_Ad) 
msft_daily<- dailyReturn(MSFT_Ad) 
head(msft_daily) 
new_msft<- dailyReturn(Ad(getSymbols("MSFT", auto.assign = FALSE))) 
head(new_msft) 

head(MSFT)  


ABNB<- getSymbols("ABNB", auto.assign =  FALSE) 
ABNB_ad<-Ad(ABNB) 
ABNB_daily<- dailyReturn(ABNB_ad) 

dim(ABNB_daily) 

new_ABNB<- dailyReturn(Ad(getSymbols("ABNB", auto.assign = FALSE))) 
comb<- merge(new_msft, new_ABNB) 
head(comb) 
comb_traded<-merge(new_msft, new_ABNB, all= FALSE) 
head(comb_traded) 
dim(comb_traded)
chartSeries(comb_traded, main = "ABNB vs MSFT") 

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
table.AnnualizedReturns(comb_traded, scale = 252, Rf = .004/252) 
