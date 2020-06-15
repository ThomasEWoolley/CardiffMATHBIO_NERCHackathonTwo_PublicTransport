options(shiny.maxRequestSize=2000*1024^2)

server <- function(input, output, session) {

  output$capacity <- renderText({
    paste("Capacity of 1 train carriage is ", capacity(2.7,26,input$SocialDistance))
  })

  output$plot <- renderPlot({
    plot(input$SocialDistance, input$HomeWorkers)
  })
  
}
