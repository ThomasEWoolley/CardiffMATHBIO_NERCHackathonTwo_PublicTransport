

# Define UI for data upload app ----
ui <- fluidPage(
  titlePanel("Capacity of public transport system given social distancing measures"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("SocialDistance", h3("Social distancing rule"),
                  min = 0.5, max = 3, value = 2)
                ),
    mainPanel(textOutput("capacity"),
             # plotOutput("full_capacity"),
              plotOutput("social_distanced_capacity"),
              plotOutput("shielded_capacity")
              )
  )
)
      