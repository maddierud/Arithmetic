library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput("number1", "Number 1", value = 0),
      numericInput("number2", "Number 2", value = 0),
      
      actionButton("addBtn", "Add"),
      actionButton("multiplyBtn", "Multiply")
    ),
    mainPanel(
      h2("The result is:"),
      textOutput("result")
    )
  )
)

server <- function(input, output) {
  # This will hold the current result
  result <- reactiveVal(0)
  
  # When the Add button is clicked
  observeEvent(input$addBtn, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    result(x1 + x2)     # correct for addition
  })
  
  # When the Multiply button is clicked
  observeEvent(input$multiplyBtn, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    result(x1 * x2)     # correct for multiplication
  })
  
  # Display the result
  output$result <- renderText({
    result()
  })
}

shinyApp(ui = ui, server = server)

