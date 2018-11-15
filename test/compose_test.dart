import 'package:test/test.dart';
import 'package:compose/compose.dart';

void main() {
  var plusOne = (int x) => x + 1;
  var minusOne = (int x) => x - 1;
  var multiplication = (int x) => x * 2;

  var capitalize = (String s) => s[0].toUpperCase() + s.substring(1);
  var toLower = (String s) => s.toLowerCase();
  var toUpper = (String s) => s.toUpperCase();

  group('With >> operator and right composition', () {
    group('With integer type', () {
      test('Two examples with different positions for functions', () {
        int result = c() >> plusOne >> multiplication > 3;
        int result2 = c() >> multiplication >> plusOne > 3;

        expect(result, 7);
        expect(result2, 8);
      });

      test('Three functions', () {
        int result = c() >> plusOne >> multiplication >> minusOne > 3;

        expect(result, 5);
      });
    });

    group('With string type', () {
      test('Two examples with different positions for functions', () {
        String result = c() >> toLower >> capitalize > 'Abc';
        String result2 = c() >> capitalize >> toLower > 'abc';

        expect(result, 'abc');
        expect(result2, 'Abc');
      });

      test('Three functions', () {
        String result = c() >> capitalize >> toLower >> toUpper > 'Abc';

        expect(result, 'Abc');
      });
    });
  });

  group('With >> operator and left composition', () {
    group('With integer type', () {
      test('Two examples with different positions for functions', () {
        int result = c() >> plusOne >> multiplication < 3;
        int result2 = c() >> multiplication >> plusOne < 3;

        expect(result, 8);
        expect(result2, 7);
      });

      test('Three functions', () {
        int result = c() >> plusOne >> multiplication >> minusOne < 3;

        expect(result, 7);
      });
    });

    group('With string type', () {
      test('Two examples with different positions for functions', () {
        String result = c() >> toLower >> capitalize < 'Abc';
        String result2 = c() >> capitalize >> toLower < 'abc';

        expect(result, 'Abc');
        expect(result2, 'abc');
      });

      test('Three functions', () {
        String result = c() >> capitalize >> toLower >> toUpper < 'Abc';

        expect(result, 'ABC');
      });
    });
  });

  test('With list and its methods', () {
    int result = c() >>
            ((_) => _[2]) >>
            ((_) {
              _.add(3);
              return _;
            }) >
        [1, 2];

    expect(result, 3);
  });
}
