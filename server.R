library(shiny)
library(datasets)
data(ChickWeight)

shinyServer(
  
  function(input, output) {

    # Reactive expression to compose a data frame containing all of
    # the values
    
    a1 <- reactive({input$cb1})
    a2 <- reactive({input$cb2})
    a3 <- reactive({input$cb3})
    a4 <- reactive({input$cb4})
    t1 <- reactive({input$timeInt[1]})
    t2 <- reactive({input$timeInt[2]})

    returnData <- function(a1, a2, a3, a4, t1, t2){
      v <- c(1,2,3,4)
      logi <- c(a1, a2, a3, a4)
      ChickWeight[with(ChickWeight, Diet %in% v[logi] & Time >= t1 & Time <= t2),]
    }
    
    output$newBP <- renderPlot({boxplot(weight~Diet,data=returnData(a1(), a2(), a3(), a4(), t1(), t2()), 
                                        main="Chick Weights", 
                                        xlab="Diet", ylab="weight in grams",
                                        col=terrain.colors(4),
                                        ylim=c(0, 400))})
  }
)