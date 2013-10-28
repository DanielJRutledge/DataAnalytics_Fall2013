setwd("/home/dan/Downloads")
nfl = read.csv("./Nfl.csv", sep="\t")
nfl <- nfl[order(nfl$Name),]
ncaa = read.csv("/home/dan/Test.csv", sep="\t")
ncaa["NFL_AV"] <- NA
for(i in 2: nrow(nfl))
{
  playerid = 0
  name = nfl[2,2]
    rows = subset(ncaa, ncaa$Name == name,)
    for(l in nrow(rows))
    {
      if(nfl$StartYear>ncaa$Year)
      {
        if(playerid == 0)
        {
          playerid = ncaa$playerid
        }
        else if(playerid == ncaa$playerid){}
        else {playerid = NA}
      }
    }
      if(playerid == 0)
      {
        nfl[i]=NULL
      }
      else if(playerid == NA)
      {
        ncaa[(nfl$Name[i] == ncaa$Name),"NFL_AV"] = -1
      }
      else {
        ncaa[(playerid == ncaa$playerid),"NFL_AV"] = playerid
      }
}
write.table(df, "/home/dan/Final.csv", sep="\t") 