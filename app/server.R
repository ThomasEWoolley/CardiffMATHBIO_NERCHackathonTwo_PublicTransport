options(shiny.maxRequestSize=2000*1024^2)

server <- function(input, output, session) {
  
  usable_seats <- reactive({
    if (input$inputSelect == 1 ){
    seat_locations <- remove_seats(seat_locations,input$SocialDistance)
    }
    else{
      seat_locations <- remove_seats(seat_locations,input$SocialDistance1)
    }
  })
  
  usable_shields <- reactive({
    if (input$inputSelect == 1 ){
      return(shield_locations_to_use(input$ShieldLength,input$NumberofShields,shield_locations))
    }
    else{
      return(use_zig_zag_shields(input$ShieldLength1,input$NumberofShields1,shield_locations))
    }
      
      
  })
  
  shielded_seats <- reactive({
    shield_loc <-   usable_shields()
    heatmaps <- 1
    if (input$inputSelect == 1 ){
    heatmaps <- shielded_heatmapper(seat_locations,shield_loc,input$SocialDistance,domain_x,domain_y)
    seats <- remove_seats_shields(seat_locations,input$SocialDistance,heatmaps)
    }
    else{
      heatmaps <- shielded_heatmapper(seat_locations,shield_loc,input$SocialDistance1,domain_x,domain_y)
      seats <- remove_seats_shields(seat_locations,input$SocialDistance1,heatmaps)
    }
    
    return(seats)
  })
  


  output$capacity <- renderText({
    social_distancing <- 2 #to be overwritten
    if (input$inputSelect == 1 ){
      
      social_distancing <- input$SocialDistance
      
    }
    else{
      
      social_distancing <- input$SocialDistance1
    }
    
    seat_locations <- usable_seats()
    heatmaps <- heatmapper(seat_locations,social_distancing,domain_x,domain_y)
    shield_loc <- usable_shields()
    heatmaps <- shielded_heatmapper(seat_locations,shield_loc,social_distancing,domain_x,domain_y)
    seats <- shielded_seats()
    cap <- nrow(seat_locations)
    paste("Capacity of 1 train carriage is ", round(100*cap/76), "% with social distancing or ", round(100*nrow(seats)/76), "% with shields")
  })

  output$subplots <- renderPlot({
    
    social_distancing <- 2 #to be overwritten
    if (input$inputSelect == 1 ){
      
      social_distancing <- input$SocialDistance
      
    }
    else{
      
      social_distancing <- input$SocialDistance1
    }
    
    
    heatmaps <- heatmapper(seat_locations,social_distancing/2,domain_x,domain_y)
    par(mfrow=c(1,2))
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in 1:nrow(seat_locations)) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seat_locations[j,"x"],seat_locations[j,"y"],pch=19)
    }
    seats <- shielded_seats()
    shield_loc <- usable_shields()
    heatmaps <- shielded_heatmapper(seat_locations,shield_loc,social_distancing/2,domain_x,domain_y)
    par(mar = c(0, 0, 0, 0))
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in seats$n) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seats$x[seats$n==j],seats$y[seats$n==j],pch=19)
    }
    lines(x_box,y_box)
  })
  
  output$train_diagram <- renderPlot({
    
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    IM = readPNG("floorplan2.png")
    rasterImage(IM,0,0,135.6,21.2)
    
  })
  
  output$trainemissions <- renderPlot({
    
    social_distancing <- 2 #to be overwritten
    if (input$inputSelect == 1 ){
      
      social_distancing <- input$SocialDistance
      
    }
    else{
      
      social_distancing <- input$SocialDistance1
    }
    
    pass <- linspace(1, 76, n = 76)
    seat_locations <- usable_seats()
    heatmaps <- heatmapper(seat_locations,social_distancing,domain_x,domain_y)
    shield_loc <- usable_shields()
    heatmaps <- shielded_heatmapper(seat_locations,shield_loc,social_distancing,domain_x,domain_y)
    seats <- shielded_seats()
    cap <- nrow(seat_locations)
    pass_dist <- nrow(seat_locations)
    pass_shield <- nrow(seats)
    plot(pass, emission_per_pass_train(pass),type="l", xlim=c(0,76), ylim=c(0,2200),
         xlab="Number of passengers",ylab=TeX("$CO_{2}$ emissions per passenger (km$^{-1}g$)"),lwd=3)
    abline(h=130.4,lwd=2,col="red",lty="dashed")
    abline(h=215.3,lwd=2,col="blue",lty="dashed")
 
    
    lines(c(0,pass_dist ), c(emission_per_pass_train(pass_dist), emission_per_pass_train(pass_dist)), lty = 1, lwd = 1)
    lines(c(pass_dist, pass_dist), c(0, emission_per_pass_train(pass_dist)), lty = 1, lwd = 1)
    
    lines(c(0,pass_shield ), c(emission_per_pass_train(pass_shield), emission_per_pass_train(pass_shield)), lty = 1, lwd = 1)
    lines(c(pass_shield, pass_shield), c(0, emission_per_pass_train(pass_shield)), lty = 1, lwd = 1)
    
    points(pass_dist,emission_per_pass_train(pass_dist),pch=4,col="chartreuse4",cex=2,lwd = 2)
    points(pass_shield,emission_per_pass_train(pass_shield),pch=4,col="darkorchid",cex=2,lwd=2)
    legend("topright",c("Train","Small car","Large car","Capacity with distancing","Capacity with shielding"),lwd=c(3,2,2,2,2), lty=c(1,5,5,0,0), pch=c(NA,NA,NA,4,4),col=c("black","red","blue","chartreuse4","darkorchid"))
    box(bty="l")
    axis(2)
    axis(1) 
  })
  
  output$social_distanced_capacity <- renderPlot({
    
    social_distancing <- 2 #to be overwritten
    if (input$inputSelect == 1 ){
      
      social_distancing <- input$SocialDistance
      
    }
    else{
      
      social_distancing <- input$SocialDistance1
    }
    
    
    seat_locations <- usable_seats()
    heatmaps <- heatmapper(seat_locations,social_distancing/2,domain_x,domain_y)
    par(mar = c(0, 0, 0, 0))
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in 1:nrow(seat_locations)) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seat_locations[j,"x"],seat_locations[j,"y"],pch=19)
    }
    lines(x_box,y_box)
  }, height=75)
  
  output$shielded_capacity <- renderPlot({
    
    social_distancing <- 2 #to be overwritten
    if (input$inputSelect == 1 ){
      
      social_distancing <- input$SocialDistance
      
    }
    else{
      
      social_distancing <- input$SocialDistance1
    }
    
    
    seats <- shielded_seats()
    shield_loc <- usable_shields()
    heatmaps <- shielded_heatmapper(seat_locations,shield_loc,social_distancing/2,domain_x,domain_y)
    par(mar = c(0, 0, 0, 0))
    plot(NULL, xlim=c(0,domain_x), ylim=c(0,domain_y), asp=1, axes=FALSE, xlab="", ylab="")
    for (j in seats$n) {
      par(fig=c(0,1,0,1))
      idx1 <- 1+100*(j-1)
      idx2 <- 100*(j-1) + 100
      polygon(x=heatmaps[1,idx1:idx2],y=heatmaps[2,idx1:idx2],col=rgb(1, 0, 0,0.1))
      points(seats$x[seats$n==j],seats$y[seats$n==j],pch=19)
    }
    lines(x_box,y_box)
  }, height=75)
  
  
}
