pub fn memoize<A: 'static, B: 'static>(f: Box<dyn Fn(A) -> B>) -> Box<dyn Fn(A) -> B> {
    //TODO....Didn't get around to it!!!
    Box::new(move |x| f(x))
}

#[cfg(test)]
mod tests {
    use super::memoize;
    #[test]
    fn test_memoize() {
        fn square(x: i32) -> i32 {
            x * x
        }
        let memo_square = memoize(Box::new(square));
        assert_eq!(16, memo_square(4));
        assert_eq!(16, memo_square(4));
    }

    use rand::prelude::*;

    #[test]
    fn test_rng() {
        let memo_rand = memoize(Box::new(|_: ()| -> i32 { rand::thread_rng().gen() }));

        // a working memo_rand would return the same value every time it's called
        // assert that it's NOT equal to show that it doesn't work (almost always, anyway!)
        assert_ne!(memo_rand(()), memo_rand(()));
    }

    #[test]
    fn test_seeded_rng() {
        use rand_chacha;

        let memo_seeded_rand = memoize(Box::new(|_: ()| -> i32 {
            rand_chacha::ChaCha8Rng::seed_from_u64(15203).gen()
        }));

        // a working memoized version of seeded_rand returns the same value every time it's called
        assert_eq!(memo_seeded_rand(()), memo_seeded_rand(()));
    }
}
