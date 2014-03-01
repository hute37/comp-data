
jms.gui.rx.20130819.1316.exp <- read.csv("~/xfer/20130819-ta/jms-gui-rx-20130819-1316-exp.csv")
t <- jms.gui.rx.20130819.1316.exp

d <- subset(t,select = c(T,node,RX.OUT,RX.SLOW,RX.FAST,RX.TOT))
View(d)
s <- aggregate(d[2:5],by=list(tt,node),FUN=sum)
View(s)



s <- aggregate(d,by=list(d$T,d$node),FUN=sum)
t <- jms.gui.rx.20130819.1316.exp
d <- subset(t,select = c(T,node,RX.OUT,RX.SLOW,RX.FAST,RX.TOT))
View(d)
s <- aggregate(d,by=list(d$T,d$node),FUN=sum)

jms.acs.rx.20130822.0654 <- read.csv("~/xfer/20130822-ta/20130822-x8/jms-acs-rx-20130822-0654.csv", sep=";")
a <- subset(jms.acs.rx.20130822.0654,select=-X)
a$ts <- ISOdate(2013,8,a$dd,a$hh)
b <- data.frame(node=a$node,ts=a$ts,sample=paste(a$ts,a$m,sep="-"),TX=a$tx.ok,EXP=a$sys.exp)

cnh <- aggregate(b[4:5],by=list(b$ts,b$node),FUN=sum)
cnm <- aggregate(b[4:5],by=list(b$sample,b$node),FUN=sum)
csh <- aggregate(b[4:5],by=list(b$ts),FUN=sum)
csm <- aggregate(b[4:5],by=list(b$sample),FUN=sum)


names(cnh) <- c("ts", "node", "TX",  "EXP")
names(cnm) <- c("ts", "node", "TX",  "EXP")
names(csh) <- c("ts", "TX", "EXP")
names(csm) <- c("ts", "TX",  "EXP")

jms.gui.rx.20130822.0656 <- read.csv("~/xfer/20130822-ta/20130822-x8/jms-gui-rx-20130822-0656.csv", sep=";")
u <- subset(jms.gui.rx.20130822.0656,select=-X)

u$ts <- ISOdate(2013,8,u$dd,u$hh)
u$sample <- paste(u$ts,u$m,sep="-")

v <- data.frame(node=u$node,ts=u$ts,sample=u$sample,OUT=u$rx.tout,SLOW=u$rx.redo+u$rx.poll,FAST=u$rx.ok-u$rx.redo-u$rx.poll,TOT=u$rx.ok+u$rx.tout,QT=u$qt.time.t,QM=u$qt.time.m,QS=u$qt.time.s,WM=u$wait.t.m,WS=u$wait.t.s)

vnh <- aggregate(v[4:8],by=list(v$ts,v$node),FUN=sum)
vnm <- aggregate(v[4:8],by=list(v$sample,v$node),FUN=sum)
vsh <- aggregate(v[4:8],by=list(v$ts),FUN=sum)
vsm <- aggregate(v[4:8],by=list(v$sample),FUN=sum)


names(vnh) <- c("ts", "node", "OUT",  "SLOW", "FAST", "TOT", "QT")
names(vnm) <- c("ts", "node", "OUT",  "SLOW", "FAST", "TOT", "QT")
names(vsh) <- c("ts", "OUT",  "SLOW", "FAST", "TOT", "QT")
names(vsm) <- c("ts", "OUT",  "SLOW", "FAST", "TOT", "QT")



library("ggplot2", lib.loc="/usr/local/lib/R/site-library")
library("reshape2", lib.loc="/usr/local/lib/R/site-library")

ggplot(melt(csh,id=c("ts")), aes(x=ts, y=value, fill=variable, group=variable)) + geom_area(position="dodge") + scale_fill_brewer(palette="Dark2") + labs(title="ACS Send Summary (by hour)")
ggplot(melt(csh,id=c("ts")), aes(x=ts, y=value, fill=variable, group=variable)) + geom_area(position="dodge") + scale_fill_brewer(palette="Dark2") + coord_cartesian(ylim=c(0,300)) + labs(title="ACS Send Summary (by hour - ylim: 300)")

