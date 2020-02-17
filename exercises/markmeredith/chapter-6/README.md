1.    Show the isomorphism between Maybe a and Either () a.

There is a bidirectional, one-to-one mapping between the two types, for every
value of every type `a`.

```
F(Nothing) <=> Left ()
F(Just a_value) <=> Right a_value
```

2. See `shape.cpp`; run with

```
> python -m pip install meson
> meson setup build
> meson test -v -C build
```

3. See commented lines in `shape.cpp`. We had to change the base class Shape and the two derived classes.

4. See commented lines in `shape.cpp`. We had to add a new class Square (but did not have to change the base class.)

In Haskell, we need to add `Square` to the `Shape` sum type, in addition to
adding versions of `area` and `circ` for `Shape`:

```
data Shape = Circle Float
           | Rect Float Float
           | Square Float
area (Square s) = s * s
circ (Square s) = 4.0 * s
```

5.  Show that a + a = 2 * a holds for types (up to isomorphism). Remember that 2 corresponds to Bool, according to our translation table.

`a + a` is the type `Either<a, a>`. `2 * a` is the type `(Bool, a)`.
There is a bidirectional, one-to-one mapping between the two types, for every
value of every type `a`.

```
Left a_value <=> (False, a_value)
Right a_value <=> (True, a_value)
```
