library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predict how high will your child"),
  sidebarPanel(
    sliderInput('ph', 'Your high', value = 65, min = 60, max = 75, step = 0.05,)
  ),
  mainPanel(
    plotOutput('higthPlot'),
    p('Your hight'),
    textOutput('parentHight'),
    p('Child predicted hight'),
    textOutput('predictedHight')
  )
))