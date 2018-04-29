setwd("E:\\MegaSync\\MEGAsync\\R")

# 運用空氣汙染練習
data(airquality)
head(airquality,6) # 前6個值

airquality[,1:4]

cor(airquality[,1:4])

# 運用鳶尾花練習
data(iris)
head(iris,100)
iris_dt <- head(iris,100)[-5] #去除文字型態資料而且只抓100個值                          ]

cor(iris_dt)
cor(iris_dt, use = "pairwise") #推測default設定應該就是"pairwise"
