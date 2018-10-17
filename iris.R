library(rpart)
library(rpart.plot)
library(caret)

# lendo o arquivo que contem o dataset
df <- read.csv(file = "C:/Users/roger.vieira/Repositories/ClassificationModels//telco_churn.csv", sep = ",", header = TRUE, dec = ".")

# separandos o dataset em treino e validação
index <- createDataPartition(df$Churn, list=FALSE)
training <- df[index, ]
validation <- df[-index, ]

# verificando o tamanho dos datasets
nrow(training)
nrow(validation)

# aplicando o modelo de árvore de decisão
decisionTreeModel <- rpart(
   training$Churn
   ~ training$MonthlyCharges
   + training$TotalCharges
   + training$tenure,
   data=training,
   method = "class"
)
  

logisticRegressionModel <- glm(training$Churn
    ~ training$MonthlyCharges
    + training$TotalCharges
    + training$PaymentMethod
    + training$tenure, family=binomial(link='logit'),data=training
    )

# rodando a predição ao dataset de validação
decisionTreePrediction <- predict(decisionTreeModel, validation, type="class")

logisticRegressionPrediction <- predict(logisticRegressionModel, validation)

# exibindo a matriz de confusão
confusionMatrix(decisionTreePrediction, validation$Churn)

confusionMatrix(validation$Churn, logisticRegressionPrediction)

# plotando a árvore de decisão
rpart.plot(decisionTreeModel)