

ui <- fluidPage(
  #titlePanel("Basic widgets"),
  
  fluidRow(
    column(6,      h1("Write some instructions in here")),
    
    column(6,      sliderInput("SocialDistance", h3("Social distancing rule"),
                               min = 0.5, max = 3, value = 2))
    

  ),
  
  fluidRow(
    
    column(3, h3("Usable train seats"),
           plotOutput("social_distanced_capacity"),
           textOutput("capacity")),
    
    column(3, h3("Usable train seats with shielding"),
           plotOutput("shielded_capacity")),
    
    column(3, h3("Usable bus seats")),
    
    column(3, h3("Usable bus seats with shielding"))
  )
)
