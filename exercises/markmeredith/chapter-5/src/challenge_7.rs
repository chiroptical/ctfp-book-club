use super::*;

////////////////////////////////////////////////
// Challenge 7
////////////////////////////////////////////////
// For the functions i and j...

/// Using i16 instead of i32 to speed up "cargo test"
fn i(n: i16) -> i16 {
    if n < 0 {
        n
    } else {
        n + 2
    }
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

// ...and we show that...
// i == m . i_prime
// j == m . j_prime

// ...just like Challenge 6, but we also can define the function...

fn m_inv(n: i16) -> Either<i16, bool> {
    match n {
        0 => Either::Right(true),
        1 => Either::Right(false),
        _ => {
            if n < 0 {
                Either::Left(n)
            } else {
                Either::Left(n - 2)
            }
        }
    }
}

// ...and show that...
// m_inv . i == i_prime
// m_inv . j == j_prime

// Therefore i16 with these injections is *almost* isomorphic to Either<i16, bool> except for the finite precision of the integer type i16.

// Defining m() and m_inv() on the entire range of i16 would overflow integer addition.

#[cfg(test)]
mod test_factorings {
    use super::*;

    #[test]
    fn test_factorization() {
        for nn in std::i16::MIN..(std::i16::MAX - 2) {
            assert_eq!(i(nn), m(i_prime(nn)));
        }
        assert_eq!(j(true), m(j_prime(true)));
        assert_eq!(j(false), m(j_prime(false)));
    }

    #[test]
    fn test_inv_factorization() {
        for nn in std::i16::MIN..(std::i16::MAX - 2) {
            assert_eq!(i_prime(nn), m_inv(i(nn)));
        }
        assert_eq!(j_prime(true), m_inv(j(true)));
        assert_eq!(j_prime(false), m_inv(j(false)));
    }
}
