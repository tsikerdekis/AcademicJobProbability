#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Academic Job Probability (default val source: 2015 Taulbee Survey for US-CA CS and CE jobs)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("N", "Total actual positions/universities of interest in applying in (N).", 6788),
       textInput("w", "Pool of candidates competing against available positions (w).", 1780),
       textInput("p", "Probability that one of the N positions/universities will have an open position (p). 892 open positions / N", 0.134)
    ),
    mainPanel(
      textOutput("text1"),
      uiOutput("formula")
    )
    

  )
))
