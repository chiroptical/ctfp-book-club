#include <cmath>
#include <iostream>

template <class A> class optional {
  bool _isValid;
  A _value;

public:
  optional() : _isValid(false) {}
  optional(A v) : _isValid(true), _value(v) {}
  bool isValid() const { return _isValid; }
  A value() const { return _value; }
};

optional<double> safe_root(double x) {
  if (x >= 0) {
    return optional<double>{sqrt(x)};
  } else {
    return optional<double>{};
  }
}

optional<double> safe_reciprocal(double x) {
  if (x * x > 1e-10) {
    return optional<double>{1 / x};
  } else {
    return optional<double>{};
  }
}

auto const compose = [](auto m1, auto m2) {
  return [m1, m2](auto x) {
    if (!m1(x).isValid()) {
      return optional<double>{};
    }
    auto y = m1(x).value();
    if (!m2(y).isValid()) {
      return optional<double>{};
    }
    return m2(y);
  };
};

optional<double> safe_root_reciprocal(double x) {
  return compose(safe_root, safe_reciprocal)(x);
}

int main() {
  std::cout << "Think positive valid? " << safe_root_reciprocal(+4.0).isValid()
            << " is " << safe_root_reciprocal(+4.0).value() << std::endl;
  std::cout << "Think negative valid? " << safe_root_reciprocal(-4.0).isValid()
            << std::endl;
  std::cout << "Think nothing valid?  " << safe_root_reciprocal(+0.0).isValid()
            << std::endl;
}
