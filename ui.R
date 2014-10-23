library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Multivariate Analysis of mtcars Data"),
        sidebarPanel(
            
            radioButtons("diffplots", label = p("Different Model Fits and Pair wise Plot"),
                         choices = list("Pair wise" = 1, "Fitted Model 1" = 2,
                                        "Fitted Model 1 & 2" = 3, "Fitted Model  1 & 2 & 3" = 4),
                         
                         selected = 1),
            
            radioButtons("stat", label = p("Different Statistics"),
                         choices = list("Summary  Stat" = 1, "Model 1 Stat" = 2,
                                        "Model 2 Stat" = 3, "Model 3 Stat" = 4),
                         
                         selected = 1)
 
        ),
        mainPanel(
            h4('Synopsis'),
            p('The objective of this analysis is to explore the relationship between a set of variables and miles per gallon (MPG) (outcome).'),
            p('We are mainly intersted in exploring different models, explore the model statistics and compare the model using annova' ),
            p('The UI is divided into four tabs, the title of each one of it is self explainatory'),
            p('Please use the radio buttons on the left hand side to explore the different plots and statistics'),
            tabsetPanel(
                deployApp()("Different Plot",plotOutput("plot")),
                tabPanel("Summary Statistics",verbatimTextOutput("summary")),
                tabPanel("Model Comparision", p("Model 2 turns out to be best based on p-value"),
                         verbatimTextOutput("annova")),
                tabPanel("Data",tableOutput("table"))
            )
        )
    
    )
)