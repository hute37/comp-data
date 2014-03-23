cm <- read.csv("data/hyperic-hq/Commits1m.csv")
cm$TS <- as.POSIXlt(cm$TT)

db <- read.csv("data/hyperic-hq/NumBackends.csv")
db$TS <- as.POSIXlt(db$TT)

plot(cm$TS,cm$TX,type='l',col="blue")
par(new=T)
plot(db$TS,db$CO,type='l',col="red")