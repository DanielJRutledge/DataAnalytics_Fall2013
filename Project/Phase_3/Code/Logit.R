df = read.csv("/home/dan/329/Project/Phase_3/CSV/agg.csv")
dqb = subset(df,Position == "QB")
dwr = subset(df,Position == "WR")
drb = subset(df,Position == "RB")
dwr$RushTD <- factor(dwr$RushTD)
dwr$RecTD <- factor(dwr$RecTD)
dwr$ifNFL<-NULL
NFL <- function(x)
{
  if(is.na(x)) y <- 0
  else y <- 1
  return(y)
}
dwr$isNFL <- sapply(dwr$AV,NFL)
mylogit <- glm(isNFL ~ RecTD, data = dwr, family = "binomial")
exp(coef(mylogit))