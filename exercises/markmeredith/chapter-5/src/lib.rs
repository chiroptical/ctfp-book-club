#![allow(dead_code)]

#[derive(PartialEq, Debug)]
enum Either<A, B> {
    Left(A),
    Right(B),
}

mod challenge_4;
mod challenge_5;
mod challenge_6;
mod challenge_7;
mod challenge_8;
