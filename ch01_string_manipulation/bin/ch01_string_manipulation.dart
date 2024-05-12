void main() {
  basicStringManipulation();
  print('------------------------------');
  buildingStrings();
  print('------------------------------');
  stringValidation();
  print('------------------------------');
  extractingText();
}

// # Basic String Manipulation
void basicStringManipulation() {
  // ## Changing the Case
  const userInput = 'sPoNgEbOb@eXaMpLe.cOm';
  final lowercase = userInput.toLowerCase();
  print(lowercase);

  // ## Adding and Removing at the Ends
  // ### Trimming
  const userInput2 = '  221B Baker St.     ';
  print('@$userInput2@');
  final trimmed = userInput2.trim();
  print('@$trimmed@'); // => '221B Baker St.'

  // ### Padding
  // final time = Duration(hours: 1, minutes: 32, seconds: 57); // 1:32:57
  final time = Duration(hours: 1, minutes: 2, seconds: 3); // 1:2:3
  final hours = time.inHours;
  final minutes = time.inMinutes % 60;
  final seconds = time.inSeconds % 60;
  final timeString = '$hours:$minutes:$seconds';
  print(timeString);

  final time2 = Duration(hours: 1, minutes: 2, seconds: 3);
  final hours2 = time2.inHours;
  final minutes2 = '${time.inMinutes % 60}'.padLeft(2, '0');
  final seconds2 = '${time.inSeconds % 60}'.padLeft(2, '0');
  final timeString2 = '$hours2:$minutes2:$seconds2';
  print(timeString2); // 1:02:03

  // ### Splitting and Joining
  const csvFileLine = 'Martin,Emma,12,Paris,France';
  final fields = csvFileLine.split(',');
  print(fields);

  final joined = fields.join('-');
  print(joined);

  // ### Replacing
  const phrase = 'live and learn';
  final withUnderscores = phrase.replaceAll(' ', '_');
  print(withUnderscores);
}

// Building Strings
void buildingStrings() {
  var message = 'Hello' + ' my name is ';
  const name = 'Ray';
  message += name;
  print(message); // => 'Hello my name is Ray'

  // ## Improving Efficiency With String Buffers
  final message2 = StringBuffer();
  message2.write('Hello');
  message2.write(' my name is ');
  message2.write('Ray');
  print(message2.toString()); // => 'Hello my name is Ray'

  // ## Building Strings in a Loop
  for (int i = 2; i <= 1024; i *= 2) {
    print(i);
  }

  final buffer = StringBuffer();
  for (int i = 2; i <= 2014; i *= 2) {
    buffer.write(i);
    buffer.write(' ');
  }
  print(buffer);
}

