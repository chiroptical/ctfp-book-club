use super::*;

////////////////////////////////////////////////
// Challenge 5
////////////////////////////////////////////////
// We need to show that the functions i and j...

/// Using i16 instead of i32 to speed up "cargo test"
fn i(n: i16) -> i16 {
    n
}
fn j(b: bool) -> i16 {
    if b {
        0
    } else {
        1
    }
}

// ...can be factorized by...

fn m(e: Either<i16, bool>) -> i16 {
    match e {
        Either::Left(n) => i(n),
        Either::Right(b) => j(b),
    }
}

// ...with the natural injections...

fn i_prime(n: i16) -> Either<i16, bool> {
    Either::Left(n)
}
fn j_prime(b: bool) -> Either<i16, bool> {
    Either::Right(b)
}

// So we show that:
// i == m . i_prime
// j == m . j_prime
// for the entire domains of i/i_prime (all integers) and j/j_prime (all booleans):

#[cfg(test)]
mod test_factorings {
    use super::*;

    #[test]
    fn test_factorization() {
        for nn in std::i16::MIN..std::i16::MAX {
            assert_eq!(i(nn), m(i_prime(nn)));
        }
        assert_eq!(j(true), m(j_prime(true)));
        assert_eq!(j(false), m(j_prime(false)));
    }
}
