// 1. Implement identity function

const id = <A>(a: A): A => a

// 2. Implement composition function

const compose =
  <A, B, C>(f: (b: B) => C) =>
           (g: (a: A) => B ): (a: A) => C =>
           (a) => f(g(a))

// 3. Test that composition respects identity

const add = (a: number) => (b: number) => a + b

const leftIdentityTest =
  compose<number, number, number>(id)(add(1))(2) === add(1)(2)
const rightIdentityTest =
  compose<number, number, number>(add(1))(id)(2) === add(1)(2)

console.log(leftIdentityTest)
console.log(rightIdentityTest)

// 4. Is the world wide web a category?
// yes, links compose and the link to the current page / refresh button is identity

// 5. Is facebook a category?
// No, connections are morphisms but you cannot add yourself as a friend therefore there is no identity connection

//6. When is a directed graph a category?
//Directed graphs, by definition, have composition, so they are a category when they are a multigraph i.e. when they have identity edges on the vertices

