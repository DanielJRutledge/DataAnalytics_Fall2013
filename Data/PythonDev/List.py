#extend list class

class List(list):
	 
	def flatten(self):
		out = [item for sublist in self for item in sublist]
		return out

def main():
	l = [i for i in range(10)]
	l.append([i for i in range(12,20,2)])
	print l

	flat = List(l).flatten


	print flat

main()