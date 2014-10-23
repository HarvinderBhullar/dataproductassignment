library(UsingR)
library(ggplot2)
data(mtcars)


shinyServer(
    function(input,output){
        fit <- reactive({lm(mpg~factor(am) -1, data= mtcars)})
        fit1 <- reactive({ lm(mpg~ factor(am) + drat+wt+qsec -1, data=mtcars) })
        fit2 <- reactive({lm(mpg~ factor(am) + disp + drat+wt+hp+qsec+carb -1, data=mtcars)})

        output$plot <- renderPlot({
           if(input$diffplots == 1) 
           pairs(~.,data=mtcars, 
                 main="MTCARS Scatterplot Matrix")
           if(input$diffplots == 2) {
               plot(mtcars$mpg~factor(mtcars$am), xlab="am",ylab="mpg" ,main="Fig 1: MPG vs AM")
               abline(fit(), col="green")
           }
           if(input$diffplots == 3){
               plot(mtcars$mpg~factor(mtcars$am), xlab="am",ylab="mpg" ,main="Fig 1: MPG vs AM")
               abline(fit(), col="green")
               abline(fit1(), col="red")
           }
           if(input$diffplots == 4){
               plot(mtcars$mpg~factor(mtcars$am), xlab="am",ylab="mpg" ,main="Fig 1: MPG vs AM")
               abline(fit(), col="green")
               abline(fit1(), col="red")
               abline(fit2(), col="blue")
           }
       })
        
       output$text1 <-  renderText({names(mtcars)})
       output$summary <- renderPrint({
                     
           if(input$stat == 1){
               summary(mtcars)    
           }
           else if(input$stat == 2){
               summary(fit())    
           }else if(input$stat == 3){
               summary(fit1())    
           }else if(input$stat == 4){
               summary(fit2())    
           }
           
       })
       output$table <- renderTable({
           mtcars
       })
       
       output$annova <- renderPrint({
           fn  <- lm(mpg~., data=mtcars)
           f2 <- update(fit() , mpg~factor(am) +  drat+wt+qsec -1)
           f3 <- update(fit() ,mpg~factor(am)  +  disp + drat+wt+hp+qsec+carb -1)
           anova(fit(),f2,f3)
           
       })
    }    
)