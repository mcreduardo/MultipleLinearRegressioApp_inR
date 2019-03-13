# http://www.statlab.wisc.edu/shiny/
# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf

library(shiny)


shinyUI(pageWithSidebar(
  # title of the App
  headerPanel("Multiple Linear Regression"),
  sidebarPanel(
    p("File must have a header with variables' names."),
    
    # file input - select data
    fileInput("file", label = ("Load Data")),
    # id column?
    checkboxInput("idCol", label = "id column", value = TRUE),
    
    br(),
    # data loaded
    p("Loaded variables: "),
    textOutput("varNames"),
    br(),
    br(),
    

    # regression formula
    textInput("formula", label = ("Regression formula"), value = "y ~ x1+x2"),
    p("Ex.: y ~ x1+x2+x1*x3"),
    br(),
    br(),
    

    # print copyright
    p("Copyright (c) 2019 Eduardo Rocha")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Summary & ANOVA", wellPanel(
        verbatimTextOutput("summary"),
        verbatimTextOutput("anova")
      )),
      tabPanel("Residual Plots", wellPanel(plotOutput("resFitPlot"))),
      tabPanel("Multicollinearity", wellPanel(
        p("Variation inflation factor:"),
        verbatimTextOutput("vif"),
        p("Correlation:"),
        verbatimTextOutput("cor"),
        plotOutput("corPlot")
      )),
      tabPanel("Model selection",wellPanel(
        numericInput("nbest", label= "Number of subsets of each size to record", value = 3),
        numericInput("nvmax", label= "Maximum size of subsets to examine", value = 6),
        p("Best models:"),
        tableOutput("modelSelection")
      ))
    )
  )
))

