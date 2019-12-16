1. TODO
2. TODO See test_rng in src/lib.rs; does not work!
3. TODO See test_seeded_rng in src/lib.rs; works!

4. (a) is the only pure function

5. four possible functions:
 - id_bool: bool->bool
 - not: bool->bool
 - or_true: bool->bool
 - and_false: bool->bool

6. Objects:  void, unit, bool

Morphisms:
 - id_void aka absurd_void: void->void
 - absurd_bool: void->bool
 - absurd_unit: void->unit
 - id_unit aka unit_unit: unit->unit
 - const_true: unit->bool
 - const_false: unit->bool
 - unit_bool: bool->unit
 - id_bool: bool->bool
 - not: bool->bool
 - or_true: bool->bool
 - and_false: bool->bool

Morphism Compositions:
id_void∘id_void = id_void
absurd_bool∘id_void = absurd_bool
absurd_unit∘id_void = absurd_unit
id_unit∘absurd_unit = absurd_unit
const_true∘absurd_unit = absurd_bool
const_false∘absurd_unit = absurd_bool
id_unit∘unit_bool = unit_bool
unit_bool∘id_bool = unit_bool
unit_bool∘not = unit_bool
unit_bool∘or_true = unit_bool
unit_bool∘and_false = unit_bool
unit_bool∘and_false = unit_bool
id_bool∘and_false = and_false
id_bool∘or_true = or_true
id_bool∘id_bool = id_bool
id_bool∘not = not
id_bool∘const_true = const_true
id_bool∘const_false = const_false
not∘not = id_bool
not∘id_bool = not
not∘or_true = and_false
not∘and_false = or_true
not∘const_false = const_true
not∘const_true = const_false
and_true∘id_bool = and_true
and_true∘not = and_true
and_true∘and_true = and_true
and_true∘or_false = and_true
and_true∘const_false = and_true
and_true∘const_true = and_true
or_false∘id_bool = or_false
or_false∘not = or_false
or_false∘and_true = or_false
or_false∘or_false = or_false
or_false∘const_false = or_false
or_false∘const_true = or_false
