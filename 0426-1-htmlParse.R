x = c("https://openhome.cc/Gossip/Python/LambdaExpression.html",
      https://openhome.cc/Gossip/Python/LambdaExpression.html,
      https://openhome.cc/Gossip/Python/LambdaExpression.html ,
      https://openhome.cc/Gossip/Python/LambdaExpression.html ,
      https://openhome.cc/Gossip/Python/LambdaExpression.html
      )








ua <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.366"


myHttpHeader <- c(
  "User-Agent"=ua,
  "accept"="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
  "accept-Language"="en-US,en;q=0.9,ja;q=0.8,zh-TW;q=0.7,zh;q=0.6",
  "accept-encoding"="gzip, deflate",
  "Connection"="keep-alive",
  "cache-control"="max-age=0",
  "Accept-Charset"="UTF8,utf-8;q=0.7,*;q=0.7",
  "Upgrade-Insecure-Requests" = "1",
  "Host" =  "share.youthwant.com.tw",
  "Referer" = "http://share.youthwant.com.tw/L10.html"
  
)

Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9,ja;q=0.8,zh-TW;q=0.7,zh;q=0.6
Cache-Control: max-age=0
Connection: keep-alive
Host: share.youthwant.com.tw
Referer: http://share.youthwant.com.tw/L10.html
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36


curl_handle <- getCurlHandle()
curlSetOpt(cookiejar="cookies.txt", 
           useragent = ua, 
           followlocation = TRUE, 
           curl=curl_handle
)

Sys.getlocale()
Sys.setlocale(category='LC_ALL', locale='C')

link = "http://share.youthwant.com.tw/D12166391.html"
html_doc <- htmlParse(getURL(link, curl = curl_handle), encoding = "UTF-8")
article_item <- xpathSApply(html_doc, "//*[@id='articleBox']/span", xmlValue)
article_item <- gsub("\\s+", "", article_item)
article_item <- gsub(" $", "", article_item)
data <- article_item

Sys.setlocale(category='LC_ALL', locale="")

data



//*[@id='articleBox']/span/table/tbody/tr/td/div/div/div[11]/span
//*[@id="articleBox"]/span/table/tbody/tr/td/div/div/div[11]
//*[@id="articleBox"]/span/table/tbody/tr/td/div/div
//*[@id=main-content"]/div