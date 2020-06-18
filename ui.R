

ui <- fluidPage(
  #titlePanel("Basic widgets"),
  
  fluidRow(
    column(3,      h1("Write some instructions in here", align = "center")),
    
    column(3,      sliderInput("NumberofShields", h3("Number of shields", align = "center"),
                               min = 1, max = 36, value = 0,width='100%')),
    column(3,      sliderInput("ShieldLength", h3("Length of shield", align = "center"),
                               min = 0, max = 1.16, value =1.16,width='100%')),
    column(3,      sliderInput("SocialDistance", h3("Social distancing rule (m)", align = "center"),
                               min = 0.5, max = 3, value = 2,width='100%')),
    
    

  ),
  
  fluidRow(
    column(6,      h1("Trains", align = "center"),
           img(src="floorplan2.png")
     #     plotOutput("train_diagram")
           )
    
    
  ),
  
  fluidRow(
    
    column(3, h3("Usable train seats", align = "center"),
           plotOutput("social_distanced_capacity")),
    
    column(3, h3("Usable train seats with shielding", align = "center"),
           plotOutput("shielded_capacity")),
    
    column(3, h3("Usable bus seats", align = "center")),
    
    column(3, h3("Usable bus seats with shielding", align = "center"))
  ), 
  
  fluidRow(
    
    column(6, h3("Emissions per passenger", align = "center")),
    
    column(6, h3("Emissions per passenger", align = "center"))
  )
)
