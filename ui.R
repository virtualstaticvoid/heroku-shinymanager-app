library(shiny)
library(shinymanager)

# example from http://shiny.rstudio.com/gallery/kmeans-example.html
# combined with https://datastorm-open.github.io/shinymanager/

# Define UI for application that plots random distributions
page <- pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

# Wrap your UI with secure_app
ui <- secure_app(page, enable_admin = TRUE)