ggplot(melt(vsh[c(1,4,3,2)],id=c("ts")), aes(x=ts, y=value, fill=variable, group=variable)) + geom_area(position="dodge") + scale_fill_brewer(palette="Dark2") + labs(title="GUI Receive Summary (by hour)")
ggplot(melt(vsh[c(1,4,3,2)],id=c("ts")), aes(x=ts, y=value, fill=variable, group=variable)) + geom_area(position="stack") + scale_fill_brewer(palette="Dark2") + coord_cartesian(ylim=c(0,300)) + labs(title="GUI Receive Summary (by hour - stacked - ylim: 300)")




clear()
clear
jms.gui.rx.20130819.1316.exp <- read.csv("~/xfer/20130819-ta/jms-gui-rx-20130819-1316-exp.csv")
View(jms.gui.rx.20130819.1316.exp)
summary(jms.gui.rx.20130819.1316.exp)
d <- subset(t,select = c(T,node,RX.OUT,RX.SLOW,RX.FAST,RX.TOT))
t <- jms.gui.rx.20130819.1316.exp
d <- subset(t,select = c(T,node,RX.OUT,RX.SLOW,RX.FAST,RX.TOT))
View(d)
sapply(d,class)
s <- aggregate(d,by=list(T,node),FUN=sum)
attach(d)
d$tt <- d$T
View(d)
d <- subset(d, select=-T)
View(d)
s <- aggregate(d,by=list(tt,node),FUN=sum)
detach(d)
attach(d)
s <- aggregate(d,by=list(tt,node),FUN=sum)
s <- aggregate(d[2:5],by=list(tt,node),FUN=sum)
View(s)
rename(s,c=("Group.1"="tt", "Group.2"="node"))
rename(s,c=("Group.1"="tt"))
names(d)
names(s)
names(s) <- c("tt" "node" "OUT"  "SLOW" "FAST" "TOT")
names(s) <- c("tt", "node", "OUT",  "SLOW", "FAST", "TOT")
View(s)
q <- aggregate(s[3:6], by=list(s$tt), FUN=sum)
View(q)
library(ggplot2)
install.packages("ggplot2")
library(ggplot2)
qplot(q[1],data=q[4,3,2])
qplot(q[1],data=q)
qplot(q[1],data=q[4,3,2])
df<-q[4,3,2]
View(df)
qf<-subset(q, select=c("FAST","SLOW","OUT"))

View(q)
library(ggplot2)
install.packages("ggplot2")
library(ggplot2)

library(reshape2)
names(q)
names(q) <- c("tt", "OUT",     "SLOW",    "FAST",    "TOT")
View(q)
qf <- q[1:4]
View(qf)
ggplot(melt(qf), aes(x=tt, y=value, fill=variable, group=variable)) + geom_area()
ggplot(melt(qf[1:3]), aes(x=tt, y=value, fill=variable, group=variable)) + geom_area()

ggplot(melt(o[c(1,4,3,2)]), aes(x=x, y=value, fill=variable, group=variable)) + geom_area(position="dodge") + scale_fill_brewer(palette="Dark2") + coord_cartesian(ylim=c(0,100)) + labs(title="Summary (by 10 min)")


m <- subset(d, select=c("tt","node","RX.FAST","RX.SLOW","RX.OUT"))
m.d <- melt(m)
m.d2  <- ddply(m.d, .(variable), transform, rescale = rescale(value))

