import convertListToCsv
import convertCsvToLists

import os,sys


def main():
	#python removeN.py file
	#currently only removes the first element in the data file. Will remove and element in the future. 
	console = sys.argv[1:]
	csvFile = console[0]
	# file --removeCol n
	n = 0
	#if console[1] == "--removeCol":
	#	n = int(console[2])
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

main()

