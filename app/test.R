xs <- c(rep(3,4),rep(9.5,4),rep(16.5,4),rep(23,4),rep(29.5,4),rep(38.5,4),rep(44.5,4),rep(50.8,4),rep(60,4),rep(66,4),rep(75.5,4),rep(81.5,4),rep(91,4),rep(97.5,4),rep(104,4),rep(111.5,4),rep(118,4),rep(124,4),rep(133,4))
ys <- rep(c(2.5,6.5,15,18.5),19)#c(rep(2.5,19), rep(6.5,19), rep(15,19), rep(18.5,19))
seat_locations$xs = xs
seat_locations$ys = ys
write.csv(seat_locations,"seat_locations.csv")

# Define UI for data upload app ----
ui <- fluidPage(
  titlePanel("Capacity of public transport system given social distancing measures"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("SocialDistance", h3("Social distancing rule"),
                  min = 0.5, max = 3, value = 2)
    ),
    mainPanel(textOutput("capacity"),
              plotOutput("social_distanced_capacity"),
              plotOutput("shielded_capacity")
    )
  )
  
  
  install.packages("imager")
  
  library(imager)
  
  
  file <- system.file('floorplan.png',package='imager')
  #system.file gives the full path for a file that ships with a R package
  #if you already have the full path to the file you want to load just run:
  #im <- load.image("/somedirectory/myfile.png")
  im <- load.image(file)
  
  plot(im) #Parrots!
  
  
  
png(filename="floorplan.png")

