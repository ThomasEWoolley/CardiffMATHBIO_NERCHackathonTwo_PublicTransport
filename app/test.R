heatmapper(nodes, radius,shield,domain_x,domain_y)

seat_locations <- read.csv(file="seat_locations.csv")
nodes <- cbind(seat_locations$x,seat_locations$y)

theta <- linspace(0,2*pi,100)
heatmaps <- rep(0,100) #Coords of boundary

for (j in 1:length(nodes[,1])) {
  x_circle <- radius*cos(theta) + nodes[j,1]
  y_circle <- radius*sin(theta) + nodes[j,2]
}


xs <- c(rep(3,4),rep(9.5,4),rep(16.5,4),rep(23,4),rep(29.5,4),rep(38.5,4),rep(44.5,4),rep(50.8,4),rep(60,4),rep(66,4),rep(75.5,4),rep(81.5,4),rep(91,4),rep(97.5,4),rep(104,4),rep(111.5,4),rep(118,4),rep(124,4),rep(133,4))
ys <- rep(c(2.5,6.5,15,18.5),19)#c(rep(2.5,19), rep(6.5,19), rep(15,19), rep(18.5,19))
seat_locations$xs = xs
seat_locations$ys = ys
write.csv(seat_locations,"seat_locations.csv")
##########################################

#############################

install.packages("matconv")
library(matconv)
mat2r("node_coordinates.m",pathOutR = "node_coordinates.r")