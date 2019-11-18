# ch02-haskell


1. memoize impl may be found in src/Main.hs. It is indeed more performant than the non-memoized version (benchmarks show this:)

```
benchmarking memoized
time                 2.676 μs   (2.418 μs .. 2.943 μs)
                     0.949 R²   (0.926 R² .. 0.976 R²)
mean                 2.489 μs   (2.331 μs .. 2.707 μs)
std dev              602.9 ns   (481.9 ns .. 904.6 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking non-memoized
time                 1.739 ms   (1.570 ms .. 1.933 ms)
                     0.955 R²   (0.933 R² .. 0.985 R²)
mean                 1.865 ms   (1.795 ms .. 1.967 ms)
std dev              294.1 μs   (222.9 μs .. 406.8 μs)
variance introduced by outliers: 85% (severely inflated)
```

2. Memoizing such a function would result in the same "random" value repeatedly. Obligatory XKCD https://www.xkcd.com/221/ ;

However, in the case of Haskell, if using e.g. randomRIO, memoizing such a function would
still work as usual (with caveats) because the memoized function returns the same IO "recipe",
and the recipe would provide a different random number each time.

3. Memoizing on the seed value would "work"; a random number generator that uses a
seed value will always return the same sequence of random values for a given seed.

4. (a) is pure; (b) - (d) are impure

5. there are 2^2 implementations of Bool -> Bool:
  - `const True`
  - `const False`
  - `not`
  - `id`


6. http://bit.ly/2WBQnKH
source is:
```
digraph G {
    Unit [label="()"];
    Void -> Unit [label="absurd"];
    Void -> Bool [label="absurd"];
    Void -> Void [label="id"];
    
    Unit -> Bool [label="const True"];
    Unit -> Bool [label="const False"];
    Unit -> Unit [label="id"];
    
    
    Bool -> Unit [label="const ()"];
    
    Bool -> Bool [label="id", headport=e, tailport=e];
    Bool -> Bool [label="not", headport=w, tailport=w];
    Bool -> Bool [label="const True", headport=s tailport=s];
    Bool -> Bool [label="const False", headport=s tailport=s];
}
```
