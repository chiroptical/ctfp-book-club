interface Pair<A, B> {
  first: A
  second: B
}

interface Bifunctor<A, B> {
  bif: Pair<A, B>
  bimap: <C, D>(f: (a: A) => C) => (g: (b: B) => D) => Bifunctor<C, D>
  first: <C>(f: (a: A) => C) => Bifunctor<C, B>
  second: <D>(g: (b: B) => D) => Bifunctor<A, D>
}

// Note: The implementation was so ugly I just stopped. I MISS MY HKTS