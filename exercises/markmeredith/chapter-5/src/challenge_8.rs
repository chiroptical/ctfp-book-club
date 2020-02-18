use super::*;

// FIXME: TODO

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
    BooLint {
        n: n,
        b: n % 2 == 0,
    }
}

fn j(b: bool) -> BooLint {
    BooLint { n: 0, b: b }
}

// ...then we show that there exist...

fn m(bl: BooLint) -> Either<i16, bool> {
    if bl.b {
        Either::Left(2 * bl.n + 1)
    } else {
        Either::Left(2 * bl.n)
    }
}

fn i_prime(n: i16) -> Either<i16, bool> {
    if n % 2 == 0 {
        Either::Left(2 * n + 1)
    } else {
        Either::Left(2 * n)
    }
}
fn j_prime(b: bool) -> Either<i16, bool> {
    Either::Right(b)
}

// ...that satisfy...
// i == m . i_prime
// j == m . j_prime

// ...however we could also define...

// ...but we can also show that there exist...

fn m2(bl: BooLint) -> Either<i16, bool> {
    Either::Left(bl.n)
}

fn i_prime2(n: i16) -> Either<i16, bool> {
    Either::Left(n)
}
fn j_prime2(b: bool) -> Either<i16, bool> {
    Either::Right(b)
}

// ...that satisfy...
// i == m2 . i_prime2
// j == m2 . j_prime2

// so BooLint is not unique and can't be better than Either

#[cfg(test)]
mod test_factorings {
    use super::*;

    // FIXME: TODO
    // #[test]
    // fn test_factorization() {
    //     for nn in -1000..1000 {
    //         assert_eq!(i_prime(nn), m(i(nn)));
    //     }
    //     assert_eq!(j_prime(true), m(j(true)));
    //     assert_eq!(j_prime(false), m(j(false)));
    // }

    // FIXME: TODO
    // #[test]
    // fn test_other_factorization() {
    //     for nn in std::i16::MIN..std::i16::MAX {
    //         assert_eq!(i_prime2(nn), m2(i(nn)));
    //     }
    //     assert_eq!(j_prime2(true), m2(j(true)));
    //     assert_eq!(j_prime2(false), m2(j(false)));
    // }
}
