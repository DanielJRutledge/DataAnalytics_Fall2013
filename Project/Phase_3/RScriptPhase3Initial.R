#Using Phase2FInal_Updated.csv for Phase 3
Phase2Final_updated <- read.csv("C:/Users/phani/Desktop/Phase2Final_updated.csv")
View(Phase2Final_updated)
#
# This is a change - Sergio (test)
#Splitting original phase 2 final by position (QB,WR,RB) into 3 more data frames
QBdata <- subset(Phase2Final_updated, Position == "QB")
RBdata <- subset(Phase2Final_updated, Position == "RB")
WRdata <- subset(Phase2Final_updated, Position == "WR")
View(QBdata)
View(RBdata)
View(WRdata)
#
#
#Writing the newly created position based data frames to new CSVs
write.csv(QBdata, "QBdata.csv", row.names=FALSE)
write.csv(RBdata, "RBdata.csv", row.names=FALSE)
write.csv(WRdata, "WRdata.csv", row.names=FALSE)
#
#
#Splitting each position based data frame into NFL and Non-NFL rows (i.e. looking at AV)
#Then writing those data frames to new CSVs
# is.na checks to see if the value is a null value; can also use is.null
# !is.na checks to see if value is defined (i.e. not a null value)
QBNFL = subset(QBdata, !is.na(QBdata$AV))
QBNonNFL = subset(QBdata, is.na(QBdata$AV))
write.csv(QBNFL, "QBNFL.csv", row.names=FALSE)
write.csv(QBNonNFL, "QBNonNFL.csv", row.names=FALSE)
#
RBNFL = subset(RBdata, !is.na(RBdata$AV))
RBNonNFL = subset(RBdata, is.na(RBdata$AV))
write.csv(RBNFL, "RBNFL.csv", row.names=FALSE)
write.csv(RBNonNFL, "RBNonNFL.csv", row.names=FALSE)
#
WRNFL = subset(WRdata, !is.na(WRdata$AV))
WRNonNFL = subset(WRdata, is.na(WRdata$AV))
write.csv(WRNFL, "WRNFL.csv", row.names=FALSE)
write.csv(WRNonNFL, "WRNonNFL.csv", row.names=FALSE)
#
#
#Since all the data frames so farare split by years, we will check for unique players
#This also helps in regression modeling to see if we have enough data to meet requirements
#
TotalNumQBs = length(unique(QBdata$PlayerID))
NumNFLQBs = length(unique(QBNFL$PlayerID))
NumNonNFLQBs = TotalNumQBs - NumNFLQBs
#total = 1397, NFL= 110, NonNFL = 1287
#
TotalNumRBs = length(unique(RBdata$PlayerID))
NumNFLRBs = length(unique(RBNFL$PlayerID))
NumNonNFLRBs = TotalNumRBs - NumNFLRBs
#Total = 2653, NFL = 276, NonNFL= 2377
#
TotalNumWRs = length(unique(WRdata$PlayerID))
NumNFLWRs = length(unique(WRNFL$PlayerID))
NumNonNFLWRs = TotalNumWRs - NumNFLWRs
#Total = 3977, NFL= 363, NonNFL= 3614
#
#
##Creating training samples of 60% from NFL and Non NFL and then combining them
##The normal sample() function cannot be used here since it accepts only a vector as
## input, not a data frame
QBNFLSample <- QBNFL[sample(1:dim(QBNFL)[1], size=66, replace=FALSE),]
QBNonNFLSample <- QBNonNFL[sample(1:dim(QBNonNFL)[1], size=773, replace=FALSE),]
QBtraining=rbind(QBNFLSample,QBNonNFLSample)
write.csv(QBtraining,"QBtraining.csv",row.names=FALSE)
#
RBNFLSample <- RBNFL[sample(1:dim(RBNFL)[1], size=166, replace=FALSE),]
RBNonNFLSample <- RBNonNFL[sample(1:dim(RBNonNFL)[1], size=1427, replace=FALSE),]
RBtraining=rbind(RBNFLSample,RBNonNFLSample)
write.csv(RBtraining,"RBtraining.csv",row.names=FALSE)
#
WRNFLSample <- WRNFL[sample(1:dim(WRNFL)[1], size=218, replace=FALSE),]
WRNonNFLSample <- WRNonNFL[sample(1:dim(WRNonNFL)[1], size=2168, replace=FALSE),]
WRtraining=rbind(WRNFLSample,WRNonNFLSample)
write.csv(WRtraining,"WRtraining.csv",row.names=FALSE)
