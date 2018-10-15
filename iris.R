library(rpart)
library(rpart.plot)

df <- read.csv(file = "C:/Users/roger.vieira/Repositories/ClassificationModels/telco_churn.csv", sep = ",", header = TRUE, dec = ".")

df$PaymentMethod = as.factor(df$PaymentMethod)
df$PaperlessBilling = as.factor(df$PaperlessBilling)

head(df)
#df$Churn

fitTree <- rpart(
    df$Churn~df$MonthlyCharges 
    + df$TotalCharges 
    + df$tenure 
    + df$PaymentMethod,
     data=df, method="class"
    )


rpart.plot(fitTree)