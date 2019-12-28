// 1.
interface Nothing {
  pattern: "nothing"
}

interface Just<A> {
  pattern: "just"
  value: A
}

type Maybe<A> = Nothing | Just<A>

const nothing: Nothing = { pattern: "nothing" }

const pureMaybe = <A>(value: A): Maybe<A> => ({
  pattern: "just",
  value
})

const composeMaybe = <A, B, C>(f: (b: B) => Maybe<C>) =>
  (g: (a: A) => Maybe<B>) =>
    (a: A): Maybe<C> => {
      const x = g(a)
      return x.pattern === "just"
        ? f(x.value)
        : x
    }

// 2.
const safeReciprocal = (n: number): Maybe<number> => n === 0
  ? nothing
  : pureMaybe(1 / n)

// 3.
const safeRoot = (n: number): Maybe<number> => n <= 0
  ? nothing
  : pureMaybe(Math.sqrt(n))

composeMaybe<number, number, number>(safeRoot)(safeReciprocal)
