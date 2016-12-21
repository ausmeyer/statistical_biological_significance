library(shiny)
library(ggplot2)
library(grid)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    low.side <- 10/2 - input$diff/2
    high.side <- 10/2 + input$diff/2
    norm1 <- rnorm(input$healthy.pop.size, mean = low.side, sd = input$spread)
    norm2 <- rnorm(input$disease.pop.size, mean = high.side, sd = input$spread)
    t.result <- t.test(norm1, norm2)
    p <- ggplot(data.frame(data = c(norm1, norm2), Groups = c(rep('No Disease', length(norm1)), rep('Disease', length(norm2)))), aes(data, color = Groups)) + 
      geom_histogram(binwidth = 0.2, position = "dodge", fill = 'white', alpha = 0.5) + 
      xlim(-5, 15) + 
      labs(x="", y="") +
      theme_bw() +
      theme(plot.margin = unit(c(2,1,1,1), "lines")) + 
      annotate("text", label = paste("p = ", t.result$p.value, sep = ""), x = Inf, y = Inf, hjust = 1, vjust = -1)
    
    gg2 <- ggplot_gtable(ggplot_build(p))
    gg2$layout$clip[gg2$layout$name == "panel"] <- "off"
    grid.draw(gg2)
  })
  
})