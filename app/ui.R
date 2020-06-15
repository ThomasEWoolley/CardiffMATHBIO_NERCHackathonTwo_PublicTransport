

# Define UI for data upload app ----
ui <- fluidPage(
  titlePanel("Capacity of public transport system given social distancing measures"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("SocialDistance", h3("Social distancing rule"),
                  min = 0.5, max = 3, value = 2),
    sliderInput("HomeWorkers", h3("Percentage of workers home working"),
                                     min = 0, max = 100, value = 50)
                ),
    mainPanel(h3("PLOT"),
              textOutput("capacity"),
              plotOutput("plot")
              )
  )
)
      