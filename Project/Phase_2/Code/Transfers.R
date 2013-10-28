setwd("/home/dan/Downloads")
df = read.csv("big5.csv")
df$playerid <- NULL
df$transfer <- NULL
df <- df[order(df$Name,df$Team, df$Year),]
de = data.frame(df$Name, df$Team, df$Year, df$Position)
counter = 1
a <- c(counter)
b <- c("NO")
for(i in 2: nrow(df))
{
  print(i)
  current = df[i,]
  previous = df[i-1,]
  
  if(current$Name == previous$Name)
  {
    if(current$Team == previous$Team)
    {      
      if((current$Year == previous$Year+1) || (current$Year == previous$Year+2) || (current$Year == previous$Year+3))
      {
        a <- append(a, counter)
        b <- append(b, "NO")
      }
      else 
      {
        counter = counter+1
        a <- append(a, NA)
        b <- append(b, "NO")
      }
    }
    else {
      if((current$Year == previous$Year+1) || (current$Year == previous$Year+2) || (current$Year == previous$Year+3))
      {
        l = i-1
        ds <- current
        prev <- df[l,]
        ds = rbind(ds,previous)
        while(prev$Name == current$Name)
        {
          l = l-2
          prev = df[l,]
          ds = rbind(ds, prev)
        }
        ds <- ds[order(ds$Name, ds$Year),]
        marker = "TRUE"
        if(i-l > 4)
        {
          counter = counter+1
          a <- append(a, NA)
          b <- append(b, "NO")
        }
        else {
        for(t in 2:nrow(ds))
        {
          if(!(ds$Year[t] == ds$Year[t-1]+1 || ds$Year[t] == ds$Year[t-1]+2))
          {
            marker = "FALSE"
          }
        }
        if(marker == "TRUE") {
          a <- append(a, counter)
          b <- append(b, "YES")
        }
        else {
          counter = counter+1
          a <- append(a, NA)
          b <- append(b, "NO")
        }
      }
    }
      else {
        counter = counter+1
        a <- append(a, counter)
        b <- append(b, "NO")
      }
  }
}
else {
        counter = counter+1
        a <- append(a, counter)
        b <- append(b, "NO")
}
}
df["playerid"] <- a
df["transfer"] <- b
write.table(df, "/home/dan/Test.csv", sep="\t") 
de = data.frame(df$Name, df$Team, df$Year, df$Position, df$playerid)
View(de);