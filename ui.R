library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predict children height with parent height"),
  sidebarPanel(
    sliderInput('ph', "Select parent's height [ft]", value = 65, min = 60, max = 75, step = 0.05,),
    
    h4("Selected parent's height [ft]"),
    div(textOutput('parentHight'), style = "color:red; font-weight: bold"),
    
    br(),
    h4('Predicted children height [ft]'),
    div(textOutput('predictedHight'), style = "color:green; font-weight: bold"),
    
    br(),
    hr(),
    h2('Help'),
    p("This simple shiny app enables to predict children height with selected parent's height. It builds a linear model with 
      R's embedded Galton's height data for parents and children, and next uses it to predict children height's. 
      The following code is used to built the model"),
    code("model <- lm(child ~ parent, data = galton)"),
    br(),
    p("Galton's data, the linear model, selected parent's height (vertical line) and predicted (horizontal line) are visualized on the right diagram")
  ),
  mainPanel(
    plotOutput('higthPlot')
  )
))