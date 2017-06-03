library(shiny)
library(tigerstats)
ui <- fluidPage(
  
  
  headerPanel("2012 General Social Survey cross tabulation"),
  sidebarPanel(
    tags$head(
      tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                    
                    h1 {
                    font-family: 'Lobster', cursive;
                    font-weight: 800;
                    line-height: 4;
                    color: #4d3a7d;
                    }

                    
                    ",
      
      "body {background-color:pink;}")
      )),
    
    
    #Sidebar controls
    textOutput("currentTime"),
   basicPage(
      actionButton("show", "Notes")
    ),
 
    selectInput("row", "Row variable", 
                names(gss2012), selected = "polviews"),
    selectInput("column", "Column variable",
                names(gss2012), selected = "sex") ),
   
  mainPanel(
    
    tableOutput('table')
  )
)