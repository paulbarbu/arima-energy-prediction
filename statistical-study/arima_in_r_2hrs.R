install.packages("forecast")
library(forecast)

setwd("E:/Dropbox/Facultate/RMACA - Vintan/proiect/statistical-study")

series_pv1 <- read.csv(file = '../energyarima/benchmarks/2hrs-pv1.txt')
series_pv2 <- read.csv(file = '../energyarima/benchmarks/2hrs-pv2.txt')
series_ph1 <- read.csv(file = '../energyarima/benchmarks/2hrs-ph1.txt')
series_ph2 <- read.csv(file = '../energyarima/benchmarks/2hrs-ph2.txt')
series_ph3 <- read.csv(file = '../energyarima/benchmarks/2hrs-ph3.txt')

# SARIMA!
pv1 <- ts(series_pv1, frequency=12)
fit <- auto.arima(pv1)
#
# Series: pv1
# ARIMA(5,1,0)(2,0,0)[12] with drift
#
# Coefficients:
#   ar1      ar2      ar3      ar4      ar5    sar1    sar2    drift
# -0.4180  -0.3194  -0.2445  -0.2206  -0.1337  0.3419  0.4483   0.1154
# s.e.   0.0251   0.0262   0.0258   0.0249   0.0233  0.0215  0.0216  21.7648
#
# sigma^2 estimated as 222686:  log likelihood=-13713.84
# AIC=27445.67   AICc=27445.77   BIC=27495.18

pv2 <- ts(series_pv2, frequency=12)
fit <- auto.arima(pv2)
# Series: pv2
# ARIMA(5,1,0)(2,0,0)[12]
#
# Coefficients:
#   ar1      ar2      ar3      ar4      ar5    sar1    sar2
# -0.4196  -0.3193  -0.2431  -0.2210  -0.1336  0.3396  0.4491
# s.e.   0.0251   0.0262   0.0258   0.0249   0.0233  0.0215  0.0217
#
# sigma^2 estimated as 212944:  log likelihood=-13673.82
# AIC=27363.64   AICc=27363.72   BIC=27407.65


ph1 <- ts(series_ph1, frequency=12)
fit <- auto.arima(ph1)
#
# Series: ph1
# ARIMA(4,1,3)(1,0,0)[12]
#
# Coefficients:
#   ar1     ar2      ar3      ar4      ma1      ma2     ma3    sar1
# 0.1278  0.8111  -0.2476  -0.1444  -0.8964  -0.8573  0.7591  0.2838
# s.e.  0.0557  0.0554   0.0278   0.0256   0.0526   0.0716  0.0528  0.0289
#
# sigma^2 estimated as 255549:  log likelihood=-13834.9
# AIC=27687.81   AICc=27687.91   BIC=27737.32


ph2 <- ts(series_ph2, frequency=12)
fit <- auto.arima(ph2)
# Series: ph2
# ARIMA(5,1,0)(2,0,0)[12]
#
# Coefficients:
#   ar1      ar2      ar3      ar4      ar5    sar1    sar2
# -0.6626  -0.5084  -0.3846  -0.2559  -0.1390  0.2556  0.2253
# s.e.   0.0245   0.0285   0.0295   0.0276   0.0233  0.0234  0.0238
#
# sigma^2 estimated as 161319:  log likelihood=-13418.44
# AIC=26852.88   AICc=26852.96   BIC=26896.89

ph3 <- ts(series_ph3, frequency=12)
fit <- auto.arima(ph3)

#
# Series: ph3
# ARIMA(0,1,1)(0,0,2)[12]
#
# Coefficients:
#   ma1    sma1    sma2
# -0.9878  0.2083  0.2252
# s.e.   0.0041  0.0232  0.0223
#
# sigma^2 estimated as 103354:  log likelihood=-13018.19
# AIC=26044.38   AICc=26044.4   BIC=26066.38