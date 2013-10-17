R code to add columns in the data with conditional data.

First, from the console command line:
>>data=<long name of data frame that you've already imported>
>>data$Event.Exists <- ifelse(data$Events=="", 0, 1)
the ifelse() command works like this...
ifelse([condition], A, B)
If the condition is true, then the function returns A. If it is false it returns B.


Be sure to then enter
>>View(data) to refresh the frame to view it in R Studio. Also, it probably isn't permanently re-writing the .csv file, so you will lose edits if you quit R Studio. I'll post more updates as I figure it out.

as.Date(x,'%b')
Error in as.Date.default(x, "%b") : 
  do not know how to convert 'x' to class “Date”
> plot(data5[,1],xlab= "Months",ylab = "Temperature",type = "l",col = "red")
> plot(Month~data5[,1],xlab= "Months",ylab = "Temperature",type = "l",col = "red")
Error in eval(expr, envir, enclos) : object 'Month' not found
> plot(Month~Max.TemperatureF,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
Error in eval(expr, envir, enclos) : object 'Month' not found
> plot(Month~Max.TemperatureF,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data5)
> plot(Max.TemperatureF~Month,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data5)
> View(PK977_SEF643_HW1_TXWPopn)
> plot(Max.TemperatureF~Month,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = PK977_SEF643_HW1_TXWPopn)
> View(data5)
> write.csv(data5,"test.csv")
> plot(data5[,1],xlab= "Months",ylab = "Temperature",type = "l",col = "red")
> plot(data5[2],data5[1],xlab= "Months",ylab = "Temperature",type = "l",col = "red")
Error in stripchart.default(x1, ...) : invalid plotting method
> plot(PK977_SEF643_HW1_TXWPopn,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
Error in plot.default(...) : 
  formal argument "type" matched by multiple actual arguments
> View(PK977_SEF643_HW1_TXWPopn)
> data1 = subset(PK977_SEF643_HW1_TXWPopn,Year == 2011)
> View(data1)
> plot(Max.TemperatureF~Month,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data1)
> plot(Max.TemperatureF~CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data1)
> View(x)
> PK977_SEF643_HW1_TXWPopn <- read.csv("~/DataAnalytics_Fall2013/Hmwk1/DATAHW1/PK977_SEF643_HW1_TXWPopn.csv")
>   View(PK977_SEF643_HW1_TXWPopn)
> data1 = subset(PK977_SEF643_HW1_TXWPopn,Year == 2011)
> plot(Max.TemperatureF~CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data1)
> plot(Max.TemperatureF~CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = PK977_SEF643_HW1_TXWPopn)
> plot(Max.TemperatureF~CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data1)
> data1[0]
data frame with 0 columns and 1215 rows
> View(data1[1])
> data3 <- subset(data1,Zip.Code == 78712)
> View(data3)
> plot(Max.TemperatureF~CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red", data = data3)
> plot(data3$Max.TemperatureF~data3$CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
> View(data3)
> plot(data3$Max.TemperatureF~data3$Month,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
> plot(data3$Max.TemperatureF~data3$CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
> ggplot(data3$Max.TemperatureF~data3$CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
Error: ggplot2 doesn't know how to deal with data of class formula
> ggplot2(data3$Max.TemperatureF~data3$CDT,xlab= "Months",ylab = "Temperature",type = "l",col = "red")
Error: could not find function "ggplot2"
> plot(data3$Max.TemperatureF~data3$CDT,xlab= "Months",ylab = "Temperature",type = "b",col = "red")
> plot(data3$Max.TemperatureF~data3$CDT,xlab= "Months",ylab = "Temperature",type = "h",col = "red")
> View(data4)
> data1 = subset(PK977_SEF643_HW1_TXWPopn, Zip.Code == 78712 & Year == 2013)
> View(data1)
> d = density(data1$Max.TemperatureF)
> plot(d)
> d = density(data1$Max.TemperatureF,xlab = "Temperature",main = "Temp_Density")
Warning message:
In density.default(data1$Max.TemperatureF, xlab = "Temperature",  :
  non-matched further arguments are disregarded
> plot(d,xlab = "Temperature,main="Temp_Density_2013"")
Error: unexpected symbol in "plot(d,xlab = "Temperature,main="Temp_Density_2013"
> plot(data3$Max.TemperatureF~data3$row.names,xlab= "l",ylab = "Temperature",type = "h",col = "red")
Error in (function (formula, data = NULL, subset = NULL, na.action = na.fail,  : 
  invalid type (NULL) for variable 'data3$row.names'
> View(data3)
> plot(d,xlab = "Temperature,main="Temp_Density_2013"")
Error: unexpected symbol in "plot(d,xlab = "Temperature,main="Temp_Density_2013"
> plot(d,xlab = "Temperature,main="Temp_Density_2013")
Error: unexpected symbol in "plot(d,xlab = "Temperature,main="Temp_Density_2013"
> plot(d,xlab = "Temperature,ylab = "Density",main="Temp_Density_2013")
Error: unexpected symbol in "plot(d,xlab = "Temperature,ylab = "Density"
> plot(d,xlab = "Temperature",ylab = "Density",main="Temp_Density_2013")
> View(PK977_SEF643_HW1_TXWPopn)
> data2 = subset(PK977_SEF643_HW1_TXWPopn, Zip.Code == 78712 & Year == 2011)
> d = density(data2$Max.TemperatureF)
> plot(d,xlab = "Temperature",ylab = "Density",main="Temp_Density_2011")
> View(data4)
> View(data1)
> View(data2)
> maxhum = subset(data2,Max.Humidity)
Error in subset.data.frame(data2, Max.Humidity) : 
  'subset' must be logical
> maxhum = subset(data2$Max.Humidity)
Error in subset.default(data2$Max.Humidity) : 
  argument "subset" is missing, with no default
> maxhum = data2$Max.Humidity
> minSea = data2$Min.Sea.Level.PressureIn
> plot(maxhum,minSea,main="Scatter maxHum v. minSeaPress",xlab ="maxhum",ylab = "minSea")
> plot(data2$Max.Humidity,data2$Min.Sea.Level.PressureIn,main="Scatter maxHum v. minSeaPress",xlab ="maxhum",ylab = "minSea", col = ifelse(data2$EventBoolean==0,"red","green"))
> plot(data2$Max.Humidity,data2$Min.Sea.Level.PressureIn,main="Scatter maxHum v. minSeaPress",xlab ="maxhum",ylab = "minSea", col = ifelse(data2$EventBoolean==0,"red","black"))
> plot(data2$Max.Humidity,data2$Min.Sea.Level.PressureIn,main="Scatter maxHum v. minSeaPress",xlab ="maxhum",ylab = "minSea", col = ifelse(data2$EventBoolean==0,"black","red"))
> plot(data2$Max.Humidity,data2$Max.Gust.SpeedMPH,main="Scatter maxHum v. minSeaPress",xlab ="maxhum",ylab = "minSea", col = ifelse(data2$EventBoolean==0,"black","red"))
> plot(data2$Max.Humidity,data2$Max.Gust.SpeedMPH,main="Scatter maxHum v. maxGust",xlab ="maxhum",ylab = "maxGust", col = ifelse(data2$EventBoolean==0,"black","red"))
hist(dataUTEvent ~ UTEventdat)
Error in hist.default(dataUTEvent ~ UTEventdat) : 'x' must be numeric
> hist(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat)
Error in hist.default(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat) : 
  'x' must be numeric
> plot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat)
> plot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat, type ="l")
> plot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat, type ="l", main = "Speed on even Days")
> plot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat, type ="l", main = "Speed on Event Days")
> plot(dataUTNonEvent$Max.Gust.SpeedMPH ~ UTNonEventdat, type ="l", main = "Speed on NonEvent Days")
> boxplot( (dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat, main = "Speed on Event Days")
Error: unexpected ',' in "boxplot( (dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat,"
> boxplot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat, main = "Speed on Event Days")
> bwplot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat, main = "Speed on Event Days")
Error: could not find function "bwplot"
> boxplot(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat)
> rug(dataUTEvent$Max.Gust.SpeedMPH ~ UTEventdat)
Error in is.finite(x) : 
  default method not implemented for type 'language'
> help(boxplot)
> help(hist)
> hist(dataUTEvent$Max.Gust.SpeedMPH)
> hist(dataUTNonEvent$Max.Gust.SpeedMPH)

