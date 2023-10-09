library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("MPG dependency on Cylinders/Gears/Transmission"),
        
        # Sidebar with controls to select the variable to plot against mpg
        sidebarPanel(
                selectInput("variable", "Observed Characteristic:",
                            list("Cylinders" = "cyl", 
                                 "Gears" = "gear",
                                 "Transmission" = "am"))
        ),
        
        # Show the title and plot of the requested variable against mpg
        mainPanel(h3("Formula: "), h3(textOutput("title")),
                  
                  plotOutput("mpgPlot")
        )
))