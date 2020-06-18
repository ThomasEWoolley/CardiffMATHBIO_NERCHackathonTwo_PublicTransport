

ui <- fluidPage(
  
  fluidRow(
    column(3,      h1("Write some instructions in here", align = "center")),
    
    column(3,      sliderInput("NumberofShields", h3("Number of shields", align = "center"),
                               min = 1, max = 36, value = 1,width='100%')),
    column(3,      sliderInput("ShieldLength", h3("Length of shield", align = "center"),
                               min = 0, max = 1.16, value =1.16,width='100%')),
    
    column(3,      sliderInput("SocialDistance", h3("Social distancing rule (m)", align = "center"),
                               min = 0.5, max = 3, value = 2,width='100%'))

    
  ),
  
  fluidRow(
    column(12, textOutput("capacity"),),
  
  ),
  
  fluidRow(
    
    column(6, h3("Usable train seats", align = "center", width = '100%'),
           plotOutput("social_distanced_capacity")),
    
    column(6, h3("Usable train seats with shielding", align = "center", width = '100%'),
           plotOutput("shielded_capacity"))
  ),
  
  fluidRow(
    column(4),
    column(4, h3("Emissions per passenger", align = "center", width='50%'),
           plotOutput("trainemissions"))
    
  ),
  
  
  fluidRow(
    column(12,      h1("Train plan", align = "center"),
           img(src="train_floorplan.png",width="750", height="190")
    )
  )
    
)
