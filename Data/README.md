All phases of project Data should be stored somewhere in this tree. We can decide precisely how to arrange this later.
I would recommend maintaining clear documentation practices and including csv versions of all relevant data files. It'll
be much easier to manage.


File "BigData.csv" has the following:

All of Lachab's files from the Test directory, merged and sorted by name. Position and Values corresponding to their positions
have been added to this data file. 



Still to do:

1. Add a team code column to this new big csv correlated to the Team_Code_Conv.csv file, match the team name text strings in Lachab's files to the NCAA team code number in the team_Code file. 
Once the team code number column is added, we should remove the abbreviated team name text string column from the big csv.
2. Add the data from the scheduleStrength.csv and teamTotalOffense.csv to the big csv file. These should be merged by team code and year. This should make the big csv have a lot of duplicate data values, since every player on the same team and same year will have the same team stats, but this is OK.
3. Create a program to give each unique player a unique ID number. 




