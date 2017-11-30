install.packages("forecast")
library(forecast)

setwd("E:/Dropbox/Facultate/RMACA - Vintan/proiect/statistical-study")

series <- read.csv(file = '../energyarima/benchmarks/fems20.csv')

fit <- auto.arima(series['Ph3'])
# Series: series["Ph3"]
# ARIMA(1,1,2)
#
# Coefficients:
#   ar1      ma1     ma2
# 0.5434  -0.9478  0.0425
# s.e.  0.0163   0.0176  0.0124
#
# sigma^2 estimated as 56112:  log likelihood=-299395.8
# AIC=598799.6   AICc=598799.6   BIC=598834.3

fit <- auto.arima(series['Ph2'])
# Series: series["Ph2"]
# ARIMA(1,1,2)
#
# Coefficients:
#   ar1      ma1     ma2
# 0.7700  -1.0408  0.0993
# s.e.  0.0132   0.0156  0.0103
#
# sigma^2 estimated as 41918:  log likelihood=-293056.3
# AIC=586120.7   AICc=586120.7   BIC=586155.4

fit <- auto.arima(series['Ph1'])
#Series: series["Ph1"]
# ARIMA(5,1,5) with drift
#
# Coefficients:
#   ar1     ar2      ar3      ar4     ar5      ma1      ma2     ma3     ma4      ma5   drift
# 0.5491  0.4165  -0.2085  -0.4603  0.4948  -0.6586  -0.6009  0.1246  0.5836  -0.4038  0.0214
# s.e.  0.0298  0.0483      NaN      NaN     NaN   0.0296   0.0519     NaN     NaN      NaN  0.2884
#
# sigma^2 estimated as 78039:  log likelihood=-306562.3
# AIC=613148.7   AICc=613148.7   BIC=613252.8
# Warning message:
#   In sqrt(diag(x$var.coef)) : NaNs produced

fit <- auto.arima(series['PV1'])
# Series: series["PV1"]
# ARIMA(3,1,1)
#
# Coefficients:
#   ar1      ar2      ar3      ma1
# 0.3564  -0.1121  -0.0516  -0.4993
# s.e.  0.0244   0.0058   0.0074   0.0241
#
# sigma^2 estimated as 31327:  log likelihood=-286724.9
# AIC=573459.8   AICc=573459.8   BIC=573503.2


fit <- auto.arima(series['PV2'])
# Series: series["PV2"]
# ARIMA(2,1,2)
#
# Coefficients:
#   ar1      ar2      ma1     ma2
# 0.7155  -0.2703  -0.8613  0.2034
# s.e.  0.0480   0.0275   0.0488  0.0364
#
# sigma^2 estimated as 30222:  log likelihood=-285944.1
# AIC=571898.2   AICc=571898.2   BIC=571941.6





# SARIMA!
#pv1 <- ts(series['PV1'], frequency=288)
#fit <- auto.arima(pv1)

#OR: (with only a week's data) -> LOWER the frequency (eg. 8)and it works
pv1 <- ts(series[0:2016,'PV1'], frequency=288)
fit <- auto.arima(pv1)

#Series: pv1
# ARIMA(5,1,2)(0,0,2)[8]
#
# Coefficients:
#   ar1      ar2      ar3      ar4      ar5     ma1     ma2    sma1    sma2
# -0.7014  -0.2969  -0.1180  -0.1977  -0.1591  0.6910  0.2019  0.0486  0.0733
# s.e.   0.1858   0.1057   0.0316   0.0287   0.0290  0.1875  0.1055  0.0272  0.0222
#
# sigma^2 estimated as 1011:  log likelihood=-9825.73
# AIC=19671.46   AICc=19671.56   BIC=19727.54
