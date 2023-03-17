import 'package:east_asian_width/east_asian_width.dart' as eaw;

void main() {
  // Example using functions
  print(eaw.eastAsianWidth('￦').abbrev); // 'F'
  print(eaw.eastAsianWidth('｡').abbrev); // 'H'
  print(eaw.eastAsianWidth('뀀').abbrev); // 'W'
  print(eaw.eastAsianWidth('a').abbrev); // 'Na'
  print(eaw.eastAsianWidth('①').abbrev); // 'A'
  print(eaw.eastAsianWidth('ف').abbrev); // 'N'

  print(eaw.characterLength('￦')); // 2
  print(eaw.characterLength('｡')); // 1
  print(eaw.characterLength('뀀')); // 2
  print(eaw.characterLength('a')); // 1
  print(eaw.characterLength('①')); // 2
  print(eaw.characterLength('ف')); // 1

  print(eaw.length('あいうえお')); // 10
  print(eaw.length('abcdefg')); // 7
  print(eaw.length('￠￦｡ￜㄅ뀀¢⟭a⊙①بف')); // 19

  // Example using extension
  print('￦'.eastAsianWidth.abbrev); // 'F'
  print('｡'.eastAsianWidth.abbrev); // 'H'
  print('뀀'.eastAsianWidth.abbrev); // 'W'
  print('a'.eastAsianWidth.abbrev); // 'Na'
  print('①'.eastAsianWidth.abbrev); // 'A'
  print('ف'.eastAsianWidth.abbrev); // 'N'

  print('￦'.eawCharacterLength); // 2
  print('｡'.eawCharacterLength); // 1
  print('뀀'.eawCharacterLength); // 2
  print('a'.eawCharacterLength); // 1
  print('①'.eawCharacterLength); // 2
  print('ف'.eawCharacterLength); // 1

  print('あいうえお'.eawLength); // 10
  print('abcdefg'.eawLength); // 7
  print('￠￦｡ￜㄅ뀀¢⟭a⊙①بف'.eawLength); // 19
}
