library(shiny)
library(shinymanager)

# example from http://shiny.rstudio.com/gallery/kmeans-example.html
# combined with https://datastorm-open.github.io/shinymanager/

# **** FOR EXAMPLE PURPOSES ONLY ****
# define admin credentials
# See https://datastorm-open.github.io/shinymanager/#secure-database
credentials <- data.frame(
  user = c("admin", "user"),
  password = c("p@ssw0rd", "p@ssw0rd"),
  admin = c(TRUE, FALSE)
)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

# Define server logic required to generate and plot a random distribution
server <- shinyServer(function(input, output, session) {

  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )

  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })

  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })

})
