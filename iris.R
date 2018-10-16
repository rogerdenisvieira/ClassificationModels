library(rpart)
library(rpart.plot)
library(party)

df <- read.csv(file = "/home/roger/Repositories/ClassificationModels/telco_churn.csv", sep = ",", header = TRUE, dec = ".")

df$PaymentMethod = as.factor(df$PaymentMethod)
df$PaperlessBilling = as.factor(df$PaperlessBilling)
df$InternetService = as.factor(df$InternetService)



fitTree <- ctree(
    df$Churn
    ~ df$MonthlyCharges
    + df$tenure,
    data=df
)

#table(predict(fitTree), df$Churn)


plot(fitTree)