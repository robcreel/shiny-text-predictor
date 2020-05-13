
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  

  # Application title
  titlePanel("Text Prediction"),
  

    # Main Panel
    mainPanel(
        p("This Shiny App was written by Rob Creel for the Data Science Capstone 
course taught through Coursera by faculty of the Biostatistics Department at the
Johns Hopkins Bloomberg School of Public Health. Try it out by typing some words in the text field below."),
        textInput("show_this_text", 
                  "Enter text below. The suggested next word appears in blue.", 
                  "Type here ",
                  width = "90%"),
        htmlOutput("value"),
        checkboxInput("show_setup", 
                      " Show which words were used in the prediction.", 
                      FALSE,
                      width = "90%"),
        p("The prediction model was built from a text dataset collected from news, blogs, 
and tweets from around the internet. See more about the raw data at this link:"),
        a(href = "http://rpubs.com/robcreel/milestone", "Capstone Exploratory Report"),
        p(" "),
        p("The prediction model was built in R using the ngram package.  The model works by first reading the last four words typed, and then suggesting which word in the dataset most often follows that particular 4-gram.  If no good suggestion is found, either because that four word phrase is not common enough or because there are not yet four words typed, then it repeats the process using only the last three words typed instead, and so on."),
        p("Note that not every typed word will contribute to the prediction, only the last four at the most.  If you want to see which words did contribute to the prediction, you may check the box beneath the text field to show them.")
    )
  # )
))
