use super::*;

////////////////////////////////////////////////
// Challenge 8
////////////////////////////////////////////////

// Consider the candidate...

#[derive(PartialEq, Debug)]
struct BooLint {
    n: i16,
    b: bool,
}

// ...with injections...

fn i(n: i16) -> BooLint {
    BooLint { n: 2 * n, b: true }
}

fn j(b: bool) -> BooLint {
    BooLint { n: 1, b }
}

// ...then we show that there exist...

fn m(bl: BooLint) -> Either<i16, bool> {
    if bl.n % 2 == 0 {
        Either::Left(bl.n / 2)
    } else {
        Either::Right(bl.b)
    }
}

fn i_prime(n: i16) -> Either<i16, bool> {
    Either::Left(n)
}
fn j_prime(b: bool) -> Either<i16, bool> {
    Either::Right(b)
}

// ...that satisfy...
// i_prime == m . i
// j_prime == m . j

#[cfg(test)]
mod test_factorings {
    use super::*;

    #[test]
    fn test_factorization() {
        for nn in -1000..1000 {
            assert_eq!(i_prime(nn), m(i(nn)));
        }
        assert_eq!(j_prime(true), m(j(true)));
        assert_eq!(j_prime(false), m(j(false)));
    }
}

// ...however we could also define...

// ...but we can also show that there exist...

fn m2(bl: BooLint) -> Either<i16, bool> {
    if bl.n % 2 == 0 {
        Either::Left(bl.n / 2)
    } else {
        Either::Right(!bl.b)
    }
}

fn i_prime2(n: i16) -> Either<i16, bool> {
    Either::Left(n)
}
fn j_prime2(b: bool) -> Either<i16, bool> {
    Either::Right(!b)
}

// ...that satisfy...
// i_prime2 == m2 . i
// j_prime2 == m2 . j

// so BooLint is not unique and can't be better than Either

#[cfg(test)]
mod test_factorings2 {
    use super::*;

    #[test]
    fn test_other_factorization() {
        for nn in -1000..1000 {
            assert_eq!(i_prime2(nn), m2(i(nn)));
        }
        assert_eq!(j_prime2(true), m2(j(true)));
        assert_eq!(j_prime2(false), m2(j(false)));
    }
}
