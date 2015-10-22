shinyUI(pageWithSidebar(
  headerPanel("Chick Weight Boxplot"),
  sidebarPanel(p("The body weights of 50 chicks were measured at birth and on every 
      second day until day 20. On day 21, a final measurement was conducted. 
      The subjects are divided into four groups on different protein diets."),
               p("In this app, we look at the body weights in the four groups in various 
                 time intervals throghout the experiment."),
    sliderInput('timeInt', 'Time Interval', min = 0, max = 22, step = 2, value = c(0, 22)),
    checkboxInput('cb1', 'Diet 1 ',TRUE),
    checkboxInput('cb2', 'Diet 2 ',TRUE),
    checkboxInput('cb3', 'Diet 3 ',TRUE),
    checkboxInput('cb4', 'Diet 4 ',TRUE)
  ),
  #submitButton("Submit"),
  mainPanel(
    #img(src="./agidoLogo.png", width = 149, height = 54),
    plotOutput("newBP")
  )
))