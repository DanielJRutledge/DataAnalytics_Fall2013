import os, sys

#script to find header of a file and merge a whole bunch of files together into one


def main():
	files = os.listdir(".")
	files = filter(lambda i: "csv" in i, files)
	print "Which of the following csv files shall I merge (separate input by commas): "+str(files)
	selection = raw_input("Selection: ").split(",")
	selection = [int(i) for i in selection]
	useFiles =  [i for i in files if files.index(i) in selection]
	openfiles = [open(i).read().strip().split('\n') for i in useFiles]
	header = openfiles[0][0]
	headers = []
	for i in range(len(openfiles)):
		headers.append(openfiles[i][0].split(","))
	areEqual = [len(h) for h in headers]
	f = areEqual[0]
	for n in areEqual:
		if n != f:
			print "WARNING HEADERS ARE NOT EQUAL LENGTH!!!"
		
	#print headers
	#print areEqual
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
main()