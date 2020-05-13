library(shiny)

df_server <- reactive({
    showSetup <- as.logical(input$show_setup)
})


shinyServer(function(input, output) {
    
  output$value <- renderText({
      if(input$show_setup){
          paste(
              get_prediction(input$show_this_text)$current_string,
              "<font color=\"#4286f4\"><b>",
              get_prediction(input$show_this_text)$suggestion,
              "</b></font>",
              sep = ""
              )
      } else {
          paste(
              "<font color=\"#4286f4\"><b>",
              get_prediction(input$show_this_text)$suggestion,
              "</b></font>",
              sep = ""
          )
      }
      })
  


})

