library(randomForest)
library(ggplot2)
#load data
train<-read.csv("train.csv", header = TRUE)
train<-train[,c(2,3,5:7)]
train$Survived<-as.factor(train$Survived)

# set up a random forest model
modfit<-randomForest(Survived~., data = rfImpute(Sex~.,data = train),ntree = 2000)


shinyServer(
        function(input, output) {
               # creation of the predictor vector
                 x<-reactive({data.frame("Pclass" = as.integer(c(input$Class,input$Class)),"Sex" = as.factor(c("male","female")), "Age" = c(input$Age,input$Age),"SibSp" = c(input$Family,input$Family))})
               # calcul of the prediction         
                y<-reactive({predict(modfit,x(), type = "vote")})
               
                # plot the prediction
                output$mypie <- renderPlot({
                        if (input$Gender == 2) w<-y()[2,] else w<-y()[1,]
                        w<-as.data.frame(w)        
                        pie(w[,], main = "Survival probability", col = c("red","green"), labels = c("death", "survival"))
                               
                     
                        })     
        }
)