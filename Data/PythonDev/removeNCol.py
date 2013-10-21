import convertListToCsv
import convertCsvToLists

import os,sys


#Removes any zero indexed nth column from datafile. Removed column is in removedData variable but not written. 

def main():
	#python removeN.py file --removeCol n



	console = sys.argv[1:]
	csvFile = console[0]
	# file --removeCol n
	n = 0
	if len(console) > 1 and console[1] == "--removeCol":
		n = int(console[2])
	#0 indexed 

	data = convertCsvToLists.convert(csvFile)
	#lazy remove first
	if n == 0:
		data = [line[1:] for line in data if n==0]
		header = data[0]
		data = data[1:]
		string = convertListToCsv.convert(header,data)
		outfile = open("dataMinusFirst.csv","w")
		outfile.write(string)
		print "Output written to dataMinusFirst.csv"
	else:
		removedData = [line.pop(n) for line in data]
		header = data[0]
		data = data[1:]
		string = convertListToCsv.convert(header,data)
		outfile = open("dataMinus"+str(n)+".csv","w")
		outfile.write(string)
		print "Output written to dataMinus"+str(n)+".csv"

main()

