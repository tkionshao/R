
install.packages("jiebaR")

library(jiebaR)
seg_worker= worker()

install.packages("bitops")

install.packages("jiebaRD")
install.packages("jiebaR")
install.packages("devtools")
install.packages("RColorBrewer")
install.packages("tidyRSS")
install.packages("XML")
install.packages("RCurl")
install.packages("plyr")
install.packages("wordcloud")
install.packages("wordcloud2")

library(tidyRSS)
library(XML)
library(RCurl)
library(jiebaRD)
library(jiebaR)
library(RColorBrewer)
library(stringr)
library(plyr)
library(wordcloud)
library(wordcloud2)

rss_url <-'https://udn.com/rssfeed/news/2/6638?ch=news'
rss <- tidyRSS::tidyfeed(feed = rss_url)
rss$feed_title
rss$feed_link
rss$feed_description
rss$feed_language
rss$item_link
rss$item_title

View(rss)

ua <-"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit /537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36"
myHttpHeader <-c(
  "User -Agent"= ua ,
  "accept"="text/ html,application /xhtml+xml,application /xml;q =0.9,image/ webp,image /apng ,*/*;q=0.8",
  "accept -Language"=" zh -TW,zh;q =0.9,en -US;q=0.8,en;0.7",
  "accept -encoding"=" gzip , deflate, br ",
  "Connection"="keep -alive",
  "cache -control"="no -cache",
  "Accept -Charset"="UTF8,utf -8;q=0.7,*;0.7")

curl_handle <-getCurlHandle ()
curlSetOpt (cookiejar ="cookies.txt", useragent = ua , followlocation = TRUE, curl= curl_handle)



View(rss$item_link)
#
# 聯合新聞網
#//*[@id="story_body_content"]/p[2]
# //*[@id="story_body_content"]/p[3]
# //*[@id="story_body_content"]
# //*[@id="story_body_content"]/p[2]/text()[1]
# //*[@id="story_body_content"]/p[3]/text()
# //*[@id="story_body_content"]/p[6]/text()
# //*[@id='story_body_content']/p[3]/text()



data <-list()

i = 1
for( link in rss$item_link[6]) {
  Sys.getlocale()
  Sys.setlocale(category='LC_ALL', locale='C')
  html_doc<-htmlParse(getURL(link, curl = curl_handle), encoding = "UTF-8")
  article_item<-xpathSApply(html_doc, "//*[@id='story_body_content']/p[12]", xmlValue)
# article_item<-gsub("\\s+", "",article_item)
# article_item<-gsub(" $", "",article_item)
  print("This is for ")
  print(i)
  print(article_item)
  Sys.setlocale(category='LC_ALL', locale="")
  data[i] <- article_item
  i <- i+1
  t <- sample(2:5,1)
  Sys.sleep(t)
}
write.csv(data,file="E:\\scraping2.csv",row.names=F, na = "NA")
