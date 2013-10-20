import os,sys
import convertListToCsv
#Program not finished!

#takes in list of lists, find which items are in every sub list and returns list of those elements
def setOfLabelsInAllHeaders(headers):
	numFiles = len(headers)
	#interesting flatten method
	flatHeaders = [item for sublist in headers for item in sublist]
	headersInAllFiles = [label for label in flatHeaders if flatHeaders.count(label) == numFiles]
	return set(headersInAllFiles)


#take in a list, see if all elements are equal or not.
def areEqualBool(l):
	f = l[0]
	for n in l:
		if n != f:	
			return False
	return True



def fitData(headers,dataFiles,nullValue):

	for label in headers:
	for f in dataFiles:
		idxHeader = f[0].index(label)
		print f[0],idxHeader
####find elements in header that are in dataFiles and keep those values, fill in null values where needed. 


def main():
	directory  = os.listdir(sys.argv[1])
	files = filter(lambda i: "csv" in i, directory)

	print "Which of the following csv files shall I merge (separate input by commas): "+str(files)
	selection = raw_input("Selection: ").split(",")
	selection = [int(i) for i in selection]
	useFiles =  [i for i in files if files.index(i) in selection]
	openfiles = [open(i).read().strip().split('\n') for i in useFiles]
	header = openfiles[0][0]
	headers = []
	for i in range(len(openfiles)):
		headers.append(openfiles[i][0].split(","))

	
	#test if all columns in all headers are the same, doesn't check literal value
	areEqual = [len(h) for h in headers]
	if areEqualBool(areEqual):
		cleanFiles = [d[1:] for d in openfiles]
		outf =""
		for datafile in cleanFiles:
			for row in datafile:
				outf += row
				outf += "\n"
		outfile = open("MergedOutfile.csv","w")
		outfile.write(header)
		outfile.write("\n")
		outfile.write(outf)

	else:
		print "Warning all columns are not equal! Fitting data with null values."
		null = raw_input("What null value should I use: ")

		setHeaders = setOfLabelsInAllHeaders(headers)
		#set of headers that are in all files, all data with data -> rows list
		fitData(setHeaders,openfiles,null)





main()