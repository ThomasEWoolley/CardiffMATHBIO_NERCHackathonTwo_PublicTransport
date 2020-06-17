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

domain_x <- 20.4
domain_y <- 2.82

source("app/ui.R")
source("app/server.R")
source("app/src.R")

shinyApp(ui = ui, server = server)