(pm1 <- ggplot(m.d2, aes(tt, variable)) + geom_tile(aes(fill = value),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue"))
(pm2 <- ggplot(m.d2, aes(varable, node)) + geom_tile(aes(fill = value),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue"))
(pm3 <- ggplot(m.d2, aes(tt, node)) + geom_tile(aes(fill = value),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue"))

m$CTOT <- m$TOT; m$CTOT[m$CTOT>100] <- -10
m$COUT <- m$RX.OUT; m$COUT[m$COUT>100] <- -10
m$CFAST <- m$RX.FAST; m$CFAST[m$CFAST>100] <- -10
m$CSLOW <- m$RX.SLOW; m$CSLOW[m$CSLOW>100] <- -10

(pm <- ggplot(m, aes(tt, node)) + geom_tile(aes(fill = CTOT),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue")) + labs(title="Nodes by Time: TOT (cut > 100 => -10)")
(pm <- ggplot(m, aes(tt, node)) + geom_tile(aes(fill = CFAST),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue")) + labs(title="Nodes by Time: FAST (cut > 100 => -10)")
(pm <- ggplot(m, aes(tt, node)) + geom_tile(aes(fill = CSLOW),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue")) + labs(title="Nodes by Time: SLOW (cut > 100 => -10)")
(pm <- ggplot(m, aes(tt, node)) + geom_tile(aes(fill = COUT),colour = "white") + scale_fill_gradient(low = "white",high = "steelblue")) + labs(title="Nodes by Time: OUT (cut > 100 => -10)")


m$TOT = m$RX.OUT+m$RX.FAST+ m$RX.SLOW +1

m.im <- data.frame( tt=m$tt, node=m$node, rgb=rgb(m$RX.OUT/m$TOT,m$RX.SLOW/m$TOT, m$RX.FAST/m$TOT))

(pm <- ggplot(m.im, aes(tt, node)) + geom_tile(aes(fill = rgb),colour = "white")+ guides(fill=FALSE))

m$TTC <- m$TOT; m$TTC[m$TTC>100] <- 100

m.im2 <- data.frame( tt=m$tt, node=m$node, rgb=hsv(h=(m$RX.OUT+m$RX.SLOW)/m$TOT, s=m$RX.FAST/m$TOT, v=m$TTC/100))



(pm <- ggplot(m.im2, aes(tt, node)) + geom_tile(aes(fill = rgb),colour = "white")+ guides(fill=FALSE) + labs(title="Nodes by Time (hsv(h=OUT+SLOW,s=FAST,v=TOT)"))

cnh.c <- cnh
(pm <- ggplot(cnh, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time (EXP)"))
cnh.c$EXP[cnh.c$EXP>100] <- 100
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time EXP (cut = 100)"))
cnh.c$EXP[cnh.c$EXP>50] <- 50
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time EXP (cut = 50)"))
cnh.c$EXP[cnh.c$EXP>25] <- 25
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time EXP (cut = 25)"))
cnh.c$EXP[cnh.c$EXP>10] <- 10
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time EXP (cut = 10)"))
cnh.c$EXP[cnh.c$EXP>5] <- 5
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time EXP (cut = 5)"))
cnh.c$EXP[cnh.c$EXP>1] <- 1
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = EXP),colour = "white") + scale_fill_gradient(low = "yellow",high = "red")+ labs(title="JB Nodes by Time EXP (cut = 1)"))

(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = TX),colour = "white") + scale_fill_gradient(low = "yellow",high = "steelblue")+ labs(title="JB Nodes by Time TX (uncut)"))
cnh.c$TX[cnh.c$TX>100] <- 100
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = TX),colour = "white") + scale_fill_gradient(low = "yellow",high = "steelblue")+ labs(title="JB Nodes by Time TX (cut = 100)"))
cnh.c$TX[cnh.c$TX>50] <- 50
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = TX),colour = "white") + scale_fill_gradient(low = "yellow",high = "steelblue")+ labs(title="JB Nodes by Time TX (cut = 50)"))
cnh.c$TX[cnh.c$TX>10] <- 10
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = TX),colour = "white") + scale_fill_gradient(low = "yellow",high = "steelblue")+ labs(title="JB Nodes by Time TX (cut = 10)"))
cnh.c$TX[cnh.c$TX>1] <- 1
(pm <- ggplot(cnh.c, aes(ts, node)) + geom_tile(aes(fill = TX),colour = "white") + scale_fill_gradient(low = "yellow",high = "steelblue")+ labs(title="JB Nodes by Time TX (cut = 1)"))


cnh.im <- data.frame( ts=cnh$ts, node=cnh$node, rgb=hsv(h=cnh$EXP/max(cnh$EXP), s=1, v=cnh$TX/max(cnh$TX)))
(pm <- ggplot(cnh.im, aes(ts, node)) + geom_tile(aes(fill = rgb),colour = "white")+ guides(fill=FALSE) + labs(title="JB Nodes by Time (hsv(h=EXP,s=1,v=TX)"))








save.image("~/xfer/20130819-ta/plotz.RData")
