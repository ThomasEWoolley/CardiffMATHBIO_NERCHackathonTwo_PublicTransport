library(shiny)
library(shinyMatrix)
library(grid)
library(gridExtra)
library(reshape2)
library(DT)
library(png)
library(tools)
library(pracma)

setwd("C:/Users/lucy_/covid-recovery/")

seat_locations <- read.csv(file="seat_locations.csv")
shield_locations <- read.csv(file="shield_locations.csv")

domain_x <- 20.4
domain_y <- 2.82

source("app/ui.R")
source("app/server.R")
source("app/src.R")

shinyApp(ui = ui, server = server)
