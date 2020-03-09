// 1. Isomorphism between Maybe a and Either () a

type Nothing = null
type Unit = null
type Maybe<A> = a | Nothing
type Either<A, B> = Left<A> | Right<B>
interface Left<A> {
  tag: "left"
  value: A
}
interface Right<B> {
  tag: "right"
  value: B
}
const left = <A>(a: A): Left<A> => ({tag: "left", value: a})
const right = <B>(b: B): Right<B> => ({tag: "right", value: b})

const eitherToMaybe = <A>(m: Maybe<A>): Either<Unit, A> =>
  m === null
    ? left(null)
    : right(m)

const maybeToEither = <A>(e: Either<Unit, A>): Maybe<A> =>
  e.tag === "left"
    ? null
    : e.value

// 2. Implement Shape and area

type Shape = Circle
           | Rect

interface Circle {
  tag: "circle"
  rad: number
}

interface Rect {
  tag: "rect"
  width: number
  height: number
}

const area = (s: Shape): number =>
  s.tag === "circle"
    ? Math.PI * s.rad * s.rad
    : s.width * s.height

// 3. Circ function

const circ = (s: Shape): number =>
  s.tag === "circle"
    ? 2 * Math.PI * s.rad
    : 2 * (s.width + s.height)

// 4.

interface Square {
  tag: "square"
  height: number
}

type newShape = Circle
              | Square
              | Rect

// 5. isomorphism between a + a and 2 * a

const iso1 = <A>(e: Either<A, A>): { a: A, b: boolean } =>
  e.tag === "left"
    ? { a: e.value, b: false }
    : { a: e.value, b: true }

const iso2 = <A>({a, b}: {a: A, b: boolean}): Either<A, A> =>
  b ? right(a) : left(a)
