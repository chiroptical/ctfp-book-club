Since I handed in my exercises during the stream, I'm omitting questions 4-6.

1. In jq, identity filter: `.`
2. In jq, composition operator: `f | g`
3. In jq, proving left and right identities:

   ```jq
   def prove_identity(f):
     (f | .) == f and (. | f) == f;
   ```

   A tricky detail: `empty | .` and `. | empty` both produce `empty`, but
   they're not comparable for equality, since `empty` represents the absence
   of a value, so `prove_identity` would not produce `true` here. Fixing this:

   ```jq
   def prove_identity(f):
     [f | .] == [f] and [. | f] == [f];
   ```

   Another tricky detail: `.` is also an identity for filters that produce
   runtime errors, but they're also not comparable for equality since they
   halt evaluation, so `prove_identity` would not produce `true` here either.
   Fixing this:

   ```jq
   def prove_identity(f):
     [try f | .] == [try f] and [. | try f] == [try f];
   ```

   As filters can be non-terminating, they don't form a monoid with `.` as the
   identity and `|` as the composition operator in the strictest sense. (Also,
   this property test along with one for transitivity will go into my [hs-jq][1]
   test suite once my syntax-tree generator is done.)

[1]: https://github.com/sshine/hs-jq/
