max_num_of_seats <- 76

accepted_seats <- c()

radius <- 2

accepted_seats <- seat_locations$n

for (i in 1:length(accepted_seats)){
  num_to_remove <- c()
  
  if (i <= length(accepted_seats)){
    
    #go through each accepted node and determine if too close
    fixed_seat <- seat_locations[accepted_seats[i],]
    for (m in accepted_seats[i]:accepted_seats[length(accepted_seats)]){
      
      trial_seat <- seat_locations[m,]
      #if too close then a seat number to list
      if (((fixed_seat$x-trial_seat$x)^2 + (fixed_seat$y-trial_seat$y)^2) < radius^2 && fixed_seat$n != trial_seat$n){
        num_to_remove <- c(num_to_remove, m)
      }
    }
    
    #remove the nodes too close from the accepted list
    if (length(num_to_remove) > 0) {
      for (j in 1:length(accepted_seats)){
        for (k in 1:length(num_to_remove)){
          if (j  <= length(accepted_seats)){
            if (accepted_seats[j] == num_to_remove[k]){
              accepted_seats <- accepted_seats[accepted_seats!=num_to_remove[k]]
            }
          }
        }
      }
    }
  }
}

radius <- 1
seats <- remove_seats(seat_locations,radius)
plot(seats$x,seats$y)

print(length(accepted_seats))

seats <- seat_locations[accepted_seats,]

plot(seats$x,seats$y)

carriage_capacity <- (length(accepted_seats)/max_num_of_seats)*100

