###########################################################################
#
# server.R (user interface)
# 
# This is the server logic for a Shiny web application. (Backend)
#
# Project: minimal
# Author: Dominik Hattrup (dominik@hattrup.eu)
# Date: 2016 May 14
#
###########################################################################


# load packages -----------------------------------------------------------

library(shiny)

# server logic ------------------------------------------------------------

# Hier steckt die ganze Logik deiner Application

# function verarbeitet den input und gibt den Output zurück an die ui.R

shinyServer(
  function(input, output) {
  
  output$textDisplay <- renderText({
    paste0("Dominik findet R '", input$comment, "'. There are ", nchar(input$comment), " characters in this.")
  })
})
