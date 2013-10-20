# take in csv file, take in name for new column, add this data to new column
import os,sys
import convertCsvToLists
import convertListToCsv

def main():
	consoleInput = sys.argv
	#console input will go like this: python AddColumnWithData.py file.csv --label "Position" --entry "QB"
	inFile = consoleInput[1]
	print "Running: " + inFile
	label = ""
	entry = ""
	for idx,val in enumerate(consoleInput):
		if val == "--label": label = consoleInput[idx+1]
		elif val == "--entry": entry = consoleInput[idx+1]

	#print label,entry
	data = convertCsvToLists.convert(inFile)
	#Assumes header is top
	header = data[0]
	#print header
	dataMod = data[1:]

	header.append(str(label))
	#print header
	[line.append(entry) for line in dataMod]
	#print dataMod

	outfile = open(inFile.split("/")[-1].split(".")[0]+" modified.csv","w")

	outStr = convertListToCsv.convert(header, dataMod)

	outfile.write(outStr)
	outfile.close()

main()