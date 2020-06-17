remove_seats <- function(seat_locations,radius) {
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
  print(accepted_seats)
  seat_locations[accepted_seats,]
}



capacity <- function(width,length,radius) {
  first_x_node <- 0
  second_x_node <- (sqrt(2)/2)*radius
  third_x_node <- 0
  
  first_row <- c()
  second_row <- c()
  third_row <- c()
  
  if (sqrt(2)*radius<width) {
    while (first_x_node < length) {
      first_row <- c(first_row,first_x_node)
      first_x_node <- first_x_node + radius
    }
    while (second_x_node < length) {
      second_row <- c(second_row,second_x_node)
      second_x_node <- second_x_node + radius
    }
    while (third_x_node < length) {
      third_row <- c(third_row,third_x_node)
      third_x_node <- third_x_node + radius
    }
  } else {
    while (first_x_node < length) {
      first_row <- c(first_row,first_x_node)
      first_x_node <- first_x_node + radius
    }
    while (third_x_node < length) {
      third_row <- c(third_row,third_x_node)
      third_x_node <- third_x_node + radius
    }
  }
  length(c(first_row,second_row,third_row))
}

width <- 2.7
length <- 26
radius <- 2
capacity(width,length,radius)
