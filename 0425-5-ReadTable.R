setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

read.table # 無須安裝

  data <- read.table("train.csv", header = TRUE, sep = ",")
  # 檔案路徑是相對於目前的工作目錄，header 是指資料是否有包含欄位名稱，sep 是指資料的分隔符號。
  
  data <- read.table("Desktop/data.csv", header = TRUE, sep = ",", col.names = c("時間", "新聞標題")) 
  # col.names 設定 column 欄位名稱。
  
  data <- read.table("Desktop/data.csv", header = FALSE, sep = ",", skip = 10) 
  # skip 是指跳過前 X 筆資料，這個部份要注意，要跳過資料，column 欄位就不可以出現在資料裡，因為它也被算在要 skip 部份。
  
  data <- read.table("Desktop/data.csv", header = TRUE, sep = ",", encoding = "UTF-8") 
  # encoding 是指定檔案的文字編碼
  
  data <- read.table("Desktop/data.csv", header = TRUE, sep = ",", na.strings = NA) 
  # na.strings 指定發生 NA 要用什麼符號代替。

----------------------------

#readLines
  
data <- readLines("train.CSV", encoding="big5") # 讀取實價登入資料，是一行一行讀取進來。
View(data)
data <- iconv(data, "big5", "utf8") # 將資料轉成 UTF-8。
----------------------------

# Titanic > Train.csv

  data <- read.table("train.csv", header = TRUE, sep = ",")
  View(data)
  
  # colume name should be matched to columes in csv. 
  data2 <- read.table("train.csv", header = TRUE, sep = ",", col.names = c("時間", "新聞標題")) 
  View(data2)
  
  
  # Try to skip some row when improt
  data2 <- read.table("train.csv", header = FALSE, sep = ",", skip = 4) 
  View(data2)
  
  # No ideal why colume name is not right, so i give the strings for the data2
  
  data2 <- read.table("train.csv", header = TRUE, sep = ",", skip = 4, col.names = c("PassengerId", "Survived", "Pclass,Name", "Sex", "Age", "SibSp", "Parch", "Ticket", "Fare", "Cabin", "Embarked")) 
  View(data2)
  # PassengerId,Survived,Pclass,Name,Sex,Age,SibSp,Parch,Ticket,Fare,Cabin,Embarked
  
  

