import abc

class Bifunctor(abc.ABC):
    @abc.abstractmethod
    def bimap(self):
        pass

    @abc.abstractmethod
    def first(self):
        pass

    @abc.abstractmethod
    def second(self):
        pass

class PairBifunctor(Bifunctor):
    def bimap(self, f, g, pair):
        x, y = pair
        return (f(x), g(y))

    def first(self, f, pair):
        x, y = pair
        return (f(x), y)

    def second(self, g, pair):
        x, y = pair
        return (x, g(y))

pair_bifunctor = PairBifunctor()

example = (0, "hello")

plus_42 = lambda x: x + 42
append_world = lambda x: f"{x} world"

print(pair_bifunctor.bimap(plus_42, append_world, example))
print(pair_bifunctor.first(plus_42, example))
print(pair_bifunctor.second(append_world, example))
