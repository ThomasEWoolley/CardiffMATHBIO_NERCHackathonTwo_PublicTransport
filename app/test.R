xs <- c(rep(3,4),rep(9.5,4),rep(16.5,4),rep(23,4),rep(29.5,4),rep(38.5,4),rep(44.5,4),rep(50.8,4),rep(60,4),rep(66,4),rep(75.5,4),rep(81.5,4),rep(91,4),rep(97.5,4),rep(104,4),rep(111.5,4),rep(118,4),rep(124,4),rep(133,4))
ys <- rep(c(2.5,6.5,15,18.5),19)#c(rep(2.5,19), rep(6.5,19), rep(15,19), rep(18.5,19))
seat_locations$xs = xs
seat_locations$ys = ys
write.csv(seat_locations,"seat_locations.csv")