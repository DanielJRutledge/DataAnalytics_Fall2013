

def convert(file):
	#Assumes is a good csv file with good path
	infile = open(file).read().strip().split('\n')
	splitBycomma = [line.strip('\r').split(",") for line in infile]
	out = []
	for line in splitBycomma:
		if reduce(lambda s, t : s+t,line) != "":
			if line[0][0].isalpha():
				out.append(line)
			else:
				line[0] = line[0][1:]
				out.append(line)
	return out

"""
def main():

	convert("../Test/QB2003_2012.csv")
main()"""