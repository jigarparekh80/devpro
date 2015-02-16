
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Iris Data"),

  h5("This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica."),
  h5("This Shiny App uses this data and build random forest model to predict species based on user model."),
  h5("As shown in feature importance petal width & petal hight are most important feature to classify species properly."),
  h5("Please wait for while to update species as this Shiny app is running on medium size server"),
  # Sidebar with a slider input for number of bins
  h4("Select flower's sepal & petal length & width to predict species."),  
  sidebarLayout(
    sidebarPanel(
      
      h5("All measurements are in centimeters"),
      sliderInput("Sepal_Length",
                  "Sepal Length:",
                  min = 4.3,
                  max = 7.9,
                  step = 0.1,
                  value = 4.3),
      sliderInput("Sepal_Width",
                  "Sepal Width:",
                  min = 2,
                  max = 4.4,
                  step = 0.1,
                  value = 2),
      sliderInput("Petal_Length",
                  "Petal Length:",
                  min = 1,
                  max = 6.9,
                  step = 0.1,
                  value = 1),
      sliderInput("Petal_Width",
                  "Petal Width:",
                  min = 0.1,
                  max = 2.5,
                  step = 0.1,
                  value = 0.1)      
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      h3('Predicted Species based on input value'),
      h5('The species are Iris setosa, versicolor, and virginica.'),
      verbatimTextOutput("pValue"),
      h5("Error Rate:"),
      verbatimTextOutput("errorRate"),
      h5('Feature Importance:'),
      tableOutput("results")
    )
  )
))
