use super::*;

////////////////////////////////////////////////
// Challenge 6
////////////////////////////////////////////////

// We need to show that the functions i and j...

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

// ...and with the Either injections (from challenge 5)...

fn i_prime(n: i16) -> Either<i16, bool> {
    Either::Left(n)
}
fn j_prime(b: bool) -> Either<i16, bool> {
    Either::Right(b)
}

// ...that there can't for a a factorization m(i: i16) -> Either<i16, bool> such that...
// i_prime == m . i
// j_prime == m . j
// for the entire domains of i/i_prime (all integers) and j/j_prime (all booleans):

#[cfg(test)]
mod test_wrong_factoring {
    use super::*;

    #[test]
    fn test_factorization() {
        // for nn in std::i16::MIN..std::i16::MAX {
        //     assert_eq!(i_prime(nn), m(i(nn)));
        // }

        // The above asserts that i_prime(0) == Left(0) == m(i(0)) == m(0)

        // assert_eq!(j_prime(true), m(j(true)));

        // The above asserts that j_prime(true) == Right(true) == m(j(true)) == m(0)

        // So m(0) == Left(0) == Right(true) which is impossible. m() can't exist.
    }
}

// fn m(n: i16) -> Either<i16, bool> {
//     panic!("Impossible")
// }
