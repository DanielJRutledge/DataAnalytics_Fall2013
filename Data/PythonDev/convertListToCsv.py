
def convert(header, data):

	outStr = ""
	for i in header[:-1]:
		outStr += i + ","

	outStr += header[-1]+ '\n'
	for line in data:
		for item in line:
			if item != line[-1]:
				outStr+= item +","
			else:
				outStr += item +'\n'
	outStr.strip('\n')
	return outStr



