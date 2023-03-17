import 'package:east_asian_width/east_asian_width.dart' as eaw;
import 'package:test/test.dart';

void main() {
  group('eastAsianWidth', () {
    test('Fullwidth', () {
      expect(eaw.eastAsianWidth('￠').abbrev, equals('F'));
      expect(eaw.eastAsianWidth('￦').abbrev, equals('F'));
    });

    test('Halfwidth', () {
      expect(eaw.eastAsianWidth('｡').abbrev, equals('H'));
      expect(eaw.eastAsianWidth('ￜ').abbrev, equals('H'));
    });

    test('Wide', () {
      expect(eaw.eastAsianWidth('ㄅ').abbrev, equals('W'));
      expect(eaw.eastAsianWidth('뀀').abbrev, equals('W'));
    });

    test('Narrow', () {
      expect(eaw.eastAsianWidth('¢').abbrev, equals('Na'));
      expect(eaw.eastAsianWidth('⟭').abbrev, equals('Na'));
      expect(eaw.eastAsianWidth('a').abbrev, equals('Na'));
    });

    test('Ambiguous', () {
      expect(eaw.eastAsianWidth('⊙').abbrev, equals('A'));
      expect(eaw.eastAsianWidth('①').abbrev, equals('A'));
    });

    test('Natural', () {
      expect(eaw.eastAsianWidth('ب').abbrev, equals('N'));
      expect(eaw.eastAsianWidth('ف').abbrev, equals('N'));
    });
  });

  group('characterLength', () {
    test('Fullwidth', () {
      expect(eaw.characterLength('￠'), equals(2));
      expect(eaw.characterLength('￦'), equals(2));
      expect(eaw.characterLength('𩸽'), equals(2));
    });

    test('Halfwidth', () {
      expect(eaw.characterLength('｡'), equals(1));
      expect(eaw.characterLength('ￜ'), equals(1));
    });

    test('Wide', () {
      expect(eaw.characterLength('ㄅ'), equals(2));
      expect(eaw.characterLength('뀀'), equals(2));
    });

    test('Narrow', () {
      expect(eaw.characterLength('¢'), equals(1));
      expect(eaw.characterLength('⟭'), equals(1));
      expect(eaw.characterLength('a'), equals(1));
    });

    test('Ambiguous', () {
      expect(eaw.characterLength('⊙'), equals(2));
      expect(eaw.characterLength('①'), equals(2));
    });

    test('Natural', () {
      expect(eaw.characterLength('ب'), equals(1));
      expect(eaw.characterLength('ف'), equals(1));
    });
  });

  group('stringToIterable', () {
    test('Fullwidth', () {
      expect(eaw.stringToIterable("あいうえお"), equals(["あ", "い", "う", "え", "お"]));
    });
    test('Halfwidth', () {
      expect(
        eaw.stringToIterable("abcdefg"),
        equals(["a", "b", "c", "d", "e", "f", "g"]),
      );
    });
    test('Mixed', () {
      expect(
        eaw.stringToIterable("￠￦｡ￜㄅ뀀¢⟭a⊙①بف"),
        equals(
            ["￠", "￦", "｡", "ￜ", "ㄅ", "뀀", "¢", "⟭", "a", "⊙", "①", "ب", "ف"]),
      );
    });

    test('Surrogate-Pair character included', () {
      expect(
        eaw.stringToIterable("a𩸽b"),
        equals(["a", "𩸽", "b"]),
      );
    });
  });

  group('length', () {
    test('Fullwidth', () {
      expect(eaw.length('あいうえお'), equals(10));
    });

    test('Halfwidth', () {
      expect(eaw.length('abcdefg'), equals(7));
    });

    test('Mixed', () {
      expect(eaw.length('￠￦｡ￜㄅ뀀¢⟭a⊙①بف'), equals(19));
    });

    test('Surrogate-Pair character included', () {
      expect(eaw.length('a𩸽b'), equals(4));
    });
  });

  group('slice', () {
    test('Fullwidth', () {
      expect(eaw.slice('あいうえお', 0, 6), 'あいう');
      expect(eaw.slice('あいうえお', 2, 8), 'いうえ');
      expect(eaw.slice('あいうえお', 4, 10), 'うえお');
      expect(eaw.slice('あいうえお', 2, -2), 'いうえ');
      expect(eaw.slice('あいうえお', -2, 10), 'お');
    });
    test('Fullwidth, start / end is not aligned', () {
      expect(eaw.slice('あいうえお', 0, 1), '');
      expect(eaw.slice('あいうえお', 1, 9), 'あいうえ');
      expect(eaw.slice('あいうえお', 9, 10), 'お');
      expect(eaw.slice('あいうえお', -1, 10), 'お');
      expect(eaw.slice('あいうえお', 1, -1), 'あいうえ');
    });
    test('Halfwidth', () {
      expect(eaw.slice('abcdefg', 0, 3), 'abc');
      expect(eaw.slice('abcdefg', 3, 6), 'def');
      expect(eaw.slice('abcdefg', -2, 7), 'fg');
      expect(eaw.slice('abcdefg', 5, -1), 'f');
    });
    test('Mixed', () {
      expect(eaw.slice('aあb', 0, 3), 'aあ');
      expect(eaw.slice('aあb', 1, 4), 'あb');
    });
    test('Mixed, start / end is not aligned', () {
      expect(eaw.slice('aあb', 0, 2), 'a');
      expect(eaw.slice('aあb', 2, 4), 'あb');
      expect(eaw.slice('aあb', -2, 4), 'あb');
      expect(eaw.slice('aあb', 2, -1), 'あ');
      expect(eaw.slice('aあb', 0, 2) + eaw.slice('aあb', 2, 4), 'aあb');
    });
    test('Surrogate-Pair character included', () {
      expect(eaw.slice('a𩸽b', 0, 3), 'a𩸽');
      expect(eaw.slice('a𩸽b', 1, 4), '𩸽b');
    });
    test('Surrogate-Pair character included, start / end is not aligned', () {
      expect(eaw.slice('a𩸽b', 0, 2), 'a');
      expect(eaw.slice('a𩸽b', 2, 4), '𩸽b');
    });
  });
}
