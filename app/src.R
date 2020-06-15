
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
