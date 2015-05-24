library(shiny)
library(UsingR)
data(galton)
library(ggplot2)

model <- lm(child ~ parent, data = galton)

predictHight <- function(ph) {
  input = data.frame(c(ph))
  names(input) = c("parent")
  predict(model, newdata = input)
}

shinyServer(
  function(input, output) {
    output$higthPlot <- renderPlot({
      parentHight <- input$ph
      childHight <- predictHight(parentHight)
      qplot(parent, child, data = galton, geom = c("point", "smooth"), method = "lm") +
        geom_vline(xintercept = parentHight, colour="red") +
        geom_hline(yintercept = childHight, colour="green", title="dupa") +
        geom_point(x = parentHight, y = childHight, size=3, colour="red")
    })
    
    output$predictedHight = renderText({predictHight(input$ph)})
    output$parentHight = renderText({input$ph})
  }
)