R code to add columns in the data with conditional data.

First, from the console command line:
>>data=<long name of data frame that you've already imported>
>>data$Event.Exists <- ifelse(data$Events=="", 0, 1)
the ifelse() command works like this...
ifelse([condition], A, B)
If the condition is true, then the function returns A. If it is false it returns B.


Be sure to then enter
>>View(data) to refresh the frame to view it in R Studio. Also, it probably isn't permanently re-writing the .csv file, so you will lose edits if you quit R Studio. I'll post more updates as I figure it out.

