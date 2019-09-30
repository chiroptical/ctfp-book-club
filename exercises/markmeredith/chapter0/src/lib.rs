pub fn identity<T>(a: T) -> T {
    a
}

pub fn compose<A: 'static, B: 'static, C: 'static>(
    f: Box<dyn Fn(A) -> B>,
    g: Box<dyn Fn(B) -> C>,
) -> Box<dyn Fn(A) -> C> {
    Box::new(move |x| g(f(x)))
}

#[cfg(test)]
mod tests {
    #[test]
    fn test_id() {
        assert_eq!(123, super::identity(123));
        assert_eq!("abc", super::identity("abc"));
    }

    #[test]
    fn test_compose() {
        fn square(x: i32) -> i32 {
            x * x
        }
        fn negative(x: i32) -> i32 {
            -x
        }
        assert_eq!(-16, super::compose(Box::new(square), Box::new(negative))(4))
    }

    #[test]
    fn test_identity_law() {
        fn square(x: i32) -> i32 {
            x * x
        }
        for n in 0..1000 {
            assert_eq!(
                n,
                super::compose(Box::new(super::identity), Box::new(super::identity))(n)
            );
            assert_eq!(
                square(n),
                super::compose(Box::new(square), Box::new(super::identity))(n)
            );
            assert_eq!(
                square(n),
                super::compose(Box::new(super::identity), Box::new(square))(n)
            )
        }
    }
}
