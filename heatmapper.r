radius <- 2
domain_x <- 20.4
domain_y <- 2.82

install.packages("pracma")


seat_locations <- read.csv(file="seat_locations.csv")
shield_locations <- read.csv(file="shield_locations.csv")
radius <- 2
heatmaps <- heatmapper(seat_locations,radius,domain_x,domain_y)
heatmaps <- shielded_heatmapper(seat_locations,shield_locations,radius,domain_x,domain_y)
seats <- remove_seats_shields(seat_locations,radius,heatmaps)
heatmaps <- shielded_heatmapper(seat_locations,shield_locations,radius/2,domain_x,domain_y)#heatmapper(seat_locations,radius/2,domain_x,domain_y)
plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
for (j in seats$n) {
  par(fig=c(0,1,0,1))
  idx1 <- 1+100*(j-1)
  idx2 <- 100*(j-1) + 100
  polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
  points(seats$x[seats$n==j],seats$y[seats$n==j],pch=19)
}


  

heatmapper <- function(seat_locations,radius,domain_x,domain_y) {
  theta <- seq(0, 2*pi, length.out = 100)
  heatmaps <- array(numeric(),c(2,100*nrow(seat_locations)))
  for (j in 1:nrow(seat_locations)) {
    x_circle <- radius*cos(theta) + seat_locations[j,"x"]
    y_circle <- radius*sin(theta) + seat_locations[j,"y"]
    x_circle[x_circle<0] <- 0
    x_circle[x_circle>domain_x] <- domain_x
    y_circle[y_circle<0] <- 0
    y_circle[y_circle>domain_y] <- domain_y
    idx1 <- 1+100*(j-1)
    idx2 <- 100*(j-1) + 100
    heatmaps[1,idx1:idx2] <- x_circle
    heatmaps[2,idx1:idx2] <- y_circle
  }
  heatmaps
}

shielded_heatmapper <- function(seat_locations,shield_locations,radius,domain_x,domain_y) {
  for (j in 1:nrow(seat_locations)) {
    shield_interact <- c()
    x_circle <- radius*cos(theta) + seat_locations[j,"x"]
    y_circle <- radius*sin(theta) + seat_locations[j,"y"]
    x_circle[x_circle<0] <- 0
    x_circle[x_circle>domain_x] <- domain_x
    y_circle[y_circle<0] <- 0
    y_circle[y_circle>domain_y] <- domain_y
    for (i in 1:nrow(shield)) {
      shield_y <- seq(shield[i,3],shield[i,4],length.out=100)
      shield_x <- rep(shield[i,1],100)
      distance2 <- (shield_x-seat_locations[j,"x"])^2 + (shield_y-seat_locations[j,"y"])^2
      if (min(distance2) < radius^2) {
        if (shield[i,1] < seat_locations[j,"x"]) {     
          x_circle[x_circle<shield[i,1] & y_circle < max(shield_y) & y_circle>min(shield_y)] <- shield_x[x_circle < shield[i,1] & y_circle< max(shield_y) & y_circle> min(shield_y)]
        }
        else {
          x_circle[x_circle>shield[i,1] & y_circle < max(shield_y) & y_circle>min(shield_y)] <- shield_x[x_circle > shield[i,1] & y_circle< max(shield_y) & y_circle> min(shield_y)]
        }
      }
    }
    idx1 <- 1+100*(j-1)
    idx2 <- 100*(j-1) + 100
    heatmaps[1,idx1:idx2] <- x_circle
    heatmaps[2,idx1:idx2] <- y_circle
  }
  heatmaps
}

heatmaps <- shielded_heatmapper(seat_locations,shield_locations,radius,domain_x,domain_y)


plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
for (j in 1:nrow(seat_locations)) {
  par(fig=c(0,1,0,1))
  idx1 <- 1+100*(j-1)
  idx2 <- 100*(j-1) + 100
  polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
  points(seat_locations[j,"x"],seat_locations[j,"y"],pch=19)
}

