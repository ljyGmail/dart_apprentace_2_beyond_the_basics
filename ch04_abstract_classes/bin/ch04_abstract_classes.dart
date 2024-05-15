void main() {
  cannotInstantiateAbstractClasses();
  print('------------------------------');
  treatingConcreteClassesAsAbstract();
}

// # Creating Your Own Abstract Classes
abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}

// # Can't Instantiate Abstract Classes
void cannotInstantiateAbstractClasses() {
  // final animal = Animal();

  // ## Testing the Results
  final platypus = Platypus();
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  platypus.layEggs();
  print(platypus);
}

// # Concrete SubClass
class Platypus extends Animal {
  // ## Filling in the TODOs
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }

  void layEggs() {
    print('Plop plop');
  }
}

// # Treating Concrete Classes As Abstract
void treatingConcreteClassesAsAbstract() {
  Animal platypus = Platypus();
  // platypus.layEggs();
  print(platypus);
}
