import 'package:compose/compose.dart';

void main() {
  var addOne = (x) => x + 1;
  var minusOne = (x) => x - 1;
  var add = (x, v) => x + v;

  print(c() >> addOne >> minusOne >> ((_) => add(1, _ * 2)) > 3); // 7
  print(c() >> addOne >> minusOne >> ((_) => add(1, _ * 2)) < 3); // 7

  print(c() * addOne * ((_) => _ * 2) > 4); // 9
  print(c() * addOne * ((_) => _ * 2) < 4); // 10
}