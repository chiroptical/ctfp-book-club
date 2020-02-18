// 1. show that the terminal object is unique up to unique isomorphism

const undefToNull = (_: undefined): null => null
const nullToUndef = (_: null): undefined => undefined

// (x) => undefToNull(nullToUndef(x)) === id
// (x) => nullToUndef(undefToNull(x)) === id
// the only possible candidate for a terminal object in the category of Type
// is a type with a cardinality of 1 luckily javascript has 2 types with a
// cardinality of 1, this allows us to demonstrate the isomorphism
// since the number of possible functions is b^a for a => b we can see
// that there is only 1 possible isomorphism from a terminal object to the next

// 2. & 3. What is the product and coproduct of two objects in a poset?
/*
 * PRODUCT:
 * for the poset category where morphisms are less than or equals relations
 * the product is the greatest valued object that is less than the objects it
 * projects to
 * p1 = c <= a
 * p2 = c <= b
 * factorizer = c' <= c
 *
 * COPRODUCT:
 * for the poset category where morphisms are less than or equals relations
 * the coproduct is the least valued object that is greater than the objects
 * that inject to it
 * p1 = c <= a
 * p2 = c <= b
 * factorizer = c' <= c
*/

// 4. Implement either
export type Either<T, U> = Failure<T> | Success<U>

export interface Failure<F> {
	type: 'failure'
	failure: F
}
export const failure = <F>(f: F): Failure<F> => ({
	type: 'failure',
	failure: f,
})

export interface Success<S> {
	type: 'success'
	success: S
}

export const success = <S>(s: S): Success<S> => ({
	type: 'success',
	success: s,
})
