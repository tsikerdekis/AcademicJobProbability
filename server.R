#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$text1 <- renderText({ 
    
    N = as.numeric(input$N) #total number of available positions
    w = as.numeric(input$w) # Number of people that can potentially apply (fresh graduates)
    p = as.numeric(input$p) # Probability that a job will become available in a university. 800 positions last year / 6788 positions ~ 0.12
    
    # For correctness check, set 100, 100, 0.12, result must be 0.12
    
    # Scaling to avoid choose hitting max
    if (N > 1000 || w > 1000) {
      N = round(N / 100)
      w = round(w / 100)
    }
    
    # Estimate probabilities for which there is a pool of candidates in relation to the positions n < w, when available open position in a university are smaller than w candidates
    # In other words, this is the probability of being selected out of the waitlist
    summedprobs1 = 0
    for (n in 0:w-1) {
      summedprobs1 = summedprobs1 + (n/w * choose(N, n) * p^n * (1-p)^(N-n))
    }
    
    # In case  n > w, more jobs than available pool aplicants (then every subsequent probability is a given job taken)
    summedprobs2 = 0
    for (n in w:N) {
      summedprobs2 = summedprobs2 + (choose(N, n) * p^n * (1-p)^(N-n))
    }

    paste("You have a ",round((summedprobs1 + summedprobs2)*100,2),"% chance of getting a position.",sep="")
    
  })
  
  output$formula <- renderUI({
    withMathJax(paste0("Formula used: $$\\sum_{n=0}^{w-1} \\frac{n}{w} {N \\choose n} p^n (1-p)^{N-n} + \\sum_{n=w}^{N} {N \\choose n} p^n (1-p)^{N-n} $$"))
  })
})
