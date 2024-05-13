void main() {
  functionsAsValues();
  print('------------------------------');
  higherOrderFunctionsWithCollections();
  print('------------------------------');
  callbackFunctions();
  print('------------------------------');
  closuresAndScope();
}

// # Functions as Values
void functionsAsValues() {
  // ## Assigning Functions to Variables
  int number = 4;
  String greeting = 'hello';
  bool isHungray = true;

  print(number.runtimeType);
  print(greeting.runtimeType);
  print(isHungray.runtimeType);

  Function multiply = (int a, int b) {
    return a * b;
  };
  print(multiply.runtimeType);

  // ## Passing Functions to Functions
  void namedFunction(Function anonymouseFunction) {
    // function body
  }

  // ## Returning Functions From Functions
  Function namedFunction2() {
    return () => print('hello');
  }
}

// # Higher-Order Functions With Collections
void higherOrderFunctionsWithCollections() {
  // ## For-Each Loops
  // ### Iterating Over a List
  const numbers = [1, 2, 3];
  numbers.forEach((int number) {
    print(3 * number);
  });

  // omit the type annotation
  numbers.forEach((number) {
    print(3 * number);
  });

  // because the anonymous function body only contains a single line,
  // replace curly braces with arrow notation:
  numbers.forEach((number) => print(3 * number));

  // Effective Dart guide recommends against using function literals in forEach loops:
  for (final number in numbers) {
    print(3 * number);
  }

  final triple = (int x) => print(3 * x);
  numbers.forEach(triple);
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ### Iterating Over a Map
  final flowerColor = {
    'roses': 'red',
    'violets': 'blue',
  };

  flowerColor.forEach((flower, color) {
    print('$flower are $color');
  });

  print('i \u2764 Dart');
  print('and so do you');
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Mapping One Collection to Another
  const numbers2 = [2, 4, 6, 8, 10, 12];
  final looped = <int>[];
  for (final x in numbers2) {
    looped.add(x * x);
  }
  print(looped);

  final mapped = numbers2.map((x) => x * x);
  print(mapped);
  print(mapped.toList());

  // ## Filtering a Collection
  final myList = [1, 2, 3, 4, 5, 6];
  final odds = myList.where((element) => element.isOdd);
  print(odds);
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Consolidating a Collection
  // ### Using Reduce
  const evens = [2, 4, 6, 8, 10, 12];
  final total = evens.reduce((sum, element) => sum + element);
  print(total);

  /*
  final emptyList = <int>[];
  final result = emptyList.reduce((sum, element) => sum + element); // error
  print(result);
  */

  // ### Using Fold
  final total2 = evens.fold<int>(
    0,
    (sum, element) => sum + element,
  );
  print(total2);

  final emptyList = <int>[];
  final result = emptyList.fold<int>(
    0,
    (sum, element) => sum + element,
  );
  print(result);

  // ## Sorting a List
  final desserts = ['cookies', 'pie', 'donuts', 'brownies'];
  desserts.sort();
  print(desserts);

  desserts.sort((d1, d2) => d1.length.compareTo(d2.length));
  print(desserts);
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Combining Higher-Order Methods
  const desserts2 = ['cake', 'pie', 'donuts', 'brownies'];
  final bigTallDesserts = desserts2
      .where((dessert) => dessert.length > 5)
      .map((dessert) => dessert.toUpperCase())
      .toList();
  print(bigTallDesserts);

  // imperative way:
  const desserts3 = ['cake', 'pie', 'donuts', 'brownies'];
  final bigTallDesserts3 = <String>[];
  for (final item in desserts3) {
    if (item.length > 5) {
      final upperCase = item.toUpperCase();
      bigTallDesserts3.add(upperCase);
    }
  }
  print(bigTallDesserts3);
}

// # Callback Functions
void callbackFunctions() {
  // ## Void Callback
  final myButton = Button(
    title: 'Click me!',
    onPressed: () {
      print('Clicked');
    },
  );

  myButton.onPressed();
  myButton.onPressed.call();

  /*
  final anotherButton = Button(
      title: 'Click me, too!',
      onPressed: (int apple) {
        print('Clicked');
        return 42;
      });
    */
  // anotherButton.onPressed(23);

  final myWidget = MyWidget(onTouch: (x) => print(x));
  myWidget.onTouch(3.14);

  final myWidget2 = AnotherWidget(
    timeStamp: () => DateTime.now().toIso8601String(),
  );

  final timeStamp = myWidget2.timeStamp?.call();
  print(timeStamp);

  // Simplifying With Tear-Offs
  final manager = StateManager();

  final myButton2 = Button(
    title: 'Click me!',
    /*
      onPressed: () {
        manager.handleButtonClick();
      },
      */
    onPressed: manager.handleButtonClick,
  );
  myButton2.onPressed();

  const cities = ['Istanbul', 'Ankara', 'Izmir', 'Bursa', 'Antalya'];
  cities.forEach((city) => print(city));

  cities.forEach(print);

  // Renaming With Type Aliases
  ZipCode code = 87101;
  int number = 42;

  print(code is ZipCode); // => true
  print(code is int); // => true
  print(number is ZipCode); // => true
  print(number is int); // => true
}

typedef ZipCode = int;

// ### Implementing a Class That Takes a Void Callback
class Button {
  Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  // ### Specifying the Function Type
  final void Function() onPressed;
}

// ## Value Setter Callback
class MyWidget {
  MyWidget({
    required this.onTouch,
  });

  final void Function(double xPosition) onTouch;
}

// ## Value Getter Callback
class AnotherWidget {
  AnotherWidget({
    this.timeStamp,
  });

  final String Function()? timeStamp;
}

class StateManager {
  int _counter = 0;

  void handleButtonClick() {
    _counter++;
  }
}

class Gizmo {
  Gizmo({
    required this.builder,
  });

  // final Map<String, int> Function(List<int>) builder;
  final MapBuilder builder;
}

typedef MapBuilder = Map<String, int> Function(List<int>);

// # Closures and Scope
void closuresAndScope() {
  var counter = 0;
  final incrementCounter = () {
    counter += 1;
  };

  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  print(counter);

  final counter1 = countingFunction();
  final counter2 = countingFunction();

  print(counter1());
  print(counter2());
  print(counter1());
  print(counter1());
  print(counter2());
}

// ## A Function That Counts Itself
Function countingFunction() {
  var counter = 0;
  final incrementCounter = () {
    counter += 1;
    return counter;
  };
  return incrementCounter;
}
