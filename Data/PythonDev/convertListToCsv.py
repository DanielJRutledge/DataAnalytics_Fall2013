
def convert(header, data):

	outStr = ""
	for i in header[:-1]:
		#lower case header items to make merging easier -> stupid way to handle this problem. 
		outStr += i.lower() + ","

	outStr += header[-1]+ '\n'
	for line in data:
		for item in range(len(line)):
			if item < len(line)-1:
				outStr+= line[item] +","
			else:
				outStr += line[item] +'\n'
	outStr.strip('\n')
	return outStr



