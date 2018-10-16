library(rpart)
library(rpart.plot)
library(caret)

# lendo o arquivo que contem o dataset
df <- read.csv(file = "C:/Users/roger.vieira/Repositories/ClassificationModels/telco_churn.csv", sep = ",", header = TRUE, dec = ".")

# convertendo a forma de pagamento em uma variável categórica
df$PaymentMethod <- as.factor(df$PaymentMethod)
df$gender <- as.factor(df$PaymentMethod)

# separandos o dataset em treino e validação
index <- createDataPartition(df$Churn, list=FALSE)
training <- df[index, ]
validation <- df[-index, ]

# verificando o tamanho dos datasets
nrow(training)
nrow(validation)

# aplicando o modelo de árvore de decisão
#decisionTreeModel <- rpart(
#    training$Churn
#    ~ training$MonthlyCharges
#    + training$TotalCharges
#    + training$PaymentMethod
#    + training$tenure,
#    data=training,
#    method = "class"    
#)

decisionTreeModel <- rpart(
    training$Churn
    ~ training$PaymentMethod,
    data=training,
    method = "class"    
)

# rodando a predição ao dataset de validação
pred <- predict(decisionTreeModel, validation, type="class")

# exibindo a matriz de confusão
confusionMatrix(validation$Churn, pred)

# plotando a árvore de decisão
rpart.plot(decisionTreeModel)