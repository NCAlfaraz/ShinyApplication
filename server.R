library(shiny)
library(datasets)

# I will use data of the consumption of cars in "miles per gallon" depending on several characteristics. These data are extracted from the mtcars dataset which is inbuild in R.
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
        
        # Compute the forumla text in a reactive expression
        formulaText <- reactive({
                paste("mpg ~", input$variable)
        })
        
        # Return the formula text for printing as a title
        output$title <- renderText({
                formulaText()
        })
        
        # Generate a plot 
        output$mpgPlot <- renderPlot({
                
                plot(formula = as.formula(formulaText()), 
                     data = mpgData,
                     xlab = input$variable,
                     ylab = "mpg",
                     type="p",
                     col = "black")
        })
})