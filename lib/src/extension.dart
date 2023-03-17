import 'east_asian_width_base.dart' as eaw;

/// Extension for using East Asian Width functions directly on [String]
extension EastAsianWidthUtils on String {
  /// Returns an [EastAsianWidth] `enum` indicating the character's East Asian width.
  eaw.EastAsianWidth get eastAsianWidth => eaw.eastAsianWidth(this);

  /// Returns an integer value indicating the length of the character in terms of display width.
  int get eawCharacterLength => eaw.characterLength(this);

  /// Returns the length of the input string in terms of the number of characters.
  int get eawLength => eaw.length(this);

  /// Split a string considering surrogate-pairs.
  Iterable<String> get eawStringToIterable => eaw.stringToIterable(this);

  /// Returns a new String that contains a portion of the original input.
  ///
  /// The function handles `East Asian Width` characters correctly when calculating the indices.
  String eawSlice([int? start, int? end]) => eaw.slice(this, start, end);
}
