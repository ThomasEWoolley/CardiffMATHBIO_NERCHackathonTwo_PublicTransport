options(shiny.maxRequestSize=2000*1024^2)

server <- function(input, output, session) {
  
  usable_seats <- reactive({
    seat_locations <- read.csv(file="seat_locations.csv")
    seat_locations <- remove_seats(seat_locations,input$SocialDistance)
  })

  output$capacity <- renderText({
    seat_locations <- usable_seats()
    cap <- nrow(seat_locations)
    paste("Capacity of 1 train carriage is ", round(100*cap/76), "%")
  })

  output$full_capacity <- renderPlot({
    seat_locations <- read.csv(file="seat_locations.csv")
    plot(NULL, xlim=c(0,135.6), ylim=c(0,21.2), axes=FALSE, xlab="", ylab="")
    IM = readPNG("floorplan.png")
    rasterImage(IM,0,0,135.6,21.2)
    points(y=seat_locations$ys,x=seat_locations$xs, pch=15, col="red",cex=3)
  })
  
  output$social_distanced_capacity <- renderPlot({
    seat_locations <- usable_seats()
   # print(nrow(seat_locations))
    plot(NULL, xlim=c(0,135.6), ylim=c(0,21.2), axes=FALSE, xlab="", ylab="")
    IM = readPNG("floorplan.png")
    rasterImage(IM,0,0,135.6,21.2)
    points(y=seat_locations$ys,x=seat_locations$xs, pch=15, col="red",cex=3)
  })
  
  
}
