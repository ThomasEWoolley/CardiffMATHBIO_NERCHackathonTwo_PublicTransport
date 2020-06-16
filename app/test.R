setwd("C:/Users/lucy_/covid-recovery/")
library(png)
IM = readPNG("floorplan.png")

PTS = read.table(text="x y
1 5
100 5
20 10", 
                 header=TRUE)



plot(NULL, xlim=c(0,135.6), ylim=c(0,21.2), axes=FALSE, xlab="", ylab="")
rasterImage(IM,0,0,135.6,21.2)
x <- 3
y <- 2
points(y,x, pch=20, col="red")

plot(NULL, xlim=c(0,135.6), ylim=c(0,21.2), axes=FALSE, xlab="", ylab="")
rasterImage(IM,0,0,135.6,21.2)
xs <- c(3,9.5,16.5,23,29.5,38.5,44.5,50.8,60,66,75.5,81.5,91,97.5,104,111.5,118,124,133)
ys <- c(rep(2.5,19), rep(6.5,19), rep(15,19), rep(18.5,19))
xs <- rep(xs,4)
points(y=ys,x=xs, pch=20, col="red",cex=2)

