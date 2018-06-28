# 設定 jdbc連結路徑
install.packages("RJDBC")
library(RJDBC)

drv <- JDBC("com.mysql.jdbc.Driver",
              "E:\\MegaSync\\MEGAsync\\R\\tryByself\\mysql-connector-java-5.1.46.jar"
              
)

# 設定連線
# DB name: test123, login id: root, login password: tony, 預設port 3306
conn <- dbConnect(drv,
                    "jdbc:mysql://172.104.90.53:3306/iii",
                    "iii",
                    "iii@WSX1qaz"
                    
)

# 讀取資料
dbListTables(conn) # 等同於 mysql> show tables

a<-dbGetQuery(conn,"select * from airquality ") #執行SQL語法,結果儲存於a
class(a) # a會是一個data.frame的格式
  
# 回寫資料
data(iris)
iris_test <- iris
names(iris_test) <- c('S_L','S_W','P_L','P_W','Species') #更改欄位名稱
dbWriteTable(conn,"iris_test",iris_test) #寫入MySql
dbListTables(conn) # 等同於 mysql> show tables
  
# 刪除Table
dbRemoveTable(conn," iris_test ")
  
# 結束連線
dbDisconnect(conn)
