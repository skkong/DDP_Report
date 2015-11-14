library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("DDP Report: Predicting the height of child from parent"),
  
  # input
  sidebarPanel(
    h3("Data Input Panel"),
    numericInput('id_parent_height', 'Input Parent Height', 60, min = 60, max = 70, step = 1),
    #checkboxGroupInput('id2', 'Checkbox', c('Value 1' = '1', 'Value 2' = '2')),
    #dateInput('date', 'Date:'),
    submitButton('Predicting')
  ),
  
  # output
  mainPanel(
    h3('Main panel (Output of predicting)'),
    h4("Parent's height: "),
    verbatimTextOutput('id_out_parent_height'),
    
    h4("Result: "),
    verbatimTextOutput('id_out_child_height'), 
    
    plotOutput("id_plot")
  )
))