// # String Validation
void stringValidation() {
  const text = 'I love Dart';
  print(text.startsWith('I')); // => true
  print(text.endsWith('Dart')); // => true
  print(text.contains('love')); // => true
  print(text.contains('Flutter')); // => false
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Regular Expressions
  // ### Matching Literal Characters
  final regex = RegExp('cat');
  print(regex.hasMatch('concatenation')); // => true
  print(regex.hasMatch('dog')); // => false
  print(regex.hasMatch('cats')); // => true

  print('concatenation'.contains(regex)); // => true
  print('dog'.contains(regex)); // => false
  print('cats'.contains(regex));
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Matching Any Single Character
  final matchSingle = RegExp('c.t');
  print(matchSingle.hasMatch('cat')); // => true
  print(matchSingle.hasMatch('cot')); // => true
  print(matchSingle.hasMatch('cut')); // => true
  print(matchSingle.hasMatch('ct')); // => false
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  final optionalSingle = RegExp('c.?t');
  print(optionalSingle.hasMatch('cat')); // => true
  print(optionalSingle.hasMatch('cot')); // => true
  print(optionalSingle.hasMatch('cut')); // => true
  print(optionalSingle.hasMatch('ct')); // => true
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Matching Multiple Characters
  final oneOrMore = RegExp('wo+w');
  print(oneOrMore.hasMatch('ww')); // => false
  print(oneOrMore.hasMatch('wow')); // => true
  print(oneOrMore.hasMatch('wooow')); // => true
  print(oneOrMore.hasMatch('wooooooow')); // => true

  final zeroOrMore = RegExp('wo*w');
  print(zeroOrMore.hasMatch('ww')); // => true
  print(zeroOrMore.hasMatch('wow')); // => true
  print(zeroOrMore.hasMatch('wooow')); // => true
  print(zeroOrMore.hasMatch('wooooooow')); // => true

  final anyOneOrMore = RegExp('w.+w');
  print(anyOneOrMore.hasMatch('ww')); // => false
  print(anyOneOrMore.hasMatch('wow')); // => true
  print(anyOneOrMore.hasMatch('w123w')); // => true
  print(anyOneOrMore.hasMatch('w1ABCDEFGw')); // => true
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Matching Sets of Characters
  final set = RegExp('b[oa]t');
  print(set.hasMatch('bat')); // => true
  print(set.hasMatch('bot')); // => true
  print(set.hasMatch('but')); // => false
  print(set.hasMatch('boat')); // => false
  print(set.hasMatch('bt')); // => false

  final letters = RegExp('[a-zA-Z]');
  print(letters.hasMatch('a')); // => true
  print(letters.hasMatch('H')); // => true
  print(letters.hasMatch('3z')); // => true
  print(letters.hasMatch('2')); // => false

  final excluded = RegExp('b[^ao]t');
  print(excluded.hasMatch('bat')); // => false
  print(excluded.hasMatch('bot')); // => false
  print(excluded.hasMatch('but')); // => true
  print(excluded.hasMatch('boat')); // => false
  print(excluded.hasMatch('bt')); // => false
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Escaping Special Characters
  final escaped = RegExp(r'c\.t');
  print(escaped.hasMatch('c.t')); // true
  print(escaped.hasMatch('cat'));
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  // ## Matching the Beginning and End
  final numbers = RegExp('r[0-9]');
  print(numbers.hasMatch('5552021')); // => false
  print(numbers.hasMatch('abcefg2')); // => false

  final onlyNumbers = RegExp(r'^[0-9]+$');
  print(onlyNumbers.hasMatch('5552021')); // => true
  print(onlyNumbers.hasMatch('abcefg2')); // => false

  // ## Example: Validating a Password
  const password = 'Password1234';

  final lowerCase = RegExp(r'[a-z]');
  final upppercase = RegExp(r'[A-Z]');
  final number = RegExp(r'[0-9]');

  if (!password.contains(lowerCase)) {
    print('Your password must have a lowercase letter!');
  } else if (!password.contains(upppercase)) {
    print('Your password must have an uppercase letter!');
  } else if (!password.contains(number)) {
    print('Your password must have a number!');
  } else {
    print('You password is OK.');
  }

  if (password.length < 12) {
    print('Your password must be at least 12 characters long!');
  }

  final goodLength = RegExp(r'.{12,}');
  if (!password.contains(goodLength)) {
    print('Your password must be at least 12 characters long!');
  }

  // ## Regex Summary
}

// # Extracting text
void extractingText() {
  // ## Extracting Text with Substring
  // ### Finding a Single Match
  const htmlText = '''
<!DOCTYPE html>
<html>
<body>
<h1>Dart Tutorial</h1>
<p>Dart is my favorite language.</p>
</body>
</html>
''';

  final heading = htmlText.substring(34, 47);
  print(heading);

  final start = htmlText.indexOf('<h1>') + '<h1>'.length;
  final end = htmlText.indexOf('</h1>');
  final heading2 = htmlText.substring(start, end);
  print(heading2);

  // ### Finding Multiple Matches
  const text = '''
<h1>Dart Tutorial</h1>
<h1>Flutter Tutorial</h1>
<h1>Other Tutorials</h1>
''';

  var position = 0;
  while (true) {
    var start = text.indexOf('<h1>', position) + '<h1>'.length;
    var end = text.indexOf('</h1>', position);
    if (start == -1 || end == -1) {
      break;
    }
    final heading = text.substring(start, end);
    print(heading);
    position = end + '</h1>'.length;
  }

  // ### Extracting Text With Regex Groups
  // 1
  final headings = RegExp(r'<h1>(.+)</h1>');
  // 2
  final matches = headings.allMatches(text);

  for (final match in matches) {
    // 3
    print(match.group(1));
  }
}
