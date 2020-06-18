

ui <- fluidPage(
  
  fluidRow(
    column(3,     radioButtons(
      "inputSelect",
      label = ("Choose shield patterning:"),
      choices = c(
        "Standard shield patterning" = 1,
        "Zig-Zag shield patterning" = 0
      ),
      selected = 1)),
  ),
    
  conditionalPanel(condition = "input.inputSelect == 1",
    column(4,      sliderInput("NumberofShields", h4("Number of shields", align = "center"),
                               min = 1, max = 36, value = 10,width='100%')),
    column(4,      sliderInput("ShieldLength", h4("Length of shield", align = "center"),
                               min = 0, max = 1.16, value =1.16,width='100%')),
    
    column(4,      sliderInput("SocialDistance", h4("Social distancing rule (m)", align = "center"),
                               min = 0.5, max = 3, value = 2,width='100%'))

    
  ),
  
  conditionalPanel(condition = "input.inputSelect == 0",
                   column(4,      sliderInput("NumberofShields1", h4("Number of shields", align = "center"),
                                              min = 1, max = 18, value = 10,width='100%')),
                   column(4,      sliderInput("ShieldLength1", h4("Length of shield", align = "center"),
                                              min = 0, max = 1.16, value =1.16,width='100%')),
                   
                   column(4,      sliderInput("SocialDistance1", h4("Social distancing rule (m)", align = "center"),
                                              min = 0.5, max = 3, value = 2,width='100%'))
                   
                   
  ),
  
  fluidRow(
    column(12, textOutput("capacity"))
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
