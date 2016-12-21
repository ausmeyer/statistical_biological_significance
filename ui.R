library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("healthy.pop.size",
                  "Healthy Population Size",
                  min = 0,
                  max = 8000,
                  value = 4000,
                  step = 10),
      sliderInput("disease.pop.size",
                  "Disease Population Size",
                  min = 0,
                  max = 8000,
                  value = 500,
                  step = 10),
      sliderInput("diff",
                  "Mean Difference",
                  min = 0,
                  max = 2.5,
                  value = 0.5,
                  step = 0.01),
      sliderInput("spread",
                  "Standard Deviation",
                  min = 0,
                  max = 3,
                  value = 1.2,
                  step = 0.1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))