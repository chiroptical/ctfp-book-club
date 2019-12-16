// 2a. preorder
// 2b. Not familiar with compilation in C++ but I assume a Partial Order

// 3.
interface Monoid<T> {
  mempty: T
  mappend: (a: T) => (b: T) => T
}

const boolMonoidAnd: Monoid<boolean> = {
  mempty: true,
  mappend: (a) => (b) => a && b
}

const boolMonoidOr: Monoid<boolean> = {
  mempty: false,
  mappend: (a) => (b) => a || b
}

