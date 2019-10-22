pub fn memoize<A: 'static, B: 'static>(f: Box<dyn Fn(A) -> B>) -> Box<dyn Fn(A) -> B> {
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
        let memo_rand = memoize(Box::new(|_: ()| -> f64 { rand::thread_rng().gen() }));

        assert_ne!(memo_rand(()), memo_rand(())); // should work *most* of the time!
    }

    #[test]
    fn test_seeded_rng() {
        // TODO
    }
}
