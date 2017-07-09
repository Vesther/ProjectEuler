# Ruby doesn't have a built-in factorial function, so we'll implement one:
def factorial(n)
	# The inject/reduce (these are aliases to the same method) function iterates over the elements of a enumerable
	# calling the specified method on each of them, passing it an accumulator and assigning the result back to the accumulator.
	(1..n).reduce(:*)
end

# The Lattice path problem is a known combinatorics issue which can be looked at as follows:
# In a 20x20 grid, we will always have to do 20 right and 20 down moves each, the only question is
# how the sequence of ups and rights will look. In essence, we have to choose 20 places out of 40 for our ups
# and the remaining places will be taken by rights. To get from (0,0) to (x,y) the number of possible moves
# is given by "x+y choose y", resulting in (x+y)! / x! * y!

def n_choose_k(n,k)
	factorial(n) / (factorial(k) * factorial(n-k))
end

# Now, sacrificing everything sensible and holy for neat looks, we'll monkey patch the integer class from which Fixnum inherits:
class Integer
	def factorial
		(1..self).reduce(:*) || 1
	end

	def choose(n)
		self.factorial / (n.factorial * (self-n).factorial) || 1
	end
end

# Which gets us the neat methods 3.choose(1) and 5.factorial
# Now onto printing the actual solution for the given 20x20 grid, eg. getting from (0,0) to (20,20):

puts 40.choose 20
