from math import sqrt

# University maths turn out to be quite handy for some things.
def fib(n):
	return int(((1+sqrt(5))**n-(1-sqrt(5))**n)/(2**n*sqrt(5)))

sum = 0
n = 0

while True:
	temp = fib(n)
	n += 1
	if temp < 4000000:
		if temp % 2 == 0:
			sum += temp
	else:
		break

print sum
