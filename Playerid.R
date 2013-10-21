setwd("/home/dan/329/Data")
attach(mtcars)
df = read.csv("BigData.csv")
index <- with(df, order(Name, Team, Year))
df$playerid <- NULL
df[index,]
View(df)
for(i in 2: nrow(df))
{
  if(df$Name[i] == df$Name[i-1])
  {
    if(df$Team [i] != df$Team[i-1])
    {
      df$playerid[i] = df$playerid[i-1] + 1
    }
    else {
      df$playerid[i] = df$playerid[i-1]
    }
  }
  else {
    df$playerid[i] = df$playerid[i-1] + 1
  }
}