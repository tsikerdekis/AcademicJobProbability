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
      tags$h2(textOutput("text1")),
      tags$hr(),
      uiOutput("formula1")
    )
  ),
  
  titlePanel("Number of applications and probability of getting a job"),
  tags$p("The general idea, is estimating the probability for a department that will have at least an open job (n=1,...) and that you will get that job compared to other applicants (w). The assumption is that candidates are chosen at random (obviously not true so problem is somewhat simplified). Based on that probability (P) then we estimate what is the probability of getting a job based on the number of applications (s)."),
  sidebarLayout(
    sidebarPanel(
      textInput("xN", "Avg number of positions in a department of interest (N).", 10),
      textInput("xw", "Avg number of applicants for an open position in a department (w).", 100),
      textInput("xp", "Probability that a position will become open. (p)", 0.44),
      textInput("xs", "Number of applications submitted to departments (s)", 10)
    ),
    mainPanel(
      tags$h2(textOutput("text2")),
      tags$hr(),
      uiOutput("formula2")
    )
  ),
  
  tags$p("Michael Tsikerdekis Creative Commons 4.0 Share-Alike, tsikerdekis@gmail.com")
  
))
