export {}

// 1. write a memoize function
interface MMap<A> {
  [key: string]: A
}

const memoize = <A, B>(f: (a: A) => B) => {
  const lookup: MMap<B> = {}
  return (a: A) => {
    const s = JSON.stringify(a)
    if (lookup[s]) {
      return lookup[s]
    } else {
      const val = f(a)
      lookup[s] = val
      return val
    }
  }
}

const fib = (n: number): number => n === 0
  ? 1
  : n === 1
    ? 2
    : fib (n - 1) + fib (n - 2)

const mFib = memoize(fib)

console.log(fib(5))
console.log(mFib(45))
console.log(mFib(45))
console.log(mFib(46))

// 2/3. does memoizing a random number generator work?
// No
const mRand = memoize(Math.random)
console.log(mRand(1))
console.log(mRand(1))
console.log(mRand(1))
console.log(mRand(1))

// 4. which C++ functions are pure?
// a. yes
// b. no
// c. no
// d. yes

// 5. How many functions are there from bool -> bool?
// 2^2 === 4
const b1 = (a: boolean) => true
const b2 = (a: boolean) => false
const b3 = (a: boolean) => a
const b3 = (a: boolean) => !a
