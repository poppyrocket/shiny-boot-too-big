library(shiny)
library(shinydashboard)

ui <- dashboardPage(skin = "yellow",
    dashboardHeader(title = "Discover LMI"),
    dashboardSidebar(),
    dashboardBody(
        tags$head(tags$style(HTML('
      .main-header .logo {
        font-family: "Georgia", Times, "Times New Roman", serif;
        font-weight: bold;
        font-size: 24px;
      }
    '))),
    

        fluidRow(
            box(plotOutput("plot1", height = 250)),
            
            box(
                title = "Controls",
                sliderInput("slider", "number of Observations", 1, 100, 50)
            
                )
        )
  )  
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)
