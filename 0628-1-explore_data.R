setwd('/Users/cyh_mid09mbp/Documents/MegaSync/MEGAsync/datasets')
setwd('~/workdir/R/riii')
df <- read.csv('restaurant_2018_06_22.csv',encoding='utf-8')
library(dplyr)
temp1 <- filter(df, price < 1000 & price > 200)
temp2 <- filter(temp1, !is.na(price))

temp2 = temp1 %>% select(type_one, type_two, price) %>% 
  group_by(type_one, type_two) %>% summarise(count = n(), avg = mean(price) ,sum = sum(price)) %>% arrange(desc(avg))

temp2




library(mice)
is.na(df)
sum(is.na(df$price))
null_row = is.na(df$price)

df_2 <- tbl_df(df)
df[df$price == NA]

library(ggplot2)
g <- ggplot(temp1,aes(y=price,x=type_one))
g+geom_point(aes(col=type_one)) +theme(text=element_text(family='Songti SC'))
g+geom_jitter(aes(col=type_one))+theme(text=element_text(family='Songti SC'))


