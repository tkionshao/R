df <- load(file.choose())
cdc$height_new <- cut(cdc$height,seq(45,95,by=5),right=F,labels = seq(1,10))
cdc$