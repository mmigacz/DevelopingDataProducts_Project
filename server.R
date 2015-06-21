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
        geom_vline(aes(xintercept = parentHight), colour="red", show_guide = F) +
        geom_hline(aes(yintercept = childHight, linetype="children"), colour="green", show_guide = T) +
        geom_point(x = parentHight, y = childHight, size=3, colour="red") +
        labs(title = "Galton's height data for children vs. parent with linear model") +
        labs(x = "Parent height [ft]", y = "Children height [ft]") +
        scale_linetype_manual(name = "Height", 
                              values = c("children" = 1),guide = "legend")+
        guides(colour = guide_legend(override.aes = list(linetype = 0 )), 
               fill = guide_legend(override.aes = list(linetype = 0 )), 
               shape = guide_legend(override.aes = list(linetype = 0 )), 
               linetype = guide_legend()) 
    })
    
    output$predictedHight = renderText({predictHight(input$ph)})
    output$parentHight = renderText({input$ph})
  }
)