install.packages("forecast")
library(forecast)

setwd("E:/Dropbox/Facultate/RMACA - Vintan/proiect/statistical-study")

series_pv1 <- read.csv(file = '../energyarima/benchmarks/hourly-pv1.txt')
series_pv2 <- read.csv(file = '../energyarima/benchmarks/hourly-pv2.txt')
series_ph1 <- read.csv(file = '../energyarima/benchmarks/hourly-ph1.txt')
series_ph2 <- read.csv(file = '../energyarima/benchmarks/hourly-ph2.txt')
series_ph3 <- read.csv(file = '../energyarima/benchmarks/hourly-ph3.txt')



# SARIMA!
pv1 <- ts(series_pv1, frequency=24)
fit <- auto.arima(pv1)
# 
# Series: pv1 
# ARIMA(3,1,0)(2,0,0)[24] 
# 
# Coefficients:
#   ar1      ar2      ar3    sar1    sar2
# -0.2480  -0.0600  -0.0500  0.2768  0.2695
# s.e.   0.0189   0.0189   0.0172  0.0170  0.0175
# 
# sigma^2 estimated as 157472:  log likelihood=-26812.84
# AIC=53637.67   AICc=53637.69   BIC=53674.84

pv2 <- ts(series_pv2, frequency=24)
fit <- auto.arima(pv2)

# 
# Series: pv2 
# ARIMA(3,1,0)(2,0,0)[24] 
# 
# Coefficients:
#   ar1      ar2      ar3    sar1    sar2
# -0.2470  -0.0666  -0.0522  0.2784  0.2726
# s.e.   0.0189   0.0189   0.0173  0.0170  0.0174
# 
# sigma^2 estimated as 149756:  log likelihood=-26721.94
# AIC=53455.88   AICc=53455.9   BIC=53493.04
# 


ph1 <- ts(series_ph1, frequency=24)
fit <- auto.arima(ph1)

# Series: ph1 
# ARIMA(0,1,1)(0,0,2)[24] 
# 
# Coefficients:
#   ma1   sma1    sma2
# -0.6475  0.181  0.2431
# s.e.   0.0178  0.018  0.0147
# 
# sigma^2 estimated as 245311:  log likelihood=-27614.91
# AIC=55237.81   AICc=55237.83   BIC=55262.59


ph2 <- ts(series_ph2, frequency=24)
fit <- auto.arima(ph2)
# 
# Series: ph2 
# ARIMA(0,1,1)(0,0,2)[24] 
# 
# Coefficients:
#   ma1    sma1    sma2
# -0.7091  0.1929  0.1268
# s.e.   0.0202  0.0176  0.0161
# 
# sigma^2 estimated as 124288:  log likelihood=-26382.67
# AIC=52773.35   AICc=52773.36   BIC=52798.13

ph3 <- ts(series_ph3, frequency=24)
fit <- auto.arima(ph3)
# 
# Series: ph3 
# ARIMA(0,1,1)(0,0,2)[24] 
# 
# Coefficients:
#   ma1    sma1    sma2
# -0.7433  0.1782  0.2040
# s.e.   0.0214  0.0167  0.0165
# 
# sigma^2 estimated as 95821:  log likelihood=-25912.17
# AIC=51832.35   AICc=51832.36   BIC=51857.13