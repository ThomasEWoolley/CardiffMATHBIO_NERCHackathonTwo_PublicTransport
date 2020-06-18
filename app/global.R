library(shiny)
library(grid)
library(gridExtra)
library(reshape2)
library(png)
library(tools)
library(pracma)

#setwd("C:/Users/lucy_/covid-recovery/app")

seat_locations <- read.csv(file="seat_locations.csv")
shield_locations <- read.csv(file="shield_locations.csv")

domain_x <- 20.4
domain_y <- 2.82

source("ui.R")
source("server.R")
source("src.R")

shinyApp(ui = ui, server = server)
