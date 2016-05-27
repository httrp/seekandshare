###########################################################################
#
# ui.R (user interface)
# 
# This is the user-interface definition of a Shiny web application. (Frontend)
#
# Project: minimal
# Author: Dominik Hattrup (dominik@hattrup.eu)
# Date: 2016 May 14
#
###########################################################################


# load packages -----------------------------------------------------------

library(shiny)

# user interface ----------------------------------------------------------

# Die grundsätzliche Struktur des User Interfaces, eine Seite mit Hauptframe und Seitenleiste und Seitentitel:

# shinyUI(pageWithSidebar(
#  headerPanel(), 
#  sidebarPanel(),
#  mainPanel)
# )

# textInput() -- Ein Eingabefeld // kann von der Server.ui verarbeitet werden
# h3 -- eine Überschrift
# textOuput --- ein Outputfeld // kommt von der server.ui

# Define User Interface 
shinyUI(
  pageWithSidebar(
  headerPanel("Minimal"),
  sidebarPanel(
    textInput(inputId = "comment", label = "R ist ...", value = "") # einem Textfeld
  ),
  mainPanel (
    h3("Dominik findet: "),
    textOutput("textDisplay") 
  )
))
