#!/home/rohan/projects/3py/bin/python

class add(int):
	def __init__ (self,arg=0):
		self.arg = arg
	def __call__ (self,other):
		return add(self.arg + other)


print(add(4)(5)) 