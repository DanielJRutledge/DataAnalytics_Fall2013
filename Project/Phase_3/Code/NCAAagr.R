#script to create aggregate data frames in R
#
#We've already created yearly, non-adjusted data
#
#get IDs for each player in each list, then modify the big list all at once, 
#then segregate the data back into subsets based on IDs
RBtrainIDs=unique(RBtrain$PlayerID)
RBtestIDs=unique(RBtest$PlayerID)
RBvalidIDs=unique(RBvalid$PlayerID)
QBtrainIDs=unique(QBtrain$PlayerID)
QBtestIDs=unique(QBtest$PlayerID)
QBvalidIDs=unique(QBvalid$PlayerID)
WRtrainIDs=unique(WRtrain$PlayerID)
WRtestIDs=unique(WRtest$PlayerID)
WRvalidIDs=unique(WRvalid$PlayerID)
#
#all data exists in BigFinal.csv
#
#Before adjusting data based on percentage, aggregate data
#Now create the aggregated, adjusted data
#sum the values of most of the columns, except average QBRAT and Rank
tmp2 <- aggregate(cbind(G,Rush,RushYds,RushTD,Rec,RecYds,RecLng,RecTD,PassYds,Att,Comp,PassTD,TeamGames,Plays,TeamYds,TeamTD,Wins,Losses,Int,Sack,YdsL)~PlayerID,sum,data=BigFinal)
tmp3 <- aggregate(cbind(Rank,QBRAT,Percentage)~PlayerID,mean,data=BigFinal)
tmp4 <- merge(tmp2,tmp3,by="PlayerID")
#
#Now recalculate the remaining columns based on new data
#cols: RushYPG,RushAvg,RecYPG,RecAvg,Pct,PassYPG,PassAvg,TeamAvg,TeamYPG
tmp4$RushYPG <- tmp4$RushYds/tmp4$G
tmp4$RushAvg <- tmp4$RushYds/tmp4$Rush
tmp4$RecYPG <- tmp4$RecYds/tmp4$G
tmp4$RecAvg <- tmp4$RecYds/tmp4$Rec
tmp4$Pct <- tmp4$Comp/(tmp4$Att+tmp4$Comp)
tmp4$PassYPG <- tmp4$PassYds/tmp4$G
tmp4$PassAvg <- tmp4$PassYds/tmp4$Comp
tmp4$TeamAvg <- tmp4$TeamYds/tmp4$Plays
tmp4$TeamYPG <- tmp4$TeamYds/tmp4$TeamGames
#
#Then add back the columns that are static for each year
#cols: Name,Code,Position,TeamName,AV
tmp5 <- data.frame(subset(BigFinal,!duplicated(PlayerID),c("Name","Code","Position","TeamName","AV","PlayerID")),row.names=NULL)
tmp6 <- merge(tmp5,tmp4,by="PlayerID")
#re-arrange column order and write to BigAgr.csv
BigAgr <- subset(tmp6,select=c("Code","Name","G","Rush","RushYds","RushYPG","RushAvg","RushTD","Rec","RecYds","RecYPG","RecAvg","RecLng","RecTD",
                                  "Position","QBRAT","Att","Comp","Pct","PassYds","PassYPG","PassAvg","PassTD","Int","Sack","YdsL","Rank","TeamName","TeamGames",
                                  "Plays","TeamYds","TeamAvg","TeamTD","TeamYPG","Wins","Losses","Percentage","PlayerID","AV"))
