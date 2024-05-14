void main() {
  creatingYourFirstSubclass();
  print('------------------------------');
  overridingParentMethods();
  print('------------------------------');
  multiLevelHierarchy();
  print('------------------------------');
  typeInferenceInAMixedList();
  print('------------------------------');
  checkingAnObjectTypeAtRuntime();
}

// # Creating Your First Subclass
void creatingYourFirstSubclass() {
  final jon = Person('Jon', 'Snow');
  final jane = Student('Jane', 'Snow');
  print(jon.fullName);
  print(jane.fullName);

  final historyGrade = Grade.B;
  jane.grades.add(historyGrade);
}

enum Grade { A, B, C, D, F }

// ## Creating Similar Classes
class Person {
  Person(this.givenName, this.surname);

  String givenName;
  String surname;
  String get fullName => '$givenName $surname';

  @override
  String toString() => fullName;
}

/*
class Student {
  Student(this.givenName, this.surname);

  String givenName;
  String surname;
  var grades = <Grade>[];
  String get fullName => '$givenName $surname';

  @override
  String toString() => fullName;
}
*/

// ## Subclassing to Remove Code Duplication
class Student extends Person {
  // Student(String givenName, String surname) : super(givenName, surname);

  // ## Super Parameters
  Student(super.givenName, super.surname);

  var grades = <Grade>[];

  @override
  String get fullName => '$surname, $givenName';
}

// ## Calling Super Last in an Initializer List
/*
class someChild extends SomeParent {
  SomeChild(double height, double width, String name)
    : _width = width, // initializer
    : _height = height, // initializer
    super(name); // super

  final double _width;
  final double _height;
}
*/

// # Overriding Parent Methods
void overridingParentMethods() {
  final child = SomeChild();
  child.doSomeWork();
}

// ## Calling Super From an Overridden Method
class SomeParent {
  void doSomeWork() {
    print('parent working');
  }
}

class SomeChild extends SomeParent {
  @override
  void doSomeWork() {
    super.doSomeWork();
    print('child doing some other work');
    super.doSomeWork();
  }
}

// # Multi-Level Hierarchy
void multiLevelHierarchy() {
  final jessie = SchoolBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'McFly');
  print(jessie);
  print(marty);
}

class SchoolBandMember extends Student {
  SchoolBandMember(super.givenName, super.surname);

  static const minimumPracticeTime = 2;
}

// ## Sibling Classes
class StudentAthlete extends Student {
  StudentAthlete(super.givenName, super.surname);

  bool get isEligible => grades.every((grade) => grade != Grade.F);
}

// ## Visualizing the Hierarchy

// # Type Inference in a Mixed List
void typeInferenceInAMixedList() {
  final jane = Student('Jane', 'Snow');
  final jessie = SchoolBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'McFly');

  final students = [jane, jessie, marty];
  print(students.runtimeType);
}

// # Checking an Object's Type at Runtime
void checkingAnObjectTypeAtRuntime() {
  final jessie = SchoolBandMember('Jessie', 'Jones');

  print(jessie is Object); // => true
  print(jessie is Person); // => true
  print(jessie is Student); // => true
  print(jessie is SchoolBandMember); // => true
  print(jessie is! StudentAthlete); // => true
}

// # Prefer Composition Over Inheritance