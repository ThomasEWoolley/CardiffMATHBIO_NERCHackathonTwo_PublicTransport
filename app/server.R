options(shiny.maxRequestSize=2000*1024^2)

server <- function(input, output, session) {

  output$capacity <- renderText({
    cap <- capacity(2.7,26,input$SocialDistance)
    paste("Capacity of 1 train carriage is ", cap , "/92 = ", round(100*cap/92), "%")
  })

  output$plot <- renderPlot({
    
    xs <- c(3,9.5,16.5,23,29.5,38.5,44.5,50.8,60,66,75.5,81.5,91,97.5,104,111.5,118,124,133)
    ys <- c(rep(2.5,19), rep(6.5,19), rep(15,19), rep(18.5,19))
    xs <- rep(xs,4)
    plot(NULL, xlim=c(0,135.6), ylim=c(0,21.2), axes=FALSE, xlab="", ylab="")
    IM = readPNG("floorplan.png")
    rasterImage(IM,0,0,135.6,21.2)
    points(y=ys,x=xs, pch=15, col="red",cex=3)
  })
  
}
