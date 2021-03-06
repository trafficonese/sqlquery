% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sqlquery-proxy.R
\name{sq_proxy_setvalue}
\alias{sq_proxy_setvalue}
\title{Proxy method for setting editor's value}
\usage{
sq_proxy_setvalue(shinyId, value = NULL,
  session = shiny::getDefaultReactiveDomain())
}
\arguments{
\item{shinyId}{single-element character vector indicating the output ID of the
editor to modify (if invoked from a Shiny module, the namespace will be added
automatically)}

\item{value}{The new value to use.}

\item{session}{the Shiny session object to which the editor belongs; usually the
default value will suffice}
}
\description{
Proxy method for setting editor's value
}
\examples{
\dontrun{

if (interactive()) {

  library(shiny)
  library(shinyWidgets)
  library(sqlquery)

  ui <- fluidPage(
    tags$h2("sqlquery example"),
    panel(
      heading = "SQL editor",
      status = "primary",
      sqlqueryOutput(outputId = "mySQL", height = "200px")
    ),
    verbatimTextOutput(outputId = "res"),
    textInput(
      inputId = "update",
      label = "Update editor:",
      width = "100\%"
    )
  )

  server <- function(input, output, session) {

    output$mySQL <- renderSqlquery({
      sql_query(raw = TRUE)
    })

    output$res <- renderPrint({
      input$mySQL_value
    })

    observeEvent(input$update, {
      sq_proxy_setvalue("mySQL", input$update)
    }, ignoreInit = TRUE)

  }

  runApp(
    appDir = shinyApp(ui, server),
    launch.browser = paneViewer()
  )

}

}
}
