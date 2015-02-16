
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  data(iris)
  library(randomForest)  
  library(e1071)
  fit<-randomForest(Species ~.,data=iris,ntree=50)
  
  output$errorRate <- renderPrint(mean(fit$err.rate)*100)
  output$results <- renderTable(fit$importance)
  
  output$pValue <- renderPrint(as.character(predict(fit,
                                       data.frame(
                                         Sepal.Length=input$Sepal_Length,
                                         Sepal.Width=input$Sepal_Width,
                                         Petal.Length=input$Petal_Length,
                                         Petal.Width=input$Petal_Width))))
    
})
