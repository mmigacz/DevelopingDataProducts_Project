# DevelopingDataProducts_Project

### Summary
This simple shiny app enables to predict children height with selected parent's height. It builds a linear model with R's embedded Galton's height data for parents and children, and next uses it to predict children height's. The following code is used to built the model:

`model <- lm(child ~ parent, data = galton`

Galton's data, the linear model, selected parent's height (vertical line) and predicted (horizontal line) are visualized on the right diagram

      
### Run      
To run this application:

* download this repo
* change working directory to this which contains *ui.R* and *server.R*
* run `runApp()`
* use a slider to change parent hight
