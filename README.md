A lightweight library for detecting [East Asian Width](https://www.unicode.org/reports/tr11/) of Unicode characters. Useful for text layout and alignment.

## Features

- Get East Asian Width from a character
- Get length of a single character in terms of display width
- Get length of a `String` in terms of the number of characters
- Split a `String` considering surrogate-pairs
- Slice a `String` with correct handling of East Asian Width characters


## Usage

For more examples, see `/example` and `/test` folders. 

```dart
import 'package:east_asian_width/east_asian_width.dart' as eaw;

// Using functions
print(eaw.eastAsianWidth('뀀').abbrev); // 'W'

// Using extension on Strings
print('뀀'.eastAsianWidth.abbrev); // 'W'
```

## Additional information

Ported from Javascript. Original code can be found [HERE](https://github.com/komagata/eastasianwidth)