write.csv(BigAgr,"BigAgr.csv",row.names=F)  #write csv of big file of aggregate data
#
#Recreate position data sets from aggregated, non-adjusted data
RBAgrtrain <- data.frame(subset(BigAdj,PlayerID %in% RBtrainIDs),row.names=NULL)
RBAgrtest <- data.frame(subset(BigAdj,PlayerID %in% RBtestIDs),row.names=NULL)
RBAgrvalid <- data.frame(subset(BigAdj,PlayerID %in% RBvalidIDs),row.names=NULL)
QBAgrtrain <- data.frame(subset(BigAdj,PlayerID %in% QBtrainIDs),row.names=NULL)
QBAgrtest <- data.frame(subset(BigAdj,PlayerID %in% QBtestIDs),row.names=NULL)
QBAgrvalid <- data.frame(subset(BigAdj,PlayerID %in% QBvalidIDs),row.names=NULL)
WRAgrtrain <- data.frame(subset(BigAdj,PlayerID %in% WRtrainIDs),row.names=NULL)
WRAgrtest <- data.frame(subset(BigAdj,PlayerID %in% WRtestIDs),row.names=NULL)
WRAgrvalid <- data.frame(subset(BigAdj,PlayerID %in% WRvalidIDs),row.names=NULL)
#
#write the new data sets to file
write.csv(RBAgrtrain,"RBAgrtrain.csv",row.names=F)
write.csv(RBAgrtest,"RBAgrtest.csv",row.names=F)
write.csv(RBAgrvalid,"RBAgrvalid.csv",row.names=F)
write.csv(QBAgrtrain,"QBAgrtrain.csv",row.names=F)
write.csv(QBAgrtest,"QBAgrtest.csv",row.names=F)
write.csv(QBAgrvalid,"QBAgrvalid.csv",row.names=F)
write.csv(WRAgrtrain,"WRAgrtrain.csv",row.names=F)
write.csv(WRAgrtest,"WRAgrtest.csv",row.names=F)
write.csv(WRAgrvalid,"WRAgrvalid.csv",row.names=F)
#
#Now create adjusted data.
#
#multiply column values by adjustment = percentage + 0.5
#columns are RushYds,RushTD,RecYds,RecLng,RecTD,QBRAT,PassYds,Comp,Pct,PassTD,
#TeamYds,TeamTD,Wins
#
BigFinalAdj <- BigFinal
adj <- BigFinalAdj$Percentage + 0.5
BigFinalAdj$RushYds <- with(BigFinalAdj,RushYds * adj) 
BigFinalAdj$RushTD <- with(BigFinalAdj,RushTD * adj)
BigFinalAdj$RecYds <- with(BigFinalAdj,RecYds * adj)
BigFinalAdj$RecLng <- with(BigFinalAdj,RecLng * adj)
BigFinalAdj$RecTD <- with(BigFinalAdj,RecTD * adj)
BigFinalAdj$QBRAT <- with(BigFinalAdj,QBRAT * adj)
BigFinalAdj$PassYds <- with(BigFinalAdj,PassYds * adj)
BigFinalAdj$Comp <- with(BigFinalAdj,Comp * adj)
BigFinalAdj$PassTD <- with(BigFinalAdj,PassTD * adj)
BigFinalAdj$TeamYds <- with(BigFinalAdj,TeamYds * adj)
BigFinalAdj$TeamTD <- with(BigFinalAdj,TeamTD * adj)
BigFinalAdj$Wins <- with(BigFinalAdj,Wins * adj)
#
#divide column values by adjusment
#columns are Losses,Int,Sack,YdsL
BigFinalAdj$Losses <- with(BigFinalAdj,Losses / adj)
BigFinalAdj$Int <- with(BigFinalAdj,Int / adj)
BigFinalAdj$Sack <- with(BigFinalAdj,Sack / adj)
BigFinalAdj$YdsL <- with(BigFinalAdj,YdsL / adj)
#
#Now that we've adjusted the yearly data set, print out non-aggregated data sets for position
BigAdj <- BigFinalAdj
#Now recalculate the remaining columns based on new data
#cols: RushYPG,RushAvg,RecYPG,RecAvg,Pct,PassYPG,PassAvg,TeamAvg,TeamYPG
BigAdj$RushYPG <- BigAdj$RushYds/BigAdj$G
BigAdj$RushAvg <- BigAdj$RushYds/BigAdj$Rush
BigAdj$RecYPG <- BigAdj$RecYds/BigAdj$G
BigAdj$RecAvg <- BigAdj$RecYds/BigAdj$Rec
BigAdj$Pct <- BigAdj$Comp/(BigAdj$Att+BigAdj$Comp)
BigAdj$PassYPG <- BigAdj$PassYds/BigAdj$G
BigAdj$PassAvg <- BigAdj$PassYds/BigAdj$Comp
BigAdj$TeamAvg <- BigAdj$TeamYds/BigAdj$Plays
BigAdj$TeamYPG <- BigAdj$TeamYds/BigAdj$TeamGames
#
#Recreate position data sets from adjusted, yearly data
RBAdjtrain <- data.frame(subset(BigAdj,PlayerID %in% RBtrainIDs),row.names=NULL)
RBAdjtest <- data.frame(subset(BigAdj,PlayerID %in% RBtestIDs),row.names=NULL)
RBAdjvalid <- data.frame(subset(BigAdj,PlayerID %in% RBvalidIDs),row.names=NULL)
QBAdjtrain <- data.frame(subset(BigAdj,PlayerID %in% QBtrainIDs),row.names=NULL)
QBAdjtest <- data.frame(subset(BigAdj,PlayerID %in% QBtestIDs),row.names=NULL)
QBAdjvalid <- data.frame(subset(BigAdj,PlayerID %in% QBvalidIDs),row.names=NULL)
WRAdjtrain <- data.frame(subset(BigAdj,PlayerID %in% WRtrainIDs),row.names=NULL)
WRAdjtest <- data.frame(subset(BigAdj,PlayerID %in% WRtestIDs),row.names=NULL)
WRAdjvalid <- data.frame(subset(BigAdj,PlayerID %in% WRvalidIDs),row.names=NULL)
#
#write the new data sets to file
write.csv(RBAdjtrain,"RBAdjtrain.csv",row.names=F)
write.csv(RBAdjtest,"RBAdjtest.csv",row.names=F)
write.csv(RBAdjvalid,"RBAdjvalid.csv",row.names=F)
write.csv(QBAdjtrain,"QBAdjtrain.csv",row.names=F)
write.csv(QBAdjtest,"QBAdjtest.csv",row.names=F)
write.csv(QBAdjvalid,"QBAdjvalid.csv",row.names=F)
write.csv(WRAdjtrain,"WRAdjtrain.csv",row.names=F)
write.csv(WRAdjtest,"WRAdjtest.csv",row.names=F)
write.csv(WRAdjvalid,"WRAdjvalid.csv",row.names=F)
#
#Now create the aggregated, adjusted data
#sum the values of most of the columns, except average QBRAT and Rank
tmp2 <- aggregate(cbind(G,Rush,RushYds,RushTD,Rec,RecYds,RecLng,RecTD,PassYds,Att,Comp,PassTD,TeamGames,Plays,TeamYds,TeamTD,Wins,Losses,Int,Sack,YdsL)~PlayerID,sum,data=BigFinalAdj)
tmp3 <- aggregate(cbind(Rank,QBRAT,Percentage)~PlayerID,mean,data=BigFinalAdj)
tmp4 <- merge(tmp2,tmp3,by="PlayerID")
#
#Now recalculate the remaining columns based on new data
#cols: RushYPG,RushAvg,RecYPG,RecAvg,Pct,PassYPG,PassAvg,TeamAvg,TeamYPG
tmp4$RushYPG <- tmp4$RushYds/tmp4$G
tmp4$RushAvg <- tmp4$RushYds/tmp4$Rush
tmp4$RecYPG <- tmp4$RecYds/tmp4$G
tmp4$RecAvg <- tmp4$RecYds/tmp4$Rec
tmp4$Pct <- tmp4$Comp/(tmp4$Att+tmp4$Comp)
tmp4$PassYPG <- tmp4$PassYds/tmp4$G
tmp4$PassAvg <- tmp4$PassYds/tmp4$Comp
tmp4$TeamAvg <- tmp4$TeamYds/tmp4$Plays
tmp4$TeamYPG <- tmp4$TeamYds/tmp4$TeamGames
#
#Then add back the columns that are static for each year
#cols: Name,Code,Position,TeamName,AV
tmp5 <- data.frame(subset(BigFinalAdj,!duplicated(PlayerID),c("Name","Code","Position","TeamName","AV","PlayerID")),row.names=NULL)
tmp6 <- merge(tmp5,tmp4,by="PlayerID")
#re-arrange column order and write to BigFinalAgr.csv
BigAdjAgr <- subset(tmp6,select=c("Code","Name","G","Rush","RushYds","RushYPG","RushAvg","RushTD","Rec","RecYds","RecYPG","RecAvg","RecLng","RecTD",
  "Position","QBRAT","Att","Comp","Pct","PassYds","PassYPG","PassAvg","PassTD","Int","Sack","YdsL","Rank","TeamName","TeamGames",
  "Plays","TeamYds","TeamAvg","TeamTD","TeamYPG","Wins","Losses","Percentage","PlayerID","AV"))
