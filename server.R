library(shiny)
library(tigerstats)
library(gmodels)
server <- function(input, output,session) {
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Important message",
      "This data is shown related with 2012 General Social Survey cross tabulation",
      easyClose = TRUE
    ))});
  output$table <- renderTable(prop.table
                              (table(gss2012[, input$row],
                                              
                                      gss2012[, input$column]
                                     )
                                ));
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("The current time is", Sys.time())
  });
}