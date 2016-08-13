library(shiny)
library(functionplotR)
library(shinythemes)

ui <- fluidPage(
        theme = shinytheme("united"),
        headerPanel("Explore functions!"),
        wellPanel(textInput(
                inputId = "text1",
                value = "x^2-3", # if changed to blank no function shows up
                label = "Write first function here"
        ),
        textInput(
                inputId = "text2",
                value = "0", # if left blank tooltip and legend won't work
                label = "..and second function here",
                placeholder = "x or anything"
        )
        ),
        
        functionplotOutput("func", width = "50%", height = "50%")
        
        
        
)

server <- function(input, output) {
        output$func <- renderFunctionplot(
                functionplot(
                        c(input$text1, input$text2)
                        
                        )
        )
        
        
}


shinyApp(ui = ui, server = server)