write.csv(BigAdjAgr,"BigAdjAgr.csv",row.names=F)  #write csv of big file of adjusted aggregate data
#
#recreate individual position regression testing files
RBAdjAgrtrain <- data.frame(subset(BigAdjAgr,PlayerID %in% RBtrainIDs),row.names=NULL)
RBAdjAgrtest <- data.frame(subset(BigAdjAgr,PlayerID %in% RBtestIDs),row.names=NULL)
RBAdjAgrvalid <- data.frame(subset(BigAdjAgr,PlayerID %in% RBvalidIDs),row.names=NULL)
QBAdjAgrtrain <- data.frame(subset(BigAdjAgr,PlayerID %in% QBtrainIDs),row.names=NULL)
QBAdjAgrtest <- data.frame(subset(BigAdjAgr,PlayerID %in% QBtestIDs),row.names=NULL)
QBAdjAgrvalid <- data.frame(subset(BigAdjAgr,PlayerID %in% QBvalidIDs),row.names=NULL)
WRAdjAgrtrain <- data.frame(subset(BigAdjAgr,PlayerID %in% WRtrainIDs),row.names=NULL)
WRAdjAgrtest <- data.frame(subset(BigAdjAgr,PlayerID %in% WRtestIDs),row.names=NULL)
WRAdjAgrvalid <- data.frame(subset(BigAdjAgr,PlayerID %in% WRvalidIDs),row.names=NULL)
#
#write the new data sets to file
write.csv(RBAdjAgrtrain,"RBAdjAgrtrain.csv",row.names=F)
write.csv(RBAdjAgrtest,"RBAdjAgrtest.csv",row.names=F)
write.csv(RBAdjAgrvalid,"RBAdjAgrvalid.csv",row.names=F)
write.csv(QBAdjAgrtrain,"QBAdjAgrtrain.csv",row.names=F)
write.csv(QBAdjAgrtest,"QBAdjAgrtest.csv",row.names=F)
write.csv(QBAdjAgrvalid,"QBAdjAgrvalid.csv",row.names=F)
write.csv(WRAdjAgrtrain,"WRAdjAgrtrain.csv",row.names=F)
write.csv(WRAdjAgrtest,"WRAdjAgrtest.csv",row.names=F)
write.csv(WRAdjAgrvalid,"WRAdjAgrvalid.csv",row.names=F)