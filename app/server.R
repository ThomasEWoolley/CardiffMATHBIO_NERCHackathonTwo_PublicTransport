options(shiny.maxRequestSize=2000*1024^2)

server <- function(input, output, session) {
  
  usable_seats <- reactive({
    seat_locations <- remove_seats(seat_locations,input$SocialDistance)
  })
  
  shielded_seats <- reactive({
    heatmaps <- 1
    heatmaps <- shielded_heatmapper(seat_locations,shield_locations,input$SocialDistance,domain_x,domain_y)
    seats <- remove_seats_shields(seat_locations,input$SocialDistance,heatmaps)
    return(seats)
  })

  output$capacity <- renderText({
    seat_locations <- usable_seats()
    heatmaps <- heatmapper(seat_locations,input$SocialDistance,domain_x,domain_y)
    heatmaps <- shielded_heatmapper(seat_locations,shield_locations,input$SocialDistance,domain_x,domain_y)
    seats <- shielded_seats()
    cap <- nrow(seat_locations)
    paste("Capacity of 1 train carriage is ", round(100*cap/76), "% with social distancing or ", round(100*nrow(seats)/76), "% with shields")
  })

  output$full_capacity <- renderPlot({
    heatmaps <- heatmapper(seat_locations,input$SocialDistance/2,domain_x,domain_y)
    
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in 1:nrow(seat_locations)) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seat_locations[j,"x"],seat_locations[j,"y"],pch=19)
    }
  })
  
  output$social_distanced_capacity <- renderPlot({
    
    seat_locations <- usable_seats()
    heatmaps <- heatmapper(seat_locations,input$SocialDistance/2,domain_x,domain_y)
    par(mar = c(0, 0, 0, 0))
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in 1:nrow(seat_locations)) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seat_locations[j,"x"],seat_locations[j,"y"],pch=19)
    }
  }, height=75)
  
  output$shielded_capacity <- renderPlot({
    seats <- shielded_seats()
    heatmaps <- shielded_heatmapper(seat_locations,shield_locations,input$SocialDistance,domain_x,domain_y)
    par(mar = c(0, 0, 0, 0))
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in seats$n) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seats$x[seats$n==j],seats$y[seats$n==j],pch=19)
    }
  }, height=75)
  
  
}
