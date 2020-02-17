#include <iostream>

class Shape {
public:
  virtual ~Shape() {}
  virtual float area() {
    std::cerr << "?Unknown area?";
    return 0;
  }
  /////////////////////
  // ADDED FOR CIRC
  /////////////////////
  virtual float circ() {
    std::cerr << "?Unknown circumference?";
    return 0;
  }
  /////////////////////
  // END ADDED FOR CIRC
  /////////////////////
};

const float tau = 6.283185307179586;

class Circle : public Shape {
  float radius;

public:
  Circle(float r) : radius(r) {}
  float area() { return radius * radius * tau / 2; }
  /////////////////////
  // ADDED FOR CIRC
  /////////////////////
  float circ() { return radius * tau; }
  /////////////////////
  // END ADDED FOR CIRC
  /////////////////////
};

class Rect : public Shape {
  float length;
  float width;

public:
  Rect(float l, float w) : length(l), width(w) {}
  float area() { return length * width; }
  /////////////////////
  // ADDED FOR CIRC
  /////////////////////
  float circ() { return 2 * (length + width); }
  /////////////////////
  // END ADDED FOR CIRC
  /////////////////////
};

/********************/
/* ADDED FOR SQUARE */
/********************/
class Square : public Shape {
  float side;

public:
  Square(float s) : side(s) {}
  float area() { return side * side; }
  /////////////////////
  // ADDED FOR CIRC
  /////////////////////
  float circ() { return 4 * side; }
  /////////////////////
  // END ADDED FOR CIRC
  /////////////////////
};
/************************/
/* END ADDED FOR SQUARE */
/************************/

int main() {

  36*2*6.28
  auto circ = Circle(3.4);
  auto reck = Rect(4, 9);
  std::cout << "Circle area " << circ.area() << std::endl;
  std::cout << "Rectangle area " << reck.area() << std::endl;
  /////////////////////
  // ADDED FOR CIRC
  /////////////////////
  std::cout << "Circle circumference " << circ.circ() << std::endl;
  std::cout << "Rectangle circumference " << reck.circ() << std::endl;
  /////////////////////
  // END ADDED FOR CIRC
  /////////////////////

  /********************/
  /* ADDED FOR SQUARE */
  /********************/
  auto squr = Square(6);
  std::cout << "Squarea: " << squr.area() << std::endl;
  std::cout << "Square circumference: " << squr.circ() << std::endl;
  /************************/
  /* END ADDED FOR SQUARE */
  /************************/
}
