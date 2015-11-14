library(shiny)
library(UsingR)

shinyServer(
  function(input, output) {
    
    # print the parent's height
    output$id_out_parent_height <- renderPrint({
      print(input$id_parent_height)
    })
    
    # print the child's height
    output$id_out_child_height <- renderPrint({
      # get parent height
      parent_height <- input$id_parent_height
      
      #cat(parent_height)
      # fitting linear model to galton data set
      modFit <- lm(child ~ parent, data=galton)
      
      # predicting the child's height from the parent height
      child_height <- predict(modFit, newdata=data.frame(parent = parent_height), interval="prediction")
      
      print(paste("Child's height: ", round(child_height[1], 2)))
      print(paste("predicting interval: ", round(child_height[2], 2), " ~ ", round(child_height[3],2)))
    })
    
    output$id_plot <- renderPlot({
      parent_height <- input$id_parent_height
      
      plot(jitter(child) ~ parent, data=galton, xlab="Parent's height", ylab="Child's height")
      lines(galton$parent, modFit$fitted.values)
      lines(c(parent_height, parent_height), c(0, 200), col="red", lwd="5")
    })
  }
)