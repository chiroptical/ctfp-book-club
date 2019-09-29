from id import id
from compose import compose

f = lambda x: x + 2
x = 2
assert(id(f(x)) == f(id(x)))
