

def convert(file):
	#Assumes is a good csv file with good path
	#take in a file, split by newline. This creates a list where each element is a string 
	#corresponding to the line in the file
	infile = open(file).read().strip().split('\n')
	#takes in the file and splits each line by a comma, now it's a list of lists, each sublist is a line with each 
	#element corresponding to each entry. 2D list.
	#Use this list to manipulate data in most settings
	#print infile
	splitBycomma = [line.strip('\r').split(",") for line in infile]
	out = []
	for line in splitBycomma:
		#removing all data entries that are empty
		if reduce(lambda s, t : s+t,line) != "":
			if line[0][0].isalpha():
				out.append(line)
			else:
				#taking care of weird non alphabetic character at start of file.
				line[0] = line[0][1:]
				out.append(line)
	return out

"""
def main():

	convert("../Test/QB2003_2012.csv")
main()"""