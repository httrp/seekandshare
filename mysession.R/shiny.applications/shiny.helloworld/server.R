###########################################################################
#
# server.R (user interface)
# 
# This is the server logic for a Shiny web application. (Backend)
#
# Project: shiny.helloworld
# Author: Dominik Hattrup (dominik@hattrup.eu)
# Date: 2016 May 14
#
###########################################################################


# load packages -----------------------------------------------------------

library(shiny)

# server logic ------------------------------------------------------------

shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })

})